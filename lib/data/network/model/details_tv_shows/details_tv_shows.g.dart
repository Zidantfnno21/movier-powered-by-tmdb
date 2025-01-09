// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_tv_shows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailsTvShowsImpl _$$DetailsTvShowsImplFromJson(Map<String, dynamic> json) =>
    _$DetailsTvShowsImpl(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      createdBy: (json['created_by'] as List<dynamic>?)
          ?.map((e) => Creator.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeRunTime: (json['episode_run_time'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      firstAirDate: json['first_air_date'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String,
      id: (json['id'] as num).toInt(),
      inProduction: json['in_production'] as bool,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastAirDate: json['last_air_date'] as String?,
      lastEpisodeToAir: json['last_episode_to_air'] == null
          ? null
          : Episode.fromJson(
              json['last_episode_to_air'] as Map<String, dynamic>),
      name: json['name'] as String?,
      nextEpisodeToAir: json['next_episode_to_air'] == null
          ? null
          : Episode.fromJson(
              json['next_episode_to_air'] as Map<String, dynamic>),
      networks: (json['networks'] as List<dynamic>?)
          ?.map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfEpisodes: (json['number_of_episodes'] as num?)?.toInt(),
      numberOfSeasons: (json['number_of_seasons'] as num?)?.toInt(),
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      aggregateCredits: json['aggregate_credits'] == null
          ? null
          : AggregateCredits.fromJson(
              json['aggregate_credits'] as Map<String, dynamic>),
      videos: json['videos'] == null
          ? null
          : Videos.fromJson(json['videos'] as Map<String, dynamic>),
      accountStates: json['account_states'] == null
          ? null
          : AccountStates.fromJson(
              json['account_states'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailsTvShowsImplToJson(
        _$DetailsTvShowsImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'created_by': instance.createdBy,
      'episode_run_time': instance.episodeRunTime,
      'first_air_date': instance.firstAirDate,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'in_production': instance.inProduction,
      'languages': instance.languages,
      'last_air_date': instance.lastAirDate,
      'last_episode_to_air': instance.lastEpisodeToAir,
      'name': instance.name,
      'next_episode_to_air': instance.nextEpisodeToAir,
      'networks': instance.networks,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'seasons': instance.seasons,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'aggregate_credits': instance.aggregateCredits,
      'videos': instance.videos,
      'account_states': instance.accountStates,
    };

_$CreatorImpl _$$CreatorImplFromJson(Map<String, dynamic> json) =>
    _$CreatorImpl(
      id: (json['id'] as num).toInt(),
      creditId: json['credit_id'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      gender: (json['gender'] as num).toInt(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$CreatorImplToJson(_$CreatorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'original_name': instance.originalName,
      'gender': instance.gender,
      'profile_path': instance.profilePath,
    };

_$SpokenLanguageImpl _$$SpokenLanguageImplFromJson(Map<String, dynamic> json) =>
    _$SpokenLanguageImpl(
      englishName: json['english_name'] as String,
      iso6391: json['iso_639_1'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SpokenLanguageImplToJson(
        _$SpokenLanguageImpl instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      airDate: json['air_date'] as String?,
      episodeNumber: (json['episode_number'] as num).toInt(),
      productionCode: json['production_code'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['season_number'] as num).toInt(),
      showId: (json['show_id'] as num).toInt(),
      stillPath: json['still_path'] as String?,
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
    };

_$NetworkImpl _$$NetworkImplFromJson(Map<String, dynamic> json) =>
    _$NetworkImpl(
      id: (json['id'] as num).toInt(),
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String,
      originCountry: json['origin_country'] as String,
    );

Map<String, dynamic> _$$NetworkImplToJson(_$NetworkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

_$AggregateCreditsImpl _$$AggregateCreditsImplFromJson(
        Map<String, dynamic> json) =>
    _$AggregateCreditsImpl(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AggregateCreditsImplToJson(
        _$AggregateCreditsImpl instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };

_$CrewImpl _$$CrewImplFromJson(Map<String, dynamic> json) => _$CrewImpl(
      adult: json['adult'] as bool,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      gender: (json['gender'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      jobs: (json['jobs'] as List<dynamic>)
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      department: json['department'] as String,
      totalEpisodeCount: (json['total_episode_count'] as num).toInt(),
    );

Map<String, dynamic> _$$CrewImplToJson(_$CrewImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'jobs': instance.jobs,
      'department': instance.department,
      'total_episode_count': instance.totalEpisodeCount,
    };

_$CastImpl _$$CastImplFromJson(Map<String, dynamic> json) => _$CastImpl(
      adult: json['adult'] as bool,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      gender: (json['gender'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num?)?.toDouble(),
      totalEpisodeCount: (json['total_episode_count'] as num).toInt(),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Roles.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$CastImplToJson(_$CastImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'total_episode_count': instance.totalEpisodeCount,
      'roles': instance.roles,
      'order': instance.order,
    };

_$JobImpl _$$JobImplFromJson(Map<String, dynamic> json) => _$JobImpl(
      creditId: json['credit_id'] as String,
      job: json['job'] as String,
      episodeCount: (json['episode_count'] as num).toInt(),
    );

Map<String, dynamic> _$$JobImplToJson(_$JobImpl instance) => <String, dynamic>{
      'credit_id': instance.creditId,
      'job': instance.job,
      'episode_count': instance.episodeCount,
    };

_$RolesImpl _$$RolesImplFromJson(Map<String, dynamic> json) => _$RolesImpl(
      creditId: json['credit_id'] as String,
      character: json['character'] as String,
      episodeCount: (json['episode_count'] as num).toInt(),
    );

Map<String, dynamic> _$$RolesImplToJson(_$RolesImpl instance) =>
    <String, dynamic>{
      'credit_id': instance.creditId,
      'character': instance.character,
      'episode_count': instance.episodeCount,
    };

_$SeasonImpl _$$SeasonImplFromJson(Map<String, dynamic> json) => _$SeasonImpl(
      airDate: json['air_date'] as String?,
      episodeCount: (json['episode_count'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      seasonNumber: (json['season_number'] as num).toInt(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SeasonImplToJson(_$SeasonImpl instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_count': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
      'vote_average': instance.voteAverage,
    };
