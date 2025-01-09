import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_databases/data/local/databases/entity/movies.dart';
import 'package:the_movie_databases/modules/movies/view_model/movies_view_model.dart';
import 'package:the_movie_databases/widgets/scroll_aware_fab.dart';

import '../../../config/routes.dart';
import '../../../utils/constant.dart';
import '../../../widgets/rate_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key, required this.moviesViewModel});

  final MoviesViewModel moviesViewModel;

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final _scrollController = ScrollController();
  String moviesFilter = 'Popular';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.moviesViewModel.fetchMovies();

      _scrollController.addListener(_loadMore);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    final pixels = _scrollController.position.pixels;
    final maxExtent = _scrollController.position.maxScrollExtent;
    final threshold = maxExtent * 0.8;

    if (pixels >= threshold) {
      if (!widget.moviesViewModel.isLoadingMore && widget.moviesViewModel.hasMore) {
        widget.moviesViewModel.loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          widget.moviesViewModel.refresh();
        },
        child: ListenableBuilder(
          listenable: widget.moviesViewModel,
          builder: (context, child) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildSectionTitle(
                        context,
                        "Movies",
                      ),
                    ]),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: widget.moviesViewModel.isLoading
                      ? const SliverFillRemaining(
                          child: SizedBox(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )
                      : widget.moviesViewModel.movies.isEmpty
                          ? const SliverFillRemaining(
                              child: SizedBox(
                                child: Center(
                                  child: Text('No data for movies'),
                                ),
                              ),
                            )
                          : SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final movie =
                                      widget.moviesViewModel.movies[index];
                                  final String title = movie.title;
                                  final String imagePath =
                                      'https://image.tmdb.org/t/p/w500${movie.posterPath}';
                                  final double rating = movie.voteAverage;
                                  final String releaseDate = movie.releaseDate;

                                  return Padding(
                                    padding: EdgeInsets.zero,
                                    child: IntrinsicHeight(
                                      child: _buildCard(title, imagePath,
                                          rating, releaseDate, movie),
                                    ),
                                  );
                                },
                                childCount:
                                    widget.moviesViewModel.movies.length,
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.5, // Adjusted aspect ratio
                              ),
                            ),
                ),
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: widget.moviesViewModel.isLoadingMore,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text('Loading...'),
                          SizedBox(
                            height: 8.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: !widget.moviesViewModel.hasMore,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 4.0,
                          ),
                          Text('Yay!, You reach the bottom!🎊🎉'),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: ScrollAwareFab(
        scrollController: _scrollController,
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        DropdownButton<String>(
          value: widget.moviesViewModel.selectedFilter,
          items: Constant.movieFilter.map((filter) {
            return DropdownMenuItem<String>(
              value: filter['value']!,
              child: Text(filter['name']!),
            );
          }).toList(),
          onChanged: (value) {
            widget.moviesViewModel.updateSelectedFilter(value!);
          },
        ),
      ],
    );
  }

  Widget _buildCard(String title, String imagePath, double rating,
      String releaseDate, Movies movie) {
    return GestureDetector(
      onTap: () => context.push(Routes.detail, extra: movie),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 0.7,
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey,
                      child: const Icon(Icons.error, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: CircularProgressIndicatorWithPercentage(
                    percentage: (rating * 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 150),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 150),
            child: Text(
              releaseDate,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
