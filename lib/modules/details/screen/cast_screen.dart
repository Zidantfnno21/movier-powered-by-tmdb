import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_databases/data/local/databases/entity/people.dart';
import 'package:the_movie_databases/data/local/databases/entity/trending.dart';
import 'package:the_movie_databases/data/network/model/details_movie/details_movies.dart';
import 'package:the_movie_databases/data/network/model/details_people/details_people.dart';
import 'package:the_movie_databases/data/network/model/details_tv_shows/details_tv_shows.dart';
import 'package:the_movie_databases/modules/details/screen/details_screen.dart';
import 'package:the_movie_databases/modules/details/view_model/details_view_model.dart';

class CastScreen<T> extends StatelessWidget {
  const CastScreen({
    super.key,
    required this.cast,
  });

  final List<T> cast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cast'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: cast.length,
        itemBuilder: (context, index) {
          final imgWidth = MediaQuery.of(context).size.width * 0.2;

          final actor = cast[index];

          // Extract actor details
          final actorDetails = _extractActorDetails(actor);

          if (actorDetails == null) {
            return const SizedBox.shrink(); // Skip unsupported cast types
          }

          final String name = actorDetails['name'] ?? 'Unknown';
          final String character = actorDetails['character'] ?? '-';
          final String? profilePath = actorDetails['profilePath'];

          return InkWell(
            onTap: () => _navigateToDetails(context, actor, actorDetails, profilePath),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  _buildProfileImage(profilePath, imgWidth),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'as $character',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
  Map<String, dynamic>? _extractActorDetails(dynamic actor) {
    if (actor is MovieCast) {
      return {
        'name': actor.name,
        'character': actor.character,
        'profilePath': actor.profilePath,
      };
    } else if (actor is Cast) {
      return {
        'name': actor.name,
        'character': actor.roles?.map((role) => role.character).join(', ') ?? '-',
        'profilePath': actor.profilePath,
      };
    } else if (actor is CastWithCharacter) {
      return {
        'name': actor.title ?? 'undefined',
        'character': actor.character ?? '-',
        'profilePath': actor.posterPath,
      };
    } else {
      return null;
    }
  }
  
  Widget _buildProfileImage(String? profilePath, double imgWidth) {
      return SizedBox(
        width: imgWidth,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://image.tmdb.org/t/p/w92$profilePath',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: imgWidth,
                  child: const Icon(Icons.person, size: 48),
                );
              },
            ),
          ),
        ),
      );
  }

  /// Navigate to details screen.
  void _navigateToDetails(BuildContext context, dynamic actor, Map<String, dynamic> actorDetails, String? profilePath) {
    final viewModel = DetailsViewModel(
      detailsRepository: context.read(),
      favouritesRepository: context.read(),
      sharedPreferencesService: context.read(),
    );

    Widget detailsScreen;

    if (actor is CastWithCharacter) {
      final data = Trending(
        id: actor.id,
        title: actor.title ?? '',
        originalTitle: actor.originalTitle ?? '',
        overview: actor.overview ?? '',
        posterPath: actor.posterPath ?? '',
        backdropPath: actor.backdropPath ?? '',
        mediaType: actor.mediaType ?? '',
        adult: actor.adult,
        originalLanguage: actor.originalLanguage ?? '',
        popularity: actor.popularity,
        releaseDate: actor.releaseDate ?? '',
        voteAverage: actor.voteAverage ?? 0.0,
        voteCount: actor.voteCount ?? 0,
        genreIds: actor.genreIds ?? [],
      );
      detailsScreen = DetailsScreen(data: data, viewModel: viewModel);
    } else {
      final people = People(
        id: actor is MovieCast ? actor.id : (actor is Cast ? actor.id : 0),
        adult: actor is MovieCast ? actor.adult : (actor is Cast ? actor.adult : false),
        gender: actor is MovieCast ? actor.gender : (actor is Cast ? actor.gender : 0),
        knownForDepartment: actor is MovieCast
            ? actor.knownForDepartment
            : (actor is Cast ? actor.knownForDepartment : ''),
        name: actorDetails['name'] ?? '',
        originalName: actor is MovieCast
            ? actor.originalName
            : (actor is Cast ? actor.originalName : ''),
        popularity: actor is MovieCast
            ? actor.popularity
            : (actor is Cast ? actor.popularity ?? 0.0 : 0.0),
        profilePath: profilePath ?? '',
      );
      detailsScreen = DetailsScreen(data: people, viewModel: viewModel);
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => detailsScreen),
    );
  }
}