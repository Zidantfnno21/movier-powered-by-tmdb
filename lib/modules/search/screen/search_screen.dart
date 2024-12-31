import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_databases/data/local/databases/entity/movies.dart';
import 'package:the_movie_databases/modules/search/view_model/search_view_model.dart';

import '../../../config/routes.dart';
import '../../../data/local/databases/entity/people.dart';
import '../../../data/local/databases/entity/tv_shows.dart';

const Duration getAPIDuration = Duration(seconds: 1);
const Duration debounceDuration = Duration(milliseconds: 500);

class SearchScreen extends StatefulWidget {
  final SearchViewModel viewModel;
  const SearchScreen({super.key, required this.viewModel});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();
  final _searchController = SearchController();
  final PageStorageBucket _bucket = PageStorageBucket();
  final _pageStrKey = const PageStorageKey('SearchList');

  late double imageCardHeight;
  late double cardHeight;

  late final _Debounceable _debouncedSearch;

  String? _currentQuery;
  bool _isCurrentRoute = false;

  static const String _searchResultsKey = 'search_results';

  Future<Iterable<dynamic>?> _search(String query) async {
    if (query.isEmpty) {
      setState(() {
        widget.viewModel.clearResults();
      });
      return null;
    }

    _currentQuery = query;
    final options = await widget.viewModel.search(query);

    widget.viewModel.setQuery(query);

    if (query != _currentQuery) {
      return null;
    }
    _currentQuery = null;

    return options;
  }

  void _onSuggestionSelected(dynamic suggestion) {
    final query = suggestion['name'] as String;
    _searchController.text = query;
    widget.viewModel.search(query);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _debouncedSearch = _debounce(_search);
    _setupScrollListener();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restoreState();
    });
  }

  void _restoreState() {
    final savedState =
        _bucket.readState(context, identifier: _searchResultsKey);
    if (savedState != null) {
      final savedQuery = savedState['query'] as String?;
      final savedResults = savedState['results'] as List<dynamic>?;
      final lastQuery = savedState['lastQuery'] as String?;

      if (savedQuery != null) {
        setState(() {
          _searchController.text = savedQuery;
          if (savedResults != null) {
            widget.viewModel.restoreSearchResults(savedResults);
          }
          if (lastQuery != null) {
            widget.viewModel.setQuery(lastQuery);
          }
        });
      }
    }
  }

  void _saveCurrentState() {
    if (_searchController.text.isNotEmpty) {
      _bucket.writeState(
        context,
        {
          'query': _searchController.text,
          'results': widget.viewModel.searchResults,
          'lastQuery': widget.viewModel.lastQuery,
        },
        identifier: _searchResultsKey,
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    cardHeight = MediaQuery.of(context).size.height * 0.4;
    imageCardHeight = cardHeight * 0.8;

    _isCurrentRoute = ModalRoute.of(context)?.isCurrent ?? false;
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.viewModel.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        if (widget.viewModel.lastQuery.isNotEmpty &&
            _searchController.text.isEmpty) {
          _searchController.text = widget.viewModel.lastQuery;
        }

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SearchAnchor(
                    searchController: _searchController,
                    builder: (context, controller) {
                      return SearchBar(
                        controller: _searchController,
                        elevation: WidgetStateProperty.all(0),
                        backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).canvasColor,
                        ),
                        shadowColor:
                            WidgetStateProperty.all(Colors.transparent),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                          ),
                        ),
                        hintText: "Search movies, TV shows, or people...",
                        leading: const Icon(Icons.search),
                        trailing: [
                          if (_searchController.text.isNotEmpty)
                            IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                widget.viewModel.clearResults();
                              },
                            ),
                        ],
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            widget.viewModel.search(value);
                          }
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            _debouncedSearch(value);
                          }
                        },
                      );
                    },
                    suggestionsBuilder: (context, controller) async {
                      final options = await _debouncedSearch(controller.text);
                      return options
                              ?.map((option) => ListTile(
                                    leading: _getSuggestionIcon(
                                        option['media_type'] as String?),
                                    title: Text(option['name'] as String),
                                    subtitle: Text(option['media_type']
                                            ?.toString()
                                            .toUpperCase() ??
                                        ''),
                                    onTap: () => _onSuggestionSelected(option),
                                  ))
                              .toList() ??
                          [];
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: PageStorage(
                      bucket: _bucket,
                      child: _buildSearchResults(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method to get appropriate icons for suggestions
  Widget _getSuggestionIcon(String? mediaType) {
    switch (mediaType) {
      case 'movie':
        return const Icon(Icons.movie);
      case 'tv':
        return const Icon(Icons.tv);
      case 'person':
        return const Icon(Icons.person);
      default:
        return const Icon(Icons.search);
    }
  }

  Widget _buildSearchResults() {
    print('Building search results:');
    print('Results length: ${widget.viewModel.searchResults.length}');
    print('Query: ${widget.viewModel.query}');
    print('Is Loading: ${widget.viewModel.isLoading}');

    if (widget.viewModel.isLoading && widget.viewModel.searchResults.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (widget.viewModel.searchResults.isEmpty &&
        widget.viewModel.query.isNotEmpty) {
      return const Center(child: Text('No results found'));
    }

    if (widget.viewModel.query.isEmpty) {
      return const Center(
        child: Text('Try searching with human word '),
      );
    }

    _saveCurrentState();

    return PageStorage(
      bucket: _bucket,
      child: ListView.builder(
        key: _pageStrKey,
        controller: _scrollController,
        itemCount: widget.viewModel.searchResults.length +
            (widget.viewModel.isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == widget.viewModel.searchResults.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            );
          }

          final item = widget.viewModel.searchResults[index];
          final mediaType = item['media_type'] as String?;

          if (mediaType == 'movie') {
            return movieCard(
              movie: widget.viewModel.convertToMovie(item),
            );
          } else if (mediaType == 'tv') {
            return tvShowCard(
              tvShow: widget.viewModel.convertToTvShow(item),
            );
          } else if (mediaType == 'person') {
            return personCard(
              person: widget.viewModel.convertToPerson(item),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget movieCard({required Movies movie}) {
    return Card(
      color: Theme.of(context).canvasColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      child: InkWell(
        onTap: () {
          context.push(Routes.detail, extra: movie);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                fit: BoxFit.cover,
                height: imageCardHeight, // Adjust the height as needed
                width: double.infinity,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Container(
                    color: Colors
                        .grey[300], // Background color for the error container
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.error_outline, // Icon indicating an error
                      color: Colors.red,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
            // Bottom section with details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Poster image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      fit: BoxFit.cover,
                      width: 60,
                      height: 90,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Container(
                          color: Colors.grey[
                              300], // Background color for the error container
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.error_outline, // Icon indicating an error
                            color: Colors.red,
                            size: 50,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Movie details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          movie.releaseDate,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movie.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tvShowCard({required TvShows tvShow}) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0,
      child: InkWell(
        onTap: () {
          context.push(Routes.detail, extra: tvShow);
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${tvShow.posterPath}',
                fit: BoxFit.cover,
                height: imageCardHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100, // Fixed width for poster
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Theme.of(context).canvasColor,
                        width: 3,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${tvShow.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tvShow.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(tvShow.firstAirDate),
                        const SizedBox(height: 8),
                        Text(
                          tvShow.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget personCard({required People person}) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0,
      child: InkWell(
        onTap: () {
          context.push(Routes.detail, extra: person);
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${person.profilePath}',
                    fit: BoxFit.fitWidth,
                    height: imageCardHeight,
                    width: double.infinity,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Container(
                        color: Colors.grey[
                            300], // Background color for the error container
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.error_outline, // Icon indicating an error
                          color: Colors.red,
                          size: 50,
                        ),
                      );
                    },
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100, // Fixed width for poster
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Theme.of(context).canvasColor,
                        width: 3,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${person.profilePath}',
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Container(
                            color: Colors.grey[
                                300], // Background color for the error container
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.error_outline, // Icon indicating an error
                              color: Colors.red,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          person.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(person.gender == 1 ? 'Female' : 'Male'),
                        const SizedBox(height: 8),
                        Text(
                          person.knownForDepartment,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _saveCurrentState(); // Save state before disposing
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}

typedef _Debounceable = Future<Iterable<dynamic>?> Function(String parameter);

_Debounceable _debounce(Future<Iterable<dynamic>?> Function(String) function) {
  _DebounceTimer? debounceTimer;

  return (String parameter) async {
    if (debounceTimer != null && !debounceTimer!.isCompleted) {
      debounceTimer!.cancel();
    }
    debounceTimer = _DebounceTimer();
    try {
      await debounceTimer!.future;
    } on _CancelException {
      return null;
    }
    return function(parameter);
  };
}

class _DebounceTimer {
  _DebounceTimer() {
    _timer = Timer(debounceDuration, _onComplete);
  }

  late final Timer _timer;
  final Completer<void> _completer = Completer<void>();

  void _onComplete() {
    _completer.complete();
  }

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    _completer.completeError(const _CancelException());
  }
}

class _CancelException implements Exception {
  const _CancelException();
}
