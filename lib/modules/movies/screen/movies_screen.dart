import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_databases/data/local/databases/entity/movies.dart';
import 'package:the_movie_databases/modules/movies/view_model/movies_view_model.dart';

import '../../../config/routes.dart';
import '../../../widgets/rate_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

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
      final moviesViewModel =
          Provider.of<MoviesViewModel>(context, listen: false);
      moviesViewModel.fetchMovies();

      _scrollController.addListener(_loadMore);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Provider.of<MoviesViewModel>(context, listen: false).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.movies.isEmpty) {
          return const Center(child: Text('No data for movies'));
        }
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
                    filters: [
                      'Popular',
                      'Now Playing',
                      'Upcoming',
                      'Top Rated'
                    ],
                    onFilterChanged: (value) {
                      setState(() {
                        moviesFilter = value!;
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
                    final movie = viewModel.movies[index];
                    final String title = movie.title;
                    final String imagePath =
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}';
                    final double rating = movie.voteAverage;
                    final String releaseDate = movie.releaseDate;

                    return Padding(
                      padding: EdgeInsets.zero,
                      child: IntrinsicHeight(
                        child:
                        _buildCard(title, imagePath, rating, releaseDate, movie),
                      ),
                    );
                  },
                  childCount: viewModel.movies.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.5, // Adjusted aspect ratio
                ),
              ),
            ),
          ],
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

  Widget _buildCard(
      String title, String imagePath, double rating, String releaseDate, Movies movie) {
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
