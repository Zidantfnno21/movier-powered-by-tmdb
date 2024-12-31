import 'package:floor/floor.dart';

@Entity(tableName: 'tv_shows')
class TvShows {
  @primaryKey
  final int id;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;

  TvShows({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });

  factory TvShows.fromJson(Map<String, dynamic> json) {
    return TvShows(
      id: json['id'] as int,
      adult: json['adult'] as bool? ?? false, // default to false if null
      backdropPath: json['backdrop_path'] as String? ?? '', // default to empty string if null
      originalLanguage: json['original_language'] as String? ?? '', // default to empty string if null
      originalName: json['original_name'] as String? ?? '', // default to empty string if null
      overview: json['overview'] as String? ?? '', // default to empty string if null
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0, // default to 0.0 if null
      posterPath: json['poster_path'] as String? ?? '', // default to empty string if null
      firstAirDate: json['first_air_date'] as String? ?? '', // default to empty string if null
      name: json['name'] as String? ?? '', // default to empty string if null
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0, // default to 0.0 if null
      voteCount: json['vote_count'] as int? ?? 0,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList() ??
          [],// default to 0 if null
    );
  }

  // Method to convert a TvShows to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'backdrop_path': backdropPath,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'first_air_date': firstAirDate,
      'name': name,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genre_ids': genreIds,
    };
  }
}
