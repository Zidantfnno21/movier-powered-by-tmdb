
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_databases/modules/details/screen/cast_screen.dart';
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
  @override
  void initState() {
    super.initState();
    _initializeDetails();
  }

  void _initializeDetails() async {
    if (widget.data is Trending) {
      final trending = widget.data as Trending;
      await fetchDetails(trending.id, trending.mediaType);
    } else if (widget.data is TvShows) {
      final tvShow = widget.data as TvShows;
      await fetchDetails(tvShow.id, 'tv');
    } else if (widget.data is Movies) {
      final movie = widget.data as Movies;
      await fetchDetails(movie.id, 'movie');
    } else if (widget.data is People) {
      final people = widget.data as People;
      await widget.viewModel.fetchPeopleDetails(people.id);
    }
  }

  Future<void> fetchDetails(int id, String type) async {
    if (type == 'movie') {
      await widget.viewModel.fetchMovieDetails(id);
    } else if (type == 'tv') {
      await widget.viewModel.fetchTvShowsDetails(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildDetailView(context, widget.data);
  }

  Widget buildDetailView(BuildContext context, dynamic data) {
    if (data is Trending) {
      return data.mediaType == 'movie'
          ? moviesDetailWidget()
          : tvShowsDetailWidget();
    } else if (data is TvShows) {
      return tvShowsDetailWidget();
    } else if (data is People) {
      return peopleDetailWidget();
    } else if (data is Movies) {
      return moviesDetailWidget();
    }
    return const Scaffold(body: Center(child: Text('Unsupported type')));
  }

  Widget _buildErrorView(String? error) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              error ?? 'An error occurred',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _initializeDetails,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
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
                        videoKeys: widget.viewModel.listOfVideos
                            .map((video) => video.key)
                            .toList(),
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

  Widget _buildMovieCast() {
    if (widget.viewModel.movieCast.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              'Cast',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CastScreen(cast: widget.viewModel.movieCast),
                  ),
                );
              },
              child: Text(
                'See more',
                style: TextStyle(fontSize: 16, color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
            height: 350,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.viewModel.movieCast.length,
                itemBuilder: (context, index) {
                  final cast = widget.viewModel.movieCast[index];
                  final path =
                      'https://image.tmdb.org/t/p/w500${cast.profilePath}';

                  return GestureDetector(
                    onTap: () {
                      final people = People(
                        id: cast.id,
                        adult: cast.adult,
                        gender: cast.gender,
                        knownForDepartment: cast.knownForDepartment,
                        name: cast.name,
                        originalName: cast.originalName,
                        popularity: cast.popularity,
                        profilePath: cast.profilePath ?? '',
                      );
                      final viewModel = DetailsViewModel(
                          detailsRepository: context.read(),
                          favouritesRepository: context.read(),
                          sharedPreferencesService: context.read());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailsScreen(
                            data: people, viewModel: viewModel);
                      }));
                    },
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: AspectRatio(
                                  aspectRatio: 2 / 3,
                                  child: Image.network(
                                    path,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[800],
                                        child: const Center(
                                          child: Icon(
                                            Icons.error_outline,
                                            color: Colors.white54,
                                            size: 42,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            cast.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cast.character,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }

  Widget _buildTvShowsCast() {
    if (widget.viewModel.tvShowCast.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              'Cast',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CastScreen(cast: widget.viewModel.tvShowCast),
                  ),
                );
              },
              child: Text(
                'See more',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
            height: 350,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.viewModel.tvShowCast.length,
                itemBuilder: (context, index) {
                  final cast = widget.viewModel.tvShowCast[index];
                  final path =
                      'https://image.tmdb.org/t/p/w500${cast.profilePath}';

                  return GestureDetector(
                    onTap: () {
                      final people = People(
                        id: cast.id,
                        adult: cast.adult,
                        gender: cast.gender,
                        knownForDepartment: cast.knownForDepartment,
                        name: cast.name,
                        originalName: cast.originalName,
                        popularity: cast.popularity ?? 0,
                        profilePath: cast.profilePath ?? '',
                      );
                      final viewModel = DetailsViewModel(
                          detailsRepository: context.read(),
                          favouritesRepository: context.read(),
                          sharedPreferencesService: context.read());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailsScreen(
                            data: people, viewModel: viewModel);
                      }));
                    },
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: AspectRatio(
                                  aspectRatio: 2 / 3,
                                  child: Image.network(
                                    path,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[800],
                                        child: const Center(
                                          child: Icon(
                                            Icons.error_outline,
                                            color: Colors.white54,
                                            size: 42,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            cast.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cast.roles
                                    ?.map((role) => role.character)
                                    .join(', ') ??
                                '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                    Brightness.light
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }

  Widget _buildPeopleCast() {
    if (widget.viewModel.peopleCast.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const Text('Appeared in',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CastScreen(cast: widget.viewModel.peopleCast);
                }));
              },
              child: Text('See more',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                  )),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
            height: 350,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.viewModel.peopleCast.length,
                itemBuilder: (context, index) {
                  final cast = widget.viewModel.peopleCast[index];
                  final path =
                      'https://image.tmdb.org/t/p/w500${cast.posterPath}';

                  return GestureDetector(
                      onTap: () {
                        final trending = Trending(
                          id: cast.id,
                          posterPath: cast.posterPath ?? '',
                          title: cast.title ?? '',
                          originalTitle: cast.originalTitle ?? '',
                          overview: cast.overview ?? '',
                          backdropPath: cast.backdropPath ?? '',
                          mediaType: cast.mediaType ?? '',
                          adult: cast.adult,
                          originalLanguage: cast.originalLanguage ?? '',
                          genreIds: cast.genreIds ?? [],
                          popularity: cast.popularity,
                          releaseDate: cast.releaseDate ?? '',
                          voteAverage: cast.voteAverage ?? 0,
                          voteCount: cast.voteCount ?? 0,
                        );

                        final viewModel = DetailsViewModel(
                            detailsRepository: context.read(),
                            favouritesRepository: context.read(),
                            sharedPreferencesService: context.read());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailsScreen(
                              data: trending, viewModel: viewModel);
                        }));
                      },
                      child: Container(
                        width: 150,
                        margin: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: AspectRatio(
                                    aspectRatio: 2 / 3,
                                    child: Image.network(
                                      path,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.grey[800],
                                          child: const Center(
                                            child: Icon(
                                              Icons.error_outline,
                                              color: Colors.white54,
                                              size: 42,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _getColorByRating(
                                    cast.voteAverage ?? 0, context),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: _getContrastingTextColor(
                                        _getColorByRating(
                                            cast.voteAverage ?? 0, context)),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  if ((cast.voteAverage ?? 0) > 0)
                                    Text(
                                      '${((cast.voteAverage ?? 0) * 10).round().toString()}%',
                                      style: TextStyle(
                                          color: _getContrastingTextColor(
                                              _getColorByRating(
                                                  cast.voteAverage ?? 0,
                                                  context))),
                                    ),
                                  if ((cast.voteAverage ?? 0) == 0)
                                    Text(
                                      'Not rated',
                                      style: TextStyle(
                                          color: _getContrastingTextColor(
                                              _getColorByRating(
                                                  cast.voteAverage ?? 0,
                                                  context)),
                                          fontWeight: FontWeight.w700),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              cast.title ?? 'undefined',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'as ${cast.character}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.secondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ));
                }))
      ],
    );
  }

  Widget tvShowsDetailWidget() {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Loading...'),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (widget.viewModel.error != null) {
          return Scaffold(
            body: _buildErrorView(widget.viewModel.error),
          );
        }

        final details = widget.viewModel.tvShowsDetails;
        if (details == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(child: Text('No details available')),
          );
        }

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
                    flexibleSpace: LayoutBuilder(
                        builder: (context, constraints) {
                          final collapsePercentage =
                              (constraints.maxHeight - kToolbarHeight) / (350 - kToolbarHeight);
                          return FlexibleSpaceBar(
                            background: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  'https://image.tmdb.org/t/p/w500${details.backdropPath}',
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
                                        Theme.of(context).canvasColor.withOpacity(0.8),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            title: Padding(
                              padding: EdgeInsets.only(
                                left: collapsePercentage < 0.5 ? 54 : 0,
                                right: collapsePercentage < 0.5 ? 54 : 0,// Add padding when collapsed
                              ),
                              child: Text(
                                details.name ?? '',
                                maxLines: collapsePercentage < 0.2 ? 1 : null,
                                style: TextStyle(
                                  fontSize: 18, // Small size for collapsed state
                                  fontWeight: FontWeight.bold,
                                  overflow: collapsePercentage < 0.2 ? TextOverflow.ellipsis : TextOverflow.visible,
                                ),
                              ),
                            ),
                            centerTitle: true,
                          );
                        }
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
                                  'https://image.tmdb.org/t/p/w500${details.posterPath}',
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
                                      details.name ?? 'undefined',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      details.firstAirDate!,
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
                                                '${(details.voteAverage! * 10).toInt().toString()}%',
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
                                                    details.id,
                                                    'tv',
                                                  );
                                                }
                                              },
                                              icon: Icon(
                                                widget.viewModel.isFavorites
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
                            details.overview!,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(color: Colors.grey),
                          _buildVideoCarousel(),
                          const SizedBox(height: 8),
                          const Divider(color: Colors.grey),
                          _buildTvShowsCast(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.viewModel.isLoading)
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

  Widget peopleDetailWidget() {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Loading...'),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (widget.viewModel.error != null) {
          return Scaffold(
            body: _buildErrorView(widget.viewModel.error),
          );
        }

        final details = widget.viewModel.peopleDetails;
        if (details == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(child: Text('No details available')),
          );
        }
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
                    flexibleSpace: LayoutBuilder(
                        builder: (context, constraints) {
                          final collapsePercentage =
                              (constraints.maxHeight - kToolbarHeight) / (350 - kToolbarHeight);
                          return FlexibleSpaceBar(
                            background: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  'https://image.tmdb.org/t/p/w500${details.profilePath}',
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
                                        Theme.of(context).canvasColor.withOpacity(0.8),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            title: Padding(
                              padding: EdgeInsets.only(
                                left: collapsePercentage < 0.5 ? 54 : 0,
                                right: collapsePercentage < 0.5 ? 54 : 0,// Add padding when collapsed
                              ),
                              child: Text(
                                details.name,
                                maxLines: collapsePercentage < 0.2 ? 1 : null,
                                style: TextStyle(
                                  fontSize: 18, // Small size for collapsed state
                                  fontWeight: FontWeight.bold,
                                  overflow: collapsePercentage < 0.2 ? TextOverflow.ellipsis : TextOverflow.visible,
                                ),
                              ),
                            ),
                            centerTitle: true,
                          );
                        }
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
                                  'https://image.tmdb.org/t/p/w500${details.profilePath}',
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
                                      details.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      details.gender == 0
                                          ? 'Not Specified'
                                          : details.gender == 1
                                              ? 'Female'
                                              : details.gender == 2
                                                  ? 'Male'
                                                  : 'Other', // Handling gender display
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      details.birthday != null && details.birthday!.isNotEmpty
                                          ? 'Born: ${details.birthday} (age ${DateTime.now().year - DateTime.parse(details.birthday!).year}), ${details.placeOfBirth ?? 'Unknown'}'
                                          : 'Born: Unknown',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    if (details.deathday != null)
                                      Text(
                                        '${details.deathday}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            details.alsoKnownAs.isNotEmpty
                                ? 'Known As: ${details.alsoKnownAs.join(', ')}'
                                : '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            details.biography ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: 16),
                          _buildPeopleCast(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.viewModel.isLoading)
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

  Widget moviesDetailWidget() {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (widget.viewModel.error != null) {
          return Scaffold(
            body: _buildErrorView(widget.viewModel.error),
          );
        }

        final details = widget.viewModel.movieDetails;
        if (details == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(child: Text('No details available')),
          );
        }

        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 350,
                    pinned: true,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints) {
                        final collapsePercentage =
                            (constraints.maxHeight - kToolbarHeight) / (350 - kToolbarHeight);
                        return FlexibleSpaceBar(
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                'https://image.tmdb.org/t/p/w500${details.backdropPath}',
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
                                      Theme.of(context).canvasColor.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(
                              left: collapsePercentage < 0.5 ? 54 : 0,
                              right: collapsePercentage < 0.5 ? 54 : 0,// Add padding when collapsed
                            ),
                            child: Text(
                              details.title,
                              maxLines: collapsePercentage < 0.2 ? 1 : null,
                              style: TextStyle(
                                fontSize: 18, // Small size for collapsed state
                                fontWeight: FontWeight.bold,
                                overflow: collapsePercentage < 0.2 ? TextOverflow.ellipsis : TextOverflow.visible,
                              ),
                            ),
                          ),
                          centerTitle: true,
                        );
                      }
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
                                      'https://image.tmdb.org/t/p/w500${details.posterPath}',
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
                                          details.title,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          details.releaseDate,
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
                                                    '${(details.voteAverage * 10).toInt().toString()}%',
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
                                                    duration:
                                                        Duration(seconds: 2),
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
                                                      details.id,
                                                      'movie',
                                                    );
                                                  }
                                                },
                                                icon: Icon(
                                                  widget.viewModel.isFavorites
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
                                details.overview,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Divider(color: Colors.grey),
                              _buildVideoCarousel(),
                              const SizedBox(height: 8),
                              const Divider(color: Colors.grey),
                              _buildMovieCast(),
                              const SizedBox(height: 16),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.viewModel.isLoading)
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

Color _getColorByRating(double voteAverage, BuildContext context) {
  if (voteAverage == 0) {
    // Not rated
    return Colors.grey;
  }

  double percentage = voteAverage * 10;

  if (percentage.abs() < 1e-2) {
    return Theme.of(context).colorScheme.primary; // Near perfect
  } else if (percentage >= 61.8) {
    return Colors.green; // High score
  } else if (percentage >= 23.6) {
    return Colors.yellow; // Medium score
  } else {
    return Colors.red; // Low score
  }
}

Color _getContrastingTextColor(Color backgroundColor) {
  double luminance = 0.2126 * backgroundColor.red / 255 +
      0.7152 * backgroundColor.green / 255 +
      0.0722 * backgroundColor.blue / 255;

  if (luminance > 0.5) {
    return Colors.black; // Dark text for light background
  } else {
    return Colors.white; // Light text for dark background
  }
}
