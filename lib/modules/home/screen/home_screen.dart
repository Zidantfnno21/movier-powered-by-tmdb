import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_movie_databases/data/local/databases/entity/people.dart';
import 'package:the_movie_databases/modules/home/view_model/home_view_model.dart';
import 'package:the_movie_databases/utils/constant.dart';
import 'package:the_movie_databases/utils/result.dart';
import 'package:the_movie_databases/widgets/dynamics_sliding_text.dart';

import '../../../data/local/databases/entity/trending.dart';
import '../../../widgets/rate_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double screenHeight;
  late double screenWidth;
  late double listHeight;
  late double cardHeight;
  late double cardWidth;
  late double imageCardHeight;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchAllHomeData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    cardHeight = screenHeight * 0.25;
    imageCardHeight = cardHeight * 0.8;

    listHeight = cardHeight + 16.0;

    const double maxCardWidth = 150.0;
    cardWidth = (screenWidth * 0.4).clamp(100.0, maxCardWidth);
  }

  void _fetchAllHomeData() {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    homeViewModel.fetchTrending();
    homeViewModel.fetchPopular();
    homeViewModel.fetchPopularPeople();
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildSectionTitleTrending(
          context,
          "Trending",
        ),
        _buildHorizontalTrendingList(),
        const SizedBox(height: 16),
        _buildSectionTitlePopular(
          context,
          "Popular!",
        ),
        _buildHorizontalPopularList(),
        const SizedBox(height: 16),
        _buildSectionTitleVariant(context, "Popular People"),
        _buildHorizontalListVariant("Popular People"),
      ],
    );
  }

  Widget _buildSectionTitleTrending(
    BuildContext context,
    String title,
  ) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              DropdownButton<String>(
                value: viewModel.selectedTrendingFilter,
                items: Constant.trendingFilter.toSet().map((filter) {
                  return DropdownMenuItem<String>(
                    value: filter['value'],
                    child: Text(filter['name']!),
                  );
                }).toList(),
                onChanged: (String? selectedFilter) {
                  if (selectedFilter != null) {
                    viewModel.updateSelectedTrendingFilter(selectedFilter);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHorizontalTrendingList() {
    return Consumer<HomeViewModel>(
      builder: (context, notifier, child) {
        final List<Trending> trendingItems = notifier.trendingList;
        final sectionType = notifier.selectedTrendingFilter;
        final state = notifier.trendingState;

        if(notifier.isTrendingLoading) {
          return SizedBox(height: listHeight,child: const Center(child: CircularProgressIndicator()));
        }

        switch(state){
          case Ok<List<Trending>>():
            return SizedBox(
            height: listHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16),
              itemCount: trendingItems.length,
              itemBuilder: (context, index) {
                final Trending trending = trendingItems[index];

                final String title = trending.title;
                final String imagePath =
                    'https://image.tmdb.org/t/p/w500${trending.posterPath}';
                final double rating = trending.voteAverage;
                final String releaseDate = trending.releaseDate;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _buildCard(
                      title, imagePath, rating, releaseDate, sectionType, trending),
                );
              },
            ),
          );
          case Error<List<Trending>>():
            return SizedBox(height:listHeight,child: Center(child: Text('Error: $Error)')));
        }
      },
    );
  }

  Widget _buildSectionTitlePopular(
    BuildContext context,
    String title,
  ) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              DropdownButton<String>(
                value: viewModel.selectedPopularFilter,
                items: Constant.popularFilter.map((filter) {
                  return DropdownMenuItem<String>(
                    value: filter['value'],
                    child: Text(filter['name']!),
                  );
                }).toList(),
                onChanged: (String? selectedFilter) {
                  if (selectedFilter != null) {
                    viewModel.updateSelectedPopularFilter(selectedFilter);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHorizontalPopularList() {
    return Consumer<HomeViewModel>(
      builder: (context, notifier, child) {
        final sectionType = notifier.selectedPopularFilter;
        List popularItems =
            notifier.selectedPopularFilter == Constant.popularFilter[0]['value']
                ? notifier.popularMoviesList
                : notifier.popularTvShowsList;
        final state = notifier.selectedPopularFilter == Constant.popularFilter[0]['value']
                ? notifier.popularMoviesState
            : notifier.popularTvShowsState;

        if(notifier.isPopularLoading){
          return SizedBox(height: listHeight,child: const Center(child: CircularProgressIndicator()));
        }

        switch(state){
          case Ok<List<Object>>():
            return SizedBox(
              height: listHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16.0),
                itemCount: popularItems.length,
                itemBuilder: (context, index) {
                  final item = popularItems[index];

                  final String title =
                  sectionType == Constant.popularFilter[0]['value'] ? item.title : item.name;
                  final String imagePath =
                      'https://image.tmdb.org/t/p/w500${item.posterPath}';
                  final double rating = item.voteAverage;
                  final String releaseDate = sectionType == Constant.popularFilter[0]['value']
                      ? item.releaseDate
                      : item.firstAirDate;

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _buildCard(
                        title, imagePath, rating, releaseDate, sectionType, item),
                  );
                },
              ),
            );
          case Error<List<Object>>():
            return SizedBox(height:listHeight,child: Center(child: Text('Error: $Error)')));
        }
      },
    );
  }

  Widget _buildHorizontalListVariant(String sectionType) {
    return Consumer<HomeViewModel>(builder: (context, notifier, child) {
      List people = notifier.popularPeopleList;
      final state = notifier.popularPeopleState;

      if(notifier.isPeopleLoading){
        return SizedBox(height: listHeight,child: const Center(child: CircularProgressIndicator()));
      }

      switch(state){
        case Ok<List<People>>():
          return SizedBox(
            height: listHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16.0),
              itemCount: people.length,
              itemBuilder: (context, index) {
                final item = people[index];

                final String title = item.name;
                final String imagePath =
                    'https://image.tmdb.org/t/p/w500${item.profilePath}';

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _buildCardVariant(title, imagePath, item),
                );
              },
            ),
          );
        case Error<List<People>>():
          return SizedBox(height:listHeight,child: Center(child: Text('Error: $Error)')));
      }
    });
  }

  Widget _buildSectionTitleVariant(
    BuildContext context,
    String title, {
    List<String>? filters,
  }) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
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
                  value: null,
                  items: filters.toSet().map((filter) {
                    return DropdownMenuItem<String>(
                      value: filter,
                      child: Text(filter),
                    );
                  }).toList(),
                  onChanged: null,
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCard(String title, String imagePath, double rating,
      String releaseDate, String sectionType, dynamic data) {
    return GestureDetector(
      onTap: () {
        context.push('/detail', extra: data);
      },
      child: SizedBox(
        height: cardHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imagePath,
                    height: imageCardHeight ,
                    width: cardWidth,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Image has finished loading
                      }

                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: imageCardHeight ,
                          width: cardWidth,
                          color: Colors.grey,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: imageCardHeight,
                      width: cardWidth,
                      color: Colors.grey,
                      child: const Icon(Icons.error, color: Colors.white),
                    ),
                  )
                ),
                // Floating rating indicator
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
            // Title outside the card
            Expanded(
              flex: 1,
              child: SizedBox(
                width: cardWidth,
                child:
                DynamicSlidingText(
                  text: title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  enableScrolling: true,
                  scrollDuration: const Duration(seconds: 5),
                  blankSpace: 30.0,
                  maxWidth: cardWidth,
                )
                // Text(
                //   title,
                //   maxLines: 1, // Allow at most 2 lines
                //   overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                //   style: Theme.of(context).textTheme.bodyLarge,
                // ),
              ),
            ),
            const SizedBox(height: 4,),
            // Sub-text or additional title below
            Expanded(
              flex: 1,// Constrain sub-title width
              child: SizedBox(
                width: cardWidth,
                child: Text(
                  releaseDate, // Changed to sectionType for better clarity
                  maxLines: 1, // Allow at most 1 line for the sub-text
                  overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardVariant(
    String title,
    String imagePath,
      item,
  ) {
    return GestureDetector(
      onTap: () {
        context.push('/detail', extra: item);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imagePath,
                  height: imageCardHeight,
                  width: cardWidth,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: imageCardHeight,
                    width: cardWidth,
                    color: Colors.grey,
                    child: const Icon(Icons.error, color: Colors.white),
                  ),
                ),
              ),
              // Floating rating indicator
            ],
          ),
          const SizedBox(height: 8),
          // Title outside the card
          DynamicSlidingText(
              text: title,
              maxWidth: cardWidth,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
          )
          // Text(
          //   title,
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          //   style: Theme.of(context).textTheme.bodyLarge,
          // ),
        ],
      ),
    );
  }
}
