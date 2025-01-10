// ignore_for_file: invalid_annotation_target, unnecessary_lambdas

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_databases/data/network/model/account_states/account_states.dart';
import 'package:the_movie_databases/data/network/model/production_countries/production_country.dart';
import 'package:the_movie_databases/data/network/model/videos/videos.dart';

import '../genre/genre.dart';
import '../production_companies/production_company.dart';
import '../reviews/reviews.dart';

part 'details_tv_shows.freezed.dart';
part 'details_tv_shows.g.dart';

@freezed
class DetailsTvShows with _$DetailsTvShows {
  const factory DetailsTvShows({
    @JsonKey(name: 'adult') required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'created_by') List<Creator>? createdBy,
    @JsonKey(name: 'episode_run_time') List<int>? episodeRunTime,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    @JsonKey(name: 'genres') List<Genre>? genres,
    @JsonKey(name: 'homepage') required String homepage,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'in_production') required bool inProduction,
    @JsonKey(name: 'languages') List<String>? languages,
    @JsonKey(name: 'last_air_date') String? lastAirDate,
    @JsonKey(name: 'last_episode_to_air') Episode? lastEpisodeToAir,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'next_episode_to_air') Episode? nextEpisodeToAir,
    @JsonKey(name: 'networks') List<Network>? networks,
    @JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,
    @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_name') String? originalName,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies')
    List<ProductionCompany>? productionCompanies,
    @JsonKey(name: 'production_countries')
    List<ProductionCountry>? productionCountries,
    @JsonKey(name: 'seasons') List<Season>? seasons,
    @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'tagline') String? tagline,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'aggregate_credits') AggregateCredits? aggregateCredits,
    @JsonKey(name: 'videos') Videos? videos,
    @JsonKey(name: 'account_states') AccountStates? accountStates,
    @JsonKey(name: 'reviews') Reviews? reviews,
  }) = _DetailsTvShows;

  factory DetailsTvShows.fromJson(Map<String, dynamic> json) =>
      _$DetailsTvShowsFromJson(json);
}

@freezed
class Creator with _$Creator {
  const factory Creator({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'credit_id') required String creditId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'original_name') required String originalName,
    @JsonKey(name: 'gender') required int gender,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _Creator;

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'english_name') required String englishName,
    @JsonKey(name: 'iso_639_1') required String iso6391,
    required String name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}

@freezed
class Episode with _$Episode {
  const factory Episode({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'air_date') String? airDate,
    @JsonKey(name: 'episode_number') required int episodeNumber,
    @JsonKey(name: 'production_code') String? productionCode,
    @JsonKey(name: 'runtime') int? runtime,
    @JsonKey(name: 'season_number') required int seasonNumber,
    @JsonKey(name: 'show_id') required int showId,
    @JsonKey(name: 'still_path') String? stillPath,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}

@freezed
class Network with _$Network {
  const factory Network({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'origin_country') required String originCountry,
  }) = _Network;

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
}

@freezed
class AggregateCredits with _$AggregateCredits {
  const factory AggregateCredits({
    @JsonKey(name: 'cast') required List<Cast> cast,
    @JsonKey(name: 'crew') required List<Crew> crew,
  }) = _AggregateCredits;

  factory AggregateCredits.fromJson(Map<String, dynamic> json) =>
      _$AggregateCreditsFromJson(json);
}

@freezed
class Crew with _$Crew {
  const factory Crew({
    required bool adult,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'profile_path') String? profilePath,
    required int gender,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    @JsonKey(name: 'original_name') required String originalName,
    @JsonKey(name: 'popularity') required double popularity,
    @JsonKey(name: 'jobs') required List<Job> jobs, // Include jobs
    @JsonKey(name: 'department') required String department,
    @JsonKey(name: 'total_episode_count') required int totalEpisodeCount,
  }) = _Crew;

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
}

@freezed
class Cast with _$Cast {
  const factory Cast({
    required bool adult,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'profile_path') String? profilePath,
    required int gender,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    @JsonKey(name: 'original_name') required String originalName,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'total_episode_count') required int totalEpisodeCount,
    required List<Roles>? roles,
    required int order,
  }) = _Cast;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}

@freezed
class Job with _$Job {
  const factory Job({
    @JsonKey(name: 'credit_id') required String creditId,
    @JsonKey(name: 'job') required String job,
    @JsonKey(name: 'episode_count') required int episodeCount,
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

@freezed
class Roles with _$Roles {
  const factory Roles(
      {@JsonKey(name: 'credit_id') required String creditId,
      required String character,
      @JsonKey(name: 'episode_count') required int episodeCount}) = _Roles;

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);
}

@freezed
class Season with _$Season {
  const factory Season({
    @JsonKey(name: 'air_date') String? airDate,
    @JsonKey(name: 'episode_count') required int episodeCount,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'season_number') required int seasonNumber,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}
