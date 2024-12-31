import 'package:floor/floor.dart';

@Entity(tableName: 'trending')
class Trending {
  @primaryKey
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final double popularity;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;

  Trending({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.popularity,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });

  factory Trending.fromJson(Map<String, dynamic> json) {
    return Trending(
      id: json['id'] as int? ?? 0, // Default to 0 if null
      title: json['title'] as String? ?? 'no title', // Default to an empty string
      originalTitle: json['original_title'] as String? ?? '', // Default to an empty string
      overview: json['overview'] as String? ?? '', // Default to an empty string
      posterPath: json['poster_path'] as String? ?? '', // Default to an empty string
      backdropPath: json['backdrop_path'] as String? ?? '', // Default to an empty string
      mediaType: json['media_type'] as String? ?? '', // Default to an empty string
      adult: json['adult'] ?? false, // Default to false
      originalLanguage: json['original_language'] as String? ?? '', // Default to an empty string
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0, // Default to 0.0
      releaseDate: json['release_date'] as String? ?? 'unknown', // Default to an empty string
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0, // Default to 0.0
      voteCount: json['vote_count'] as int? ?? 0,  // Default to 0
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList() ??
          [],// Default to an empty list
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'media_type': mediaType,
      'adult': adult,
      'original_language': originalLanguage,
      'popularity': popularity,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genre_ids': genreIds,
    };
  }
}
