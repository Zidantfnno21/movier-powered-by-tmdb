// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_people.freezed.dart';
part 'details_people.g.dart';

@freezed
class DetailsPeople with _$DetailsPeople {
  const factory DetailsPeople({
    required bool adult,
    @JsonKey(name: 'also_known_as', defaultValue: [])
    required List<String> alsoKnownAs,
    required String? biography,
    required String? birthday,
    required String? deathday,
    required int gender,
    required String? homepage,
    required int id,
    @JsonKey(name: 'imdb_id') required String? imdbId,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    required String name,
    @JsonKey(name: 'place_of_birth') required String? placeOfBirth,
    required double? popularity,
    @JsonKey(name: 'profile_path') required String? profilePath,
    @JsonKey(name: 'combined_credits')
    CombinedCredits? combinedCredits,
  }) = _DetailsPeople;

  factory DetailsPeople.fromJson(Map<String, dynamic> json) =>
      _$DetailsPeopleFromJson(json);
}

@freezed
class CombinedCredits with _$CombinedCredits {
  const factory CombinedCredits({
    @Default([]) List<CastWithCharacter>? cast,
    @Default([]) List<CrewWithJob>? crew,
  }) = _CombinedCredits;

  factory CombinedCredits.fromJson(Map<String, dynamic>? json) =>
      _$CombinedCreditsFromJson(json!);


}

@freezed
class CastWithCharacter with _$CastWithCharacter {
  const factory CastWithCharacter({
    required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    required int id,
    @JsonKey(name: 'original_language') required String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    required String? overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    required String? title,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'media_type') String? mediaType,
    required String? character,
    required int? order,
  }) = _CastWithCharacter;

  factory CastWithCharacter.fromJson(Map<String, dynamic> json) =>
      _$CastWithCharacterFromJson(json);
}

@freezed
class CrewWithJob with _$CrewWithJob {
  const factory CrewWithJob({
    required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    required int id,
    @JsonKey(name: 'original_language') required String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    required String? overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    required String? title,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'media_type') String? mediaType,
    required String? department,
    required String? job,
  }) = _CrewWithJob;

  factory CrewWithJob.fromJson(Map<String, dynamic> json) =>
      _$CrewWithJobFromJson(json);
}
