import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_databases/data/local/databases/entity/people.dart';
import 'package:the_movie_databases/modules/people/view_model/people_view_model.dart';
import 'package:the_movie_databases/widgets/scroll_aware_fab.dart';

import '../../../config/routes.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key, required this.viewModel});

  final PeopleViewModel viewModel;

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.fetchPeople();
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
      if (!widget.viewModel.isLoadingMore && widget.viewModel.hasMore) {
        print('Loading more people...');
        widget.viewModel.loadMorePeople();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          widget.viewModel.refreshPeople();
        },
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, child) {
            return CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildSectionTitle(
                        context,
                        "People",
                      ),
                    ]),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final people = widget.viewModel.people[index];
                        final String title = people.name;
                        final String imagePath = 'https://image.tmdb.org/t/p/w500${people.profilePath}';
                        final double rating = people.popularity;
                        final String releaseDate = people.originalName;

                        return Padding(
                          padding: EdgeInsets.zero,
                          child: IntrinsicHeight(
                            child: _buildCard(title, imagePath, rating, releaseDate, people),
                          ),
                        );
                      },
                      childCount: widget.viewModel.people.length,
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

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String title, String imagePath, double rating, String releaseDate, People people) {
    return GestureDetector(
      onTap: () => context.push(Routes.detail, extra: people),
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
              // Positioned(
              //   top: 8,
              //   right: 8,
              //   child: Container(
              //     padding: const EdgeInsets.all(4),
              //     decoration: BoxDecoration(
              //       color: Colors.black.withOpacity(0.7),
              //       shape: BoxShape.circle,
              //     ),
              //     child: CircularProgressIndicatorWithPercentage(
              //       percentage: (rating * 10),
              //     ),
              //   ),
              // ),
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
