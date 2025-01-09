// ignore_for_file: invalid_annotation_target, unnecessary_lambdas

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_databases/data/network/model/account_states/account_states.dart';
import 'package:the_movie_databases/data/network/model/genre/genre.dart';
import 'package:the_movie_databases/data/network/model/production_companies/production_company.dart';
import 'package:the_movie_databases/data/network/model/production_countries/production_country.dart';

import '../videos/videos.dart';

part 'details_movies.freezed.dart';
part 'details_movies.g.dart';

@freezed
class DetailsMovies with _$DetailsMovies {
  const factory DetailsMovies({
    @JsonKey(name: 'adult') required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'belongs_to_collection') BelongsToCollection? belongsToCollection,
    @JsonKey(name: 'budget') required int budget,
    @JsonKey(name: 'genres') required List<Genre> genres,
    @JsonKey(name: 'homepage') String? homepage,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    @JsonKey(name: 'overview') required String overview,
    @JsonKey(name: 'popularity') required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies')
    required List<ProductionCompany> productionCompanies,
    @JsonKey(name: 'production_countries')
    required List<ProductionCountry> productionCountries,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'revenue') required int revenue,
    @JsonKey(name: 'runtime') int? runtime,
    @JsonKey(name: 'spoken_languages')
    required List<SpokenLanguage> spokenLanguages,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'tagline') String? tagline,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'video') required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
    @JsonKey(name: 'credits') Credits? credits,
    @JsonKey(name: 'videos') Videos? videos,
    @JsonKey(name: 'account_states') AccountStates? accountStates,
  }) = _DetailsMovies;

  factory DetailsMovies.fromJson(Map<String, dynamic> json) =>
      _$DetailsMoviesFromJson(json);
}

@freezed
class BelongsToCollection with _$BelongsToCollection {
  const factory BelongsToCollection({
    required int id,
    required String name,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
  }) = _BelongsToCollection;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'english_name') required String englishName,
    @JsonKey(name: 'iso_639_1') required String iso6391,
    @JsonKey(name: 'name') required String name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}

@freezed
class Credits with _$Credits {
  const factory Credits({
    @JsonKey(name: 'cast') required List<MovieCast> cast,
    required List<Crew> crew,
  }) = _Credits;

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);
}

@freezed
class MovieCast with _$MovieCast {
  const factory MovieCast({
    required bool adult,
    required int gender,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'known_for_department')required String knownForDepartment,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'original_name') required String originalName,
    required double popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(name: 'cast_id') required int castId,
    @JsonKey(name: 'character') required String character,
    @JsonKey(name: 'credit_id') required String creditId,
    required int order,
  }) = _MovieCast;

  factory MovieCast.fromJson(Map<String, dynamic> json) => _$MovieCastFromJson(json);
}

@freezed
class Crew with _$Crew {
  const factory Crew({
    required bool adult,
    required int gender,
    @JsonKey(name: 'known_for_department')required String knownForDepartment,
    required String name,
    @JsonKey(name: 'original_name') required String originalName,
    required double popularity,
    @JsonKey(name: 'profile_path') required String? profilePath,
    @JsonKey(name: 'credit_id') required String creditId,
    required String department,
    required String job,
}) = _Crew;

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
}
