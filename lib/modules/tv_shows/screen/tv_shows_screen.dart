import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_databases/data/local/databases/entity/tv_shows.dart';
import 'package:the_movie_databases/modules/tv_shows/view_model/tv_shows_view_model.dart';
import 'package:the_movie_databases/utils/constant.dart';
import 'package:the_movie_databases/widgets/scroll_aware_fab.dart';

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
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
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
                        "Tv Shows"
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
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: widget.viewModel.isLoadingMore,
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
                    visible: !widget.viewModel.hasMore,
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
      ),
      floatingActionButton: ScrollAwareFab(scrollController: _scrollController,),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,) {
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
            value: widget.viewModel.selectedFilter,
            items: Constant.tvFilter.map((e) {
              return DropdownMenuItem<String>(
                value: e['value']!,
                child: Text(e['name']!),
              );
            }).toList(),
            onChanged: (value) {
              widget.viewModel.updateSelectedFilter(value!);
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
