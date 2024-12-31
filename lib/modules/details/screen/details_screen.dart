
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_databases/modules/details/view_model/details_view_model.dart';
import 'package:the_movie_databases/utils/auth_extensions.dart';

import '../../../config/auth_state.dart';
import '../../../data/local/databases/entity/movies.dart';
import '../../../data/local/databases/entity/people.dart';
import '../../../data/local/databases/entity/trending.dart';
import '../../../data/local/databases/entity/tv_shows.dart';
import '../../../widgets/auth_feature.dart';
import 'video_screen.dart';

class DetailsScreen<T> extends StatefulWidget {
  final T data;
  final DetailsViewModel viewModel;

  const DetailsScreen({super.key, required this.data, required this.viewModel});

  @override
  State<DetailsScreen<T>> createState() => _DetailsScreenState<T>();
}

class _DetailsScreenState<T> extends State<DetailsScreen<T>> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchGenres();
    _initializeFavorites();
  }


  void fetchVideo(int id, String mediaType) async {
    if (mediaType == 'movie') {
      widget.viewModel.fetchMovieVideos(id);
    } else if (mediaType == 'tv') {
      widget.viewModel.fetchTvShowsVideos(id);
    }
  }

  Future<void> _initializeFavorites() async {
    int? mediaId;
    String? mediaType;

    if (widget.data is Trending) {
      mediaId = (widget.data as Trending).id;
      mediaType = (widget.data as Trending).mediaType;
      fetchVideo(
          (widget.data as Trending).id, (widget.data as Trending).mediaType);
    } else if (widget.data is TvShows) {
      mediaId = (widget.data as TvShows).id;
      mediaType = 'tv';
      fetchVideo((widget.data as TvShows).id, 'tv');
    } else if (widget.data is Movies) {
      mediaId = (widget.data as Movies).id;
      mediaType = 'movie';
      fetchVideo((widget.data as Movies).id, 'movie');
    }

    if (mediaId != null && mediaType != null) {
      await widget.viewModel.isItemFavorites(mediaId, mediaType);
    }
  }

  Future<void> getGenresName(List<int> listOfId) async {
    await widget.viewModel.findListOfGenresNames(listOfId);
  }


  Widget _buildVideoCarousel() {
    if (widget.viewModel.listOfVideos.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              'Videos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' (${widget.viewModel.listOfVideos.length})',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.viewModel.listOfVideos.length,
            itemBuilder: (context, index) {
              final video = widget.viewModel.listOfVideos[index];
              final thumbnailUrl =
                  'https://img.youtube.com/vi/${video.key}/maxresdefault.jpg';

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoScreen(
                        videoKeys: widget.viewModel.listOfVideos.map((video) => video.key).toList(),
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              thumbnailUrl,
                              height: 169,
                              width: 300,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 169,
                                  width: 300,
                                  color: Colors.grey[800],
                                  child: const Center(
                                    child: Icon(
                                      Icons.error_outline,
                                      color: Colors.white54,
                                      size: 48,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned.fill(
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        video.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildDetailView(context, widget.data);
  }

  Widget buildDetailView(BuildContext context, dynamic data) {
    if (data is Trending) {
      return trendingDetailWidget(data: data);
    } else if (data is TvShows) {
      return tvShowsDetailWidget(data: data);
    } else if (data is People) {
      return peopleDetailWidget(data: data);
    } else if (data is Movies) {
      return moviesDetailWidget(data: data);
    }
    return const Scaffold(body: Center(child: Text('Unsupported type')));
  }

  Widget trendingDetailWidget({required Trending data}) {
    final toInt = data.genreIds;
    getGenresName(toInt);

    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final isLoading = widget.viewModel.isLoading;
        final isFavorite = widget.viewModel.isFavorites;

        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 300,
                    pinned:
                        true, // Keeps the app bar pinned at the top when collapsed
                    floating:
                        false, // Make sure it's not floating, we want it to collapse completely
                    snap: false, // Prevent snapping, it will collapse on scroll
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500${data.backdropPath}',
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Container(
                                color: Colors.grey[
                                    300], // Background color for the error container
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons
                                      .error_outline, // Icon indicating an error
                                  color: Colors.red,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.8),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        data.title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                      ),
                      centerTitle: true,
                    ),
                    leading: IconButton(
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: Theme.of(context).canvasColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${data.posterPath}',
                                  height: 180,
                                  width: 120,
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    return Container(
                                      height: 180, // Same height as the image
                                      width: 120, // Same width as the image
                                      color: Colors.grey[
                                          300], // Background color for error state
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.error_outline, // Error icon
                                        color: Colors.red,
                                        size: 40, // Icon size
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data.releaseDate,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      widget.viewModel.listOfGenreName
                                          .join(', '),
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${(data.voteAverage * 10).toInt().toString()}%',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        AuthFeature(
                                          allowedStates: const [
                                            AuthState.authenticated
                                          ],
                                          onUnauthorized: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Please login to add to favorites'),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          },
                                          placeholder: Container(
                                            height: 36,
                                            width: 36,
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                                  .withOpacity(0.3),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.favorite,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: IconButton(
                                            onPressed: () async {
                                              if (context.isAuthenticated) {
                                                await widget.viewModel
                                                    .toggleFavourites(
                                                  data.id,
                                                  data.mediaType,
                                                );
                                              }
                                            },
                                            icon: Icon(
                                              isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Overview',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data.overview,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(color: Colors.grey),
                          _buildVideoCarousel(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget tvShowsDetailWidget({
    required TvShows data,
  }) {
    final toInt = data.genreIds;
    getGenresName(toInt);

    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final isLoading = widget.viewModel.isLoading;
        final isFavorite = widget.viewModel.isFavorites;

        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 300,
                    pinned:
                        true, // Keeps the app bar pinned at the top when collapsed
                    floating:
                        false, // Make sure it's not floating, we want it to collapse completely
                    snap: false, // Prevent snapping, it will collapse on scroll
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500${data.backdropPath}',
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Container(
                                color: Colors.grey[
                                    300], // Background color for the error container
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons
                                      .error_outline, // Icon indicating an error
                                  color: Colors.red,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.8),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        data.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                      ),
                      centerTitle: true,
                    ),
                    leading: IconButton(
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: Theme.of(context).canvasColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${data.posterPath}',
                                  height: 180,
                                  width: 120,
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    return Container(
                                      height: 180, // Same height as the image
                                      width: 120, // Same width as the image
                                      color: Colors.grey[
                                          300], // Background color for error state
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.error_outline, // Error icon
                                        color: Colors.red,
                                        size: 40, // Icon size
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      data.firstAirDate,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      widget.viewModel.listOfGenreName
                                          .join(', '),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${(data.voteAverage * 10).toInt().toString()}%',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        AuthFeature(
                                          allowedStates: const [
                                            AuthState.authenticated
                                          ],
                                          onUnauthorized: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Please login to add to favorites'),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          },
                                          placeholder: Container(
                                            height: 36,
                                            width: 36,
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.favorite,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: Container(
                                            width: 42,
                                            height: 42,
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                              onPressed: () async {
                                                if (context.isAuthenticated) {
                                                  await widget.viewModel
                                                      .toggleFavourites(
                                                    data.id,
                                                    'tv',
                                                  );
                                                }
                                              },
                                              icon: Icon(
                                                isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Overview',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data.overview,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(color: Colors.grey),
                          _buildVideoCarousel(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget peopleDetailWidget({required People data}) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final isLoading = widget.viewModel.isLoading;

        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 300,
                    pinned:
                        true, // Keeps the app bar pinned at the top when collapsed
                    floating:
                        false, // Make sure it's not floating, we want it to collapse completely
                    snap: false, // Prevent snapping, it will collapse on scroll
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500${data.profilePath}',
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Container(
                                color: Colors.grey[
                                    300], // Background color for the error container
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons
                                      .error_outline, // Icon indicating an error
                                  color: Colors.red,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.8),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        data.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                      ),
                      centerTitle: true,
                    ),
                    leading: IconButton(
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: Theme.of(context).canvasColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${data.profilePath}',
                                  height: 180,
                                  width: 120,
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    return Container(
                                      height: 180, // Same height as the image
                                      width: 120, // Same width as the image
                                      color: Colors.grey[
                                          300], // Background color for error state
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.error_outline, // Error icon
                                        color: Colors.red,
                                        size: 40, // Icon size
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      data.gender == 1
                                          ? 'Female'
                                          : 'Male', // Handling gender display
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      data.knownForDepartment,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                (data.popularity).toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Known for: ${data.knownForDepartment}',
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget moviesDetailWidget({required Movies data}) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final isLoading = widget.viewModel.isLoading;
        final isFavorite = widget.viewModel.isFavorites;

        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 350,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500${data.backdropPath}',
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Container(
                                color: Colors.grey[
                                    300], // Background color for the error container
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons
                                      .error_outline, // Icon indicating an error
                                  color: Colors.red,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.8),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        data.title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                      ),
                      centerTitle: true,
                    ),
                    leading: IconButton(
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: Theme.of(context).canvasColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListenableBuilder(
                        listenable: widget.viewModel,
                        builder: (context, _) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500${data.posterPath}',
                                      height: 180,
                                      width: 120,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                        return Container(
                                          height:
                                              180, // Same height as the image
                                          width: 120, // Same width as the image
                                          // Background color for error state
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            Icons.error_outline, // Error icon
                                            color: Colors.red,
                                            size: 40, // Icon size
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.title,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          data.releaseDate,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          widget.viewModel.listOfGenreName
                                              .join(', '),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    '${(data.voteAverage * 10).toInt().toString()}%',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            AuthFeature(
                                              allowedStates: const [
                                                AuthState.authenticated
                                              ],
                                              onUnauthorized: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Please login to add to favorites'),
                                                    duration: Duration(seconds: 2),
                                                  ),
                                                );
                                              },
                                              placeholder: Container(
                                                height: 36,
                                                width: 36,
                                                margin: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                      .withOpacity(0.3),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.favorite,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              child: IconButton(
                                                onPressed: () async {
                                                  if (context.isAuthenticated) {
                                                    await widget.viewModel
                                                        .toggleFavourites(
                                                      data.id,
                                                      'movie',
                                                    );
                                                  }
                                                },
                                                icon: Icon(
                                                  isFavorite
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Overview',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                data.overview,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Divider(color: Colors.grey),
                              _buildVideoCarousel(),
                              const SizedBox(height: 16),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
