import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_movie_databases/modules/favourites/view_model/favourites_view_model.dart';

import '../../../config/routes.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key, required this.viewModel});

  final FavouritesViewModel viewModel;

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen>
    with AutomaticKeepAliveClientMixin {
  final _moviesScrollController = ScrollController();
  final _tvShowsScrollController = ScrollController();
  late double cardHeight;
  late double backDropHeight;
  late double imageCardHeight;
  late double screenHeight;
  FocusNode? _moviesFocusNode;
  FocusNode? _tvShowsFocusNode;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _moviesFocusNode = FocusNode();
    _tvShowsFocusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _moviesScrollController.addListener(_loadMoreMovies);
      _tvShowsScrollController.addListener(_loadMoreTvShows);
      widget.viewModel.fetchFavourites();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;

    // Calculate the ratios for each element's height based on screen height
    cardHeight =
        screenHeight * 0.15; // 15% of the screen height for card height
    backDropHeight = cardHeight * 1; // 40% for the backdrop
    imageCardHeight = cardHeight * 0.95; // 30% for the image card

    // You can adjust the ratios above based on your UI design requirements
    setState(() {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final route = ModalRoute.of(context);
      if (route != null && route.isCurrent) {
        widget.viewModel.clearListsMovies();
        widget.viewModel.clearListsTvShows();
        widget.viewModel.fetchFavourites();
      }
    });
  }

  void _loadMoreTvShows() {
    if (_tvShowsScrollController.position.pixels ==
        _tvShowsScrollController.position.maxScrollExtent) {
      widget.viewModel.loadMoreTvShows();
    }
  }

  void _loadMoreMovies() {
    if (_moviesScrollController.position.pixels ==
        _moviesScrollController.position.maxScrollExtent) {
      widget.viewModel.loadMoreMovies();
    }
  }

  @override
  void dispose() {
    _moviesScrollController.dispose();
    _tvShowsScrollController.dispose();
    _moviesFocusNode?.dispose();
    _tvShowsFocusNode?.dispose();
    super.dispose();
  }

  Widget _buildMoviesTab() {
    return RefreshIndicator(
      onRefresh: () async => widget.viewModel.refreshFavouritesMovies(),
      child: widget.viewModel.isMoviesLoading
          ? const Center(child: CircularProgressIndicator())
          : widget.viewModel.listOfFavouritesMovies.isEmpty
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 300),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.movie_outlined, size: 48),
                          SizedBox(height: 16),
                          Text(
                            textAlign: TextAlign.center,
                              'Your Favorites Movies is Empty \nStart Liking Some Movies!'),
                        ],
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _moviesScrollController,
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                  scrollDirection: Axis.vertical,
                  itemCount: widget.viewModel.listOfFavouritesMovies.length,
                  itemBuilder: (context, index) {
                    final item = widget.viewModel.listOfFavouritesMovies[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context).colorScheme.surfaceContainer
                            : Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white.withOpacity(
                                        0.0) // Light shadow for dark theme
                                    : Colors.black.withOpacity(0.2),
                            blurRadius: 3.0, // How much the shadow spreads
                            offset: const Offset(
                                0, 4), // Shadow position (horizontal, vertical)
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          context.push(Routes.detail, extra: item);
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  'https://image.tmdb.org/t/p/w500${item.backdropPath}',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: backDropHeight,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
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
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    height: backDropHeight,
                                    width: double.infinity,
                                    color: Colors.grey,
                                    child: const Icon(Icons.error,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: imageCardHeight / 2),
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  width: double.infinity,
                                  child: Text(
                                    'Release Date: ${item.releaseDate}',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    item.overview,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                              ],
                            ),
                            Positioned.fill(
                              left: 16,
                              top: -imageCardHeight / 2,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${item.posterPath}',
                                    fit: BoxFit.cover,
                                    height: imageCardHeight + 16,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child; // Image has finished loading
                                      }

                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          height: imageCardHeight + 16,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      height: imageCardHeight + 16,
                                      color: Colors.grey,
                                      child: const Icon(Icons.error,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  Widget _buildTvShowsTab() {
    return RefreshIndicator(
      onRefresh: () => widget.viewModel.refreshFavouritesTvShows(),
      child: widget.viewModel.isTvShowsLoading
          ? const Center(child: CircularProgressIndicator())
          : widget.viewModel.listOfFavouritesTvShows.isEmpty
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 300),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.tv_off_rounded, size: 48),
                          SizedBox(height: 16),
                          Text(
                              'Your Favorites Tv Shows is Empty \nStart Liking Some Tv Show!'),
                        ],
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _tvShowsScrollController,
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                  scrollDirection: Axis.vertical,
                  itemCount: widget.viewModel.listOfFavouritesTvShows.length,
                  itemBuilder: (context, index) {
                    final item =
                        widget.viewModel.listOfFavouritesTvShows[index];

                    return InkWell(
                      onTap: () {
                        context.push(Routes.detail, extra: item);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Theme.of(context).colorScheme.surfaceContainer
                              : Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white.withOpacity(
                                      0.0) // Light shadow for dark theme
                                  : Colors.black.withOpacity(0.2),
                              blurRadius: 3.0, // How much the shadow spreads
                              offset: const Offset(0,
                                  4), // Shadow position (horizontal, vertical)
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  'https://image.tmdb.org/t/p/w500${item.backdropPath}',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: backDropHeight,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
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
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    height: backDropHeight,
                                    width: double.infinity,
                                    color: Colors.grey,
                                    child: const Icon(Icons.error,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: imageCardHeight / 2),
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    item.name,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  width: double.infinity,
                                  child: Text(
                                    'Release Date: ${item.firstAirDate}',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    item.overview,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                              ],
                            ),
                            Positioned.fill(
                              left: 16,
                              top: -imageCardHeight / 2,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${item.posterPath}',
                                    fit: BoxFit.cover,
                                    height: imageCardHeight + 16,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child; // Image has finished loading
                                      }

                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          height: imageCardHeight + 16,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      height: imageCardHeight + 16,
                                      color: Colors.grey,
                                      child: const Icon(Icons.error,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Favourites',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              automaticallyImplyLeading: false,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'Movies',
                  ),
                  Tab(
                    text: 'Tv Show',
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Focus(
                    focusNode: _moviesFocusNode,
                    onFocusChange: (hasFocus) {
                      if (hasFocus) {
                        widget.viewModel.clearListsMovies();
                        widget.viewModel.fetchFavouritesMovies();
                      }
                    },
                    child: _buildMoviesTab()),
                Focus(
                    focusNode: _tvShowsFocusNode,
                    onFocusChange: (hasFocus) {
                      if (hasFocus) {
                        widget.viewModel.clearListsTvShows();
                        widget.viewModel.fetchFavouritesTvShows();
                      }
                    },
                    child: _buildTvShowsTab()),
              ],
            ),
          ),
        );
      },
    );
  }
}
