import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_databases/data/local/databases/entity/tv_shows.dart';
import 'package:the_movie_databases/modules/tv_shows/view_model/tv_shows_view_model.dart';

import '../../../config/routes.dart';
import '../../../widgets/rate_widget.dart';

class TvShowsScreen extends StatefulWidget {
  const TvShowsScreen({super.key, required this.viewModel});

  final TvShowsViewModel viewModel;

  @override
  State<TvShowsScreen> createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  final _scrollController = ScrollController();
  String tvShowsFilter = 'Popular';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.fetchTvShows();
      _scrollController.addListener(_loadMore);
    });
  }

  void _loadMore() {
    final pixels = _scrollController.position.pixels;
    final maxExtent = _scrollController.position.maxScrollExtent;
    final threshold = maxExtent * 0.8;

    if (pixels >= threshold) {
      if (!widget.viewModel.isLoadingMore) {
        print('Loading more TV shows...');
        widget.viewModel.loadMoreTvShows();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        if (widget.viewModel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (widget.viewModel.tvShows.isEmpty) {
          return const Center(child: Text("No data available"));
        }

        return RefreshIndicator(
          onRefresh: () async {
            widget.viewModel.refresh();
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildSectionTitle(
                      context,
                      "Tv Shows",
                      filters: [
                        'Popular',
                        'Now Playing',
                        'Upcoming',
                        'Top Rated'
                      ],
                      onFilterChanged: (value) {
                        setState(() {
                          // Handle filter changes here
                        });
                      },
                    ),
                  ]),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final tvShows = widget.viewModel.tvShows[index];
                      final String title = tvShows.name;
                      final String imagePath =
                          'https://image.tmdb.org/t/p/w500${tvShows.posterPath}';
                      final double rating = tvShows.voteAverage;
                      final String releaseDate = tvShows.firstAirDate;

                      return Padding(
                        padding: EdgeInsets.zero,
                        child: IntrinsicHeight(
                          child: _buildCard(
                              title, imagePath, rating, releaseDate, tvShows),
                        ),
                      );
                    },
                    childCount: widget.viewModel.tvShows.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.5,
                  ),
                ),
              ),
              // if (widget.viewModel.isLoadingMore)
              //   const SliverToBoxAdapter(
              //     child: Padding(
              //       padding: EdgeInsets.all(16.0),
              //       child: Center(
              //         child: CircularProgressIndicator(),
              //       ),
              //     ),
              //   ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title, {
    List<String>? filters,
    ValueChanged<String?>? onFilterChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (filters != null && filters.isNotEmpty)
          DropdownButton<String>(
            value: filters.first,
            items: filters.map((filter) {
              return DropdownMenuItem<String>(
                value: filter,
                child: Text(filter),
              );
            }).toList(),
            onChanged: (value) {
              if (onFilterChanged != null) {
                onFilterChanged(value); // Optional callback
              }
            },
          ),
      ],
    );
  }

  Widget _buildCard(String title, String imagePath, double rating,
      String releaseDate, TvShows tvShows) {
    return GestureDetector(
      onTap: () => context.push(Routes.detail, extra: tvShows),
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
