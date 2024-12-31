import 'package:floor/floor.dart';

@Entity(tableName: 'movies')
class Movies {
  @primaryKey
  final int id;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;

  Movies({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });

  // Factory method to create a Movies from JSON
  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'] as int? ?? 0, // Default to 0 if null
      adult: json['adult'] as bool? ?? false, // Default to false if null
      backdropPath: json['backdrop_path'] as String? ?? '', // Default to an empty string if null
      originalLanguage: json['original_language'] as String? ?? '', // Default to an empty string if null
      originalTitle: json['original_title'] as String? ?? '', // Default to an empty string if null
      overview: json['overview'] as String? ?? '', // Default to an empty string if null
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0, // Default to 0.0 if null
      posterPath: json['poster_path'] as String? ?? '', // Default to an empty string if null
      releaseDate: json['release_date'] as String? ?? '', // Default to an empty string if null
      title: json['title'] as String? ?? '', // Default to an empty string if null
      video: json['video'] as bool? ?? false, // Default to false if null
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0, // Default to 0.0 if null
      voteCount: json['vote_count'] as int? ?? 0,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList() ??
          [],// Default to 0 if null
    );
  }

  // Method to convert a Movies to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'backdrop_path': backdropPath,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genre_ids': genreIds,
    };
  }
}
