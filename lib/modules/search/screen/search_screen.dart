import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_movie_databases/modules/search/view_model/search_view_model.dart';

import '../../details/screen/details_screen.dart';
import '../../details/view_model/details_view_model.dart';

const Duration getAPIDuration = Duration(seconds: 2);
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
  late double backDropHeight;
  late double screenHeight;

  late final _Debounceable _debouncedSearch;

  String? _currentQuery;

  Future<List<Map<String, String>>?> _suggestion(String query) async {
    if (query.isEmpty) {
      setState(() {
        widget.viewModel.clearResults();
      });
      return null;
    }

    _currentQuery = query;
    final options = await widget.viewModel.suggestion(query);

    widget.viewModel.setQuery(query);

    if (query != _currentQuery) {
      return null;
    }
    _currentQuery = null;

    return options;
  }

  void _onSuggestionSelected(dynamic suggestion) {
    widget.viewModel.clearResults();
    final query = suggestion['name'] as String;
    _searchController.text = query;
    widget.viewModel.search(query);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _debouncedSearch = _debounce(_suggestion);
    _setupScrollListener();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    screenHeight = MediaQuery.of(context).size.height;

    cardHeight =
        screenHeight * 0.15; // 15% of the screen height for card height
    backDropHeight = cardHeight * 1; // 40% for the backdrop
    imageCardHeight = cardHeight * 0.95; // 30% for the image card

    setState(() {});
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

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                SearchBar(
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
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(
                      color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                ),
                hintText: "Search movies, TV shows, or people...",
                leading: Icon(Icons.search, color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,),
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
                  widget.viewModel.clearResults();
                  if (value.isNotEmpty) {
                    widget.viewModel.search(value);
                  }
                },
                onChanged: (value) {
                  _debouncedSearch(value);
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
    if(widget.viewModel.suggestionResults.isNotEmpty){
      final suggestions = widget.viewModel.suggestionResults;
      final topMatches = <Map<String, String>>[];
      final restSuggestions = <Map<String, String>>[];

      for (var item in suggestions) {
        if (['movie', 'tv', 'person'].contains(item['media_type']) &&
            topMatches.length < 3) {
          topMatches.add(item);
        } else {
          restSuggestions.add(item);
        }
      }

      if (topMatches.isEmpty && _searchController.text.isNotEmpty) {
        topMatches.add({
          'name': _searchController.text,
          'media_type': 'search',
        });
      }

      final displaySuggestions = [...topMatches, ...restSuggestions];

      return ListView.builder(
        itemCount: widget.viewModel.suggestionResults.length,
        itemBuilder: (context, index) {
          final suggestion = displaySuggestions[index];
          final icon = index < topMatches.length
              ? _getSuggestionIcon(suggestion['media_type'])
              : const Icon(Icons.search);

          return ListTile(
            leading: icon,
            title: Text(suggestion['name'] ?? ''),
            subtitle: Text(
              suggestion['media_type']?.toUpperCase() ?? '',
            ),
            onTap: () => _onSuggestionSelected(suggestion),
          );
        },
      );
    }

    if (widget.viewModel.isLoading && widget.viewModel.searchResults.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (widget.viewModel.searchResults.isEmpty &&
        _searchController.text.isNotEmpty) {
      return const Center(child: Text('No results found'));
    }

    if (widget.viewModel.query.isEmpty) {
      return const Center(
        child: Text('Try searching with human word.'),
      );
    }

    if (_searchController.text.isEmpty) {
      return const Center(
        child: Text('Try searching with human word.'),
      );
    }

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
            return buildCard(
              context: context,
              data: widget.viewModel.convertToMovie(item),
              title: widget.viewModel.convertToMovie(item).title,
              releaseDate: widget.viewModel.convertToMovie(item).releaseDate,
              overview: widget.viewModel.convertToMovie(item).overview,
              posterPath: widget.viewModel.convertToMovie(item).posterPath,
              backdropPath: widget.viewModel.convertToMovie(item).backdropPath,
            );
          } else if (mediaType == 'tv') {
            return buildCard(
              context: context,
              data: widget.viewModel.convertToTvShow(item),
              title: widget.viewModel.convertToTvShow(item).name,
              releaseDate: widget.viewModel.convertToTvShow(item).firstAirDate,
              overview: widget.viewModel.convertToTvShow(item).overview,
              posterPath: widget.viewModel.convertToTvShow(item).posterPath,
              backdropPath: widget.viewModel.convertToTvShow(item).backdropPath,
            );
          } else if (mediaType == 'person') {
            final person = widget.viewModel.convertToPerson(item);
            final gender = person.gender == 0
                ? 'Undefined'
                : person.gender == 1
                    ? 'Female'
                    : person.gender == 2
                        ? 'Male'
                        : 'Other';

            return buildCard(
              context: context,
              data: widget.viewModel.convertToPerson(item),
              title: widget.viewModel.convertToPerson(item).name,
              releaseDate: widget.viewModel.convertToPerson(item).originalName,
              overview: gender,
              posterPath: widget.viewModel.convertToPerson(item).profilePath,
              backdropPath: widget.viewModel.convertToPerson(item).profilePath,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget buildCard({
    required BuildContext context,
    required dynamic data,
    required String title,
    required String releaseDate,
    required String overview,
    required String posterPath,
    required String backdropPath,
  }) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      child: InkWell(
        onTap: () {
          final viewModel = DetailsViewModel(
              detailsRepository: context.read(),
              favouritesRepository: context.read(),
              sharedPreferencesService: context.read());
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailsScreen(data: data, viewModel: viewModel);
          }));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500$backdropPath',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: backDropHeight,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Image has finished loading
                      }
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: backDropHeight,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: backDropHeight,
                      width: double.infinity,
                      color: Colors.grey,
                      child: const Icon(Icons.error, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: imageCardHeight / 2),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: double.infinity,
                    child: Text(
                      releaseDate,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w200),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: double.infinity,
                    child: Text(
                      overview,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                left: 16,
                top: -imageCardHeight / 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: imageCardHeight + 16,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500$posterPath',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child; // Image has finished loading
                          }
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.grey,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey,
                          child: const Icon(Icons.error, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}

typedef _Debounceable = Future<List<Map<String, String>>?> Function(String parameter);

_Debounceable _debounce(Future<List<Map<String, String>>?> Function(String) function) {
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
