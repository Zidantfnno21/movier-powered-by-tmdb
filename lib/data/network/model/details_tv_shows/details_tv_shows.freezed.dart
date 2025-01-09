// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_tv_shows.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailsTvShows _$DetailsTvShowsFromJson(Map<String, dynamic> json) {
  return _DetailsTvShows.fromJson(json);
}

/// @nodoc
mixin _$DetailsTvShows {
  @JsonKey(name: 'adult')
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  List<Creator>? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_run_time')
  List<int>? get episodeRunTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'genres')
  List<Genre>? get genres => throw _privateConstructorUsedError;
  @JsonKey(name: 'homepage')
  String get homepage => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_production')
  bool get inProduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'languages')
  List<String>? get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_air_date')
  String? get lastAirDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_episode_to_air')
  Episode? get lastEpisodeToAir => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_episode_to_air')
  Episode? get nextEpisodeToAir => throw _privateConstructorUsedError;
  @JsonKey(name: 'networks')
  List<Network>? get networks => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_episodes')
  int? get numberOfEpisodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_seasons')
  int? get numberOfSeasons => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_country')
  List<String>? get originCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String? get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String? get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  double? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? get productionCompanies =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? get productionCountries =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'seasons')
  List<Season>? get seasons => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? get spokenLanguages =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'tagline')
  String? get tagline => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'aggregate_credits')
  AggregateCredits? get aggregateCredits => throw _privateConstructorUsedError;
  @JsonKey(name: 'videos')
  Videos? get videos => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_states')
  AccountStates? get accountStates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailsTvShowsCopyWith<DetailsTvShows> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsTvShowsCopyWith<$Res> {
  factory $DetailsTvShowsCopyWith(
          DetailsTvShows value, $Res Function(DetailsTvShows) then) =
      _$DetailsTvShowsCopyWithImpl<$Res, DetailsTvShows>;
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'created_by') List<Creator>? createdBy,
      @JsonKey(name: 'episode_run_time') List<int>? episodeRunTime,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      @JsonKey(name: 'genres') List<Genre>? genres,
      @JsonKey(name: 'homepage') String homepage,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'in_production') bool inProduction,
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
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'tagline') String? tagline,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      @JsonKey(name: 'aggregate_credits') AggregateCredits? aggregateCredits,
      @JsonKey(name: 'videos') Videos? videos,
      @JsonKey(name: 'account_states') AccountStates? accountStates});

  $EpisodeCopyWith<$Res>? get lastEpisodeToAir;
  $EpisodeCopyWith<$Res>? get nextEpisodeToAir;
  $AggregateCreditsCopyWith<$Res>? get aggregateCredits;
  $VideosCopyWith<$Res>? get videos;
  $AccountStatesCopyWith<$Res>? get accountStates;
}

/// @nodoc
class _$DetailsTvShowsCopyWithImpl<$Res, $Val extends DetailsTvShows>
    implements $DetailsTvShowsCopyWith<$Res> {
  _$DetailsTvShowsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? createdBy = freezed,
    Object? episodeRunTime = freezed,
    Object? firstAirDate = freezed,
    Object? genres = freezed,
    Object? homepage = null,
    Object? id = null,
    Object? inProduction = null,
    Object? languages = freezed,
    Object? lastAirDate = freezed,
    Object? lastEpisodeToAir = freezed,
    Object? name = freezed,
    Object? nextEpisodeToAir = freezed,
    Object? networks = freezed,
    Object? numberOfEpisodes = freezed,
    Object? numberOfSeasons = freezed,
    Object? originCountry = freezed,
    Object? originalLanguage = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? productionCompanies = freezed,
    Object? productionCountries = freezed,
    Object? seasons = freezed,
    Object? spokenLanguages = freezed,
    Object? status = null,
    Object? tagline = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? aggregateCredits = freezed,
    Object? videos = freezed,
    Object? accountStates = freezed,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as List<Creator>?,
      episodeRunTime: freezed == episodeRunTime
          ? _value.episodeRunTime
          : episodeRunTime // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      homepage: null == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inProduction: null == inProduction
          ? _value.inProduction
          : inProduction // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lastAirDate: freezed == lastAirDate
          ? _value.lastAirDate
          : lastAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastEpisodeToAir: freezed == lastEpisodeToAir
          ? _value.lastEpisodeToAir
          : lastEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as Episode?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEpisodeToAir: freezed == nextEpisodeToAir
          ? _value.nextEpisodeToAir
          : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as Episode?,
      networks: freezed == networks
          ? _value.networks
          : networks // ignore: cast_nullable_to_non_nullable
              as List<Network>?,
      numberOfEpisodes: freezed == numberOfEpisodes
          ? _value.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfSeasons: freezed == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int?,
      originCountry: freezed == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: freezed == productionCompanies
          ? _value.productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>?,
      productionCountries: freezed == productionCountries
          ? _value.productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionCountry>?,
      seasons: freezed == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
      spokenLanguages: freezed == spokenLanguages
          ? _value.spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<SpokenLanguage>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      aggregateCredits: freezed == aggregateCredits
          ? _value.aggregateCredits
          : aggregateCredits // ignore: cast_nullable_to_non_nullable
              as AggregateCredits?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as Videos?,
      accountStates: freezed == accountStates
          ? _value.accountStates
          : accountStates // ignore: cast_nullable_to_non_nullable
              as AccountStates?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EpisodeCopyWith<$Res>? get lastEpisodeToAir {
    if (_value.lastEpisodeToAir == null) {
      return null;
    }

    return $EpisodeCopyWith<$Res>(_value.lastEpisodeToAir!, (value) {
      return _then(_value.copyWith(lastEpisodeToAir: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EpisodeCopyWith<$Res>? get nextEpisodeToAir {
    if (_value.nextEpisodeToAir == null) {
      return null;
    }

    return $EpisodeCopyWith<$Res>(_value.nextEpisodeToAir!, (value) {
      return _then(_value.copyWith(nextEpisodeToAir: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AggregateCreditsCopyWith<$Res>? get aggregateCredits {
    if (_value.aggregateCredits == null) {
      return null;
    }

    return $AggregateCreditsCopyWith<$Res>(_value.aggregateCredits!, (value) {
      return _then(_value.copyWith(aggregateCredits: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VideosCopyWith<$Res>? get videos {
    if (_value.videos == null) {
      return null;
    }

    return $VideosCopyWith<$Res>(_value.videos!, (value) {
      return _then(_value.copyWith(videos: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountStatesCopyWith<$Res>? get accountStates {
    if (_value.accountStates == null) {
      return null;
    }

    return $AccountStatesCopyWith<$Res>(_value.accountStates!, (value) {
      return _then(_value.copyWith(accountStates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailsTvShowsImplCopyWith<$Res>
    implements $DetailsTvShowsCopyWith<$Res> {
  factory _$$DetailsTvShowsImplCopyWith(_$DetailsTvShowsImpl value,
          $Res Function(_$DetailsTvShowsImpl) then) =
      __$$DetailsTvShowsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'created_by') List<Creator>? createdBy,
      @JsonKey(name: 'episode_run_time') List<int>? episodeRunTime,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      @JsonKey(name: 'genres') List<Genre>? genres,
      @JsonKey(name: 'homepage') String homepage,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'in_production') bool inProduction,
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
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'tagline') String? tagline,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      @JsonKey(name: 'aggregate_credits') AggregateCredits? aggregateCredits,
      @JsonKey(name: 'videos') Videos? videos,
      @JsonKey(name: 'account_states') AccountStates? accountStates});

  @override
  $EpisodeCopyWith<$Res>? get lastEpisodeToAir;
  @override
  $EpisodeCopyWith<$Res>? get nextEpisodeToAir;
  @override
  $AggregateCreditsCopyWith<$Res>? get aggregateCredits;
  @override
  $VideosCopyWith<$Res>? get videos;
  @override
  $AccountStatesCopyWith<$Res>? get accountStates;
}

/// @nodoc
class __$$DetailsTvShowsImplCopyWithImpl<$Res>
    extends _$DetailsTvShowsCopyWithImpl<$Res, _$DetailsTvShowsImpl>
    implements _$$DetailsTvShowsImplCopyWith<$Res> {
  __$$DetailsTvShowsImplCopyWithImpl(
      _$DetailsTvShowsImpl _value, $Res Function(_$DetailsTvShowsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? createdBy = freezed,
    Object? episodeRunTime = freezed,
    Object? firstAirDate = freezed,
    Object? genres = freezed,
    Object? homepage = null,
    Object? id = null,
    Object? inProduction = null,
    Object? languages = freezed,
    Object? lastAirDate = freezed,
    Object? lastEpisodeToAir = freezed,
    Object? name = freezed,
    Object? nextEpisodeToAir = freezed,
    Object? networks = freezed,
    Object? numberOfEpisodes = freezed,
    Object? numberOfSeasons = freezed,
    Object? originCountry = freezed,
    Object? originalLanguage = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? productionCompanies = freezed,
    Object? productionCountries = freezed,
    Object? seasons = freezed,
    Object? spokenLanguages = freezed,
    Object? status = null,
    Object? tagline = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? aggregateCredits = freezed,
    Object? videos = freezed,
    Object? accountStates = freezed,
  }) {
    return _then(_$DetailsTvShowsImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value._createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as List<Creator>?,
      episodeRunTime: freezed == episodeRunTime
          ? _value._episodeRunTime
          : episodeRunTime // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      homepage: null == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inProduction: null == inProduction
          ? _value.inProduction
          : inProduction // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lastAirDate: freezed == lastAirDate
          ? _value.lastAirDate
          : lastAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastEpisodeToAir: freezed == lastEpisodeToAir
          ? _value.lastEpisodeToAir
          : lastEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as Episode?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEpisodeToAir: freezed == nextEpisodeToAir
          ? _value.nextEpisodeToAir
          : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as Episode?,
      networks: freezed == networks
          ? _value._networks
          : networks // ignore: cast_nullable_to_non_nullable
              as List<Network>?,
      numberOfEpisodes: freezed == numberOfEpisodes
          ? _value.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfSeasons: freezed == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int?,
      originCountry: freezed == originCountry
          ? _value._originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: freezed == productionCompanies
          ? _value._productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>?,
      productionCountries: freezed == productionCountries
          ? _value._productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionCountry>?,
      seasons: freezed == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
      spokenLanguages: freezed == spokenLanguages
          ? _value._spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<SpokenLanguage>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      aggregateCredits: freezed == aggregateCredits
          ? _value.aggregateCredits
          : aggregateCredits // ignore: cast_nullable_to_non_nullable
              as AggregateCredits?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as Videos?,
      accountStates: freezed == accountStates
          ? _value.accountStates
          : accountStates // ignore: cast_nullable_to_non_nullable
              as AccountStates?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailsTvShowsImpl implements _DetailsTvShows {
  const _$DetailsTvShowsImpl(
      {@JsonKey(name: 'adult') required this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'created_by') final List<Creator>? createdBy,
      @JsonKey(name: 'episode_run_time') final List<int>? episodeRunTime,
      @JsonKey(name: 'first_air_date') this.firstAirDate,
      @JsonKey(name: 'genres') final List<Genre>? genres,
      @JsonKey(name: 'homepage') required this.homepage,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'in_production') required this.inProduction,
      @JsonKey(name: 'languages') final List<String>? languages,
      @JsonKey(name: 'last_air_date') this.lastAirDate,
      @JsonKey(name: 'last_episode_to_air') this.lastEpisodeToAir,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'next_episode_to_air') this.nextEpisodeToAir,
      @JsonKey(name: 'networks') final List<Network>? networks,
      @JsonKey(name: 'number_of_episodes') this.numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') this.numberOfSeasons,
      @JsonKey(name: 'origin_country') final List<String>? originCountry,
      @JsonKey(name: 'original_language') this.originalLanguage,
      @JsonKey(name: 'original_name') this.originalName,
      @JsonKey(name: 'overview') this.overview,
      @JsonKey(name: 'popularity') this.popularity,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'production_companies')
      final List<ProductionCompany>? productionCompanies,
      @JsonKey(name: 'production_countries')
      final List<ProductionCountry>? productionCountries,
      @JsonKey(name: 'seasons') final List<Season>? seasons,
      @JsonKey(name: 'spoken_languages')
      final List<SpokenLanguage>? spokenLanguages,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'tagline') this.tagline,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount,
      @JsonKey(name: 'aggregate_credits') this.aggregateCredits,
      @JsonKey(name: 'videos') this.videos,
      @JsonKey(name: 'account_states') this.accountStates})
      : _createdBy = createdBy,
        _episodeRunTime = episodeRunTime,
        _genres = genres,
        _languages = languages,
        _networks = networks,
        _originCountry = originCountry,
        _productionCompanies = productionCompanies,
        _productionCountries = productionCountries,
        _seasons = seasons,
        _spokenLanguages = spokenLanguages;

  factory _$DetailsTvShowsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailsTvShowsImplFromJson(json);

  @override
  @JsonKey(name: 'adult')
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final List<Creator>? _createdBy;
  @override
  @JsonKey(name: 'created_by')
  List<Creator>? get createdBy {
    final value = _createdBy;
    if (value == null) return null;
    if (_createdBy is EqualUnmodifiableListView) return _createdBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _episodeRunTime;
  @override
  @JsonKey(name: 'episode_run_time')
  List<int>? get episodeRunTime {
    final value = _episodeRunTime;
    if (value == null) return null;
    if (_episodeRunTime is EqualUnmodifiableListView) return _episodeRunTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  final List<Genre>? _genres;
  @override
  @JsonKey(name: 'genres')
  List<Genre>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'homepage')
  final String homepage;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'in_production')
  final bool inProduction;
  final List<String>? _languages;
  @override
  @JsonKey(name: 'languages')
  List<String>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'last_air_date')
  final String? lastAirDate;
  @override
  @JsonKey(name: 'last_episode_to_air')
  final Episode? lastEpisodeToAir;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'next_episode_to_air')
  final Episode? nextEpisodeToAir;
  final List<Network>? _networks;
  @override
  @JsonKey(name: 'networks')
  List<Network>? get networks {
    final value = _networks;
    if (value == null) return null;
    if (_networks is EqualUnmodifiableListView) return _networks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'number_of_episodes')
  final int? numberOfEpisodes;
  @override
  @JsonKey(name: 'number_of_seasons')
  final int? numberOfSeasons;
  final List<String>? _originCountry;
  @override
  @JsonKey(name: 'origin_country')
  List<String>? get originCountry {
    final value = _originCountry;
    if (value == null) return null;
    if (_originCountry is EqualUnmodifiableListView) return _originCountry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @override
  @JsonKey(name: 'original_name')
  final String? originalName;
  @override
  @JsonKey(name: 'overview')
  final String? overview;
  @override
  @JsonKey(name: 'popularity')
  final double? popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final List<ProductionCompany>? _productionCompanies;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? get productionCompanies {
    final value = _productionCompanies;
    if (value == null) return null;
    if (_productionCompanies is EqualUnmodifiableListView)
      return _productionCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductionCountry>? _productionCountries;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? get productionCountries {
    final value = _productionCountries;
    if (value == null) return null;
    if (_productionCountries is EqualUnmodifiableListView)
      return _productionCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Season>? _seasons;
  @override
  @JsonKey(name: 'seasons')
  List<Season>? get seasons {
    final value = _seasons;
    if (value == null) return null;
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SpokenLanguage>? _spokenLanguages;
  @override
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? get spokenLanguages {
    final value = _spokenLanguages;
    if (value == null) return null;
    if (_spokenLanguages is EqualUnmodifiableListView) return _spokenLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'tagline')
  final String? tagline;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @override
  @JsonKey(name: 'aggregate_credits')
  final AggregateCredits? aggregateCredits;
  @override
  @JsonKey(name: 'videos')
  final Videos? videos;
  @override
  @JsonKey(name: 'account_states')
  final AccountStates? accountStates;

  @override
  String toString() {
    return 'DetailsTvShows(adult: $adult, backdropPath: $backdropPath, createdBy: $createdBy, episodeRunTime: $episodeRunTime, firstAirDate: $firstAirDate, genres: $genres, homepage: $homepage, id: $id, inProduction: $inProduction, languages: $languages, lastAirDate: $lastAirDate, lastEpisodeToAir: $lastEpisodeToAir, name: $name, nextEpisodeToAir: $nextEpisodeToAir, networks: $networks, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, seasons: $seasons, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, voteAverage: $voteAverage, voteCount: $voteCount, aggregateCredits: $aggregateCredits, videos: $videos, accountStates: $accountStates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsTvShowsImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            const DeepCollectionEquality()
                .equals(other._createdBy, _createdBy) &&
            const DeepCollectionEquality()
                .equals(other._episodeRunTime, _episodeRunTime) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inProduction, inProduction) ||
                other.inProduction == inProduction) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.lastAirDate, lastAirDate) ||
                other.lastAirDate == lastAirDate) &&
            (identical(other.lastEpisodeToAir, lastEpisodeToAir) ||
                other.lastEpisodeToAir == lastEpisodeToAir) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nextEpisodeToAir, nextEpisodeToAir) ||
                other.nextEpisodeToAir == nextEpisodeToAir) &&
            const DeepCollectionEquality().equals(other._networks, _networks) &&
            (identical(other.numberOfEpisodes, numberOfEpisodes) ||
                other.numberOfEpisodes == numberOfEpisodes) &&
            (identical(other.numberOfSeasons, numberOfSeasons) ||
                other.numberOfSeasons == numberOfSeasons) &&
            const DeepCollectionEquality()
                .equals(other._originCountry, _originCountry) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            const DeepCollectionEquality()
                .equals(other._productionCompanies, _productionCompanies) &&
            const DeepCollectionEquality()
                .equals(other._productionCountries, _productionCountries) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            const DeepCollectionEquality()
                .equals(other._spokenLanguages, _spokenLanguages) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.aggregateCredits, aggregateCredits) ||
                other.aggregateCredits == aggregateCredits) &&
            (identical(other.videos, videos) || other.videos == videos) &&
            (identical(other.accountStates, accountStates) ||
                other.accountStates == accountStates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        adult,
        backdropPath,
        const DeepCollectionEquality().hash(_createdBy),
        const DeepCollectionEquality().hash(_episodeRunTime),
        firstAirDate,
        const DeepCollectionEquality().hash(_genres),
        homepage,
        id,
        inProduction,
        const DeepCollectionEquality().hash(_languages),
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        const DeepCollectionEquality().hash(_networks),
        numberOfEpisodes,
        numberOfSeasons,
        const DeepCollectionEquality().hash(_originCountry),
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        const DeepCollectionEquality().hash(_productionCompanies),
        const DeepCollectionEquality().hash(_productionCountries),
        const DeepCollectionEquality().hash(_seasons),
        const DeepCollectionEquality().hash(_spokenLanguages),
        status,
        tagline,
        voteAverage,
        voteCount,
        aggregateCredits,
        videos,
        accountStates
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsTvShowsImplCopyWith<_$DetailsTvShowsImpl> get copyWith =>
      __$$DetailsTvShowsImplCopyWithImpl<_$DetailsTvShowsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailsTvShowsImplToJson(
      this,
    );
  }
}

abstract class _DetailsTvShows implements DetailsTvShows {
  const factory _DetailsTvShows(
      {@JsonKey(name: 'adult') required final bool adult,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'created_by') final List<Creator>? createdBy,
      @JsonKey(name: 'episode_run_time') final List<int>? episodeRunTime,
      @JsonKey(name: 'first_air_date') final String? firstAirDate,
      @JsonKey(name: 'genres') final List<Genre>? genres,
      @JsonKey(name: 'homepage') required final String homepage,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'in_production') required final bool inProduction,
      @JsonKey(name: 'languages') final List<String>? languages,
      @JsonKey(name: 'last_air_date') final String? lastAirDate,
      @JsonKey(name: 'last_episode_to_air') final Episode? lastEpisodeToAir,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'next_episode_to_air') final Episode? nextEpisodeToAir,
      @JsonKey(name: 'networks') final List<Network>? networks,
      @JsonKey(name: 'number_of_episodes') final int? numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') final int? numberOfSeasons,
      @JsonKey(name: 'origin_country') final List<String>? originCountry,
      @JsonKey(name: 'original_language') final String? originalLanguage,
      @JsonKey(name: 'original_name') final String? originalName,
      @JsonKey(name: 'overview') final String? overview,
      @JsonKey(name: 'popularity') final double? popularity,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'production_companies')
      final List<ProductionCompany>? productionCompanies,
      @JsonKey(name: 'production_countries')
      final List<ProductionCountry>? productionCountries,
      @JsonKey(name: 'seasons') final List<Season>? seasons,
      @JsonKey(name: 'spoken_languages')
      final List<SpokenLanguage>? spokenLanguages,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'tagline') final String? tagline,
      @JsonKey(name: 'vote_average') final double? voteAverage,
      @JsonKey(name: 'vote_count') final int? voteCount,
      @JsonKey(name: 'aggregate_credits')
      final AggregateCredits? aggregateCredits,
      @JsonKey(name: 'videos') final Videos? videos,
      @JsonKey(name: 'account_states')
      final AccountStates? accountStates}) = _$DetailsTvShowsImpl;

  factory _DetailsTvShows.fromJson(Map<String, dynamic> json) =
      _$DetailsTvShowsImpl.fromJson;

  @override
  @JsonKey(name: 'adult')
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'created_by')
  List<Creator>? get createdBy;
  @override
  @JsonKey(name: 'episode_run_time')
  List<int>? get episodeRunTime;
  @override
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate;
  @override
  @JsonKey(name: 'genres')
  List<Genre>? get genres;
  @override
  @JsonKey(name: 'homepage')
  String get homepage;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'in_production')
  bool get inProduction;
  @override
  @JsonKey(name: 'languages')
  List<String>? get languages;
  @override
  @JsonKey(name: 'last_air_date')
  String? get lastAirDate;
  @override
  @JsonKey(name: 'last_episode_to_air')
  Episode? get lastEpisodeToAir;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'next_episode_to_air')
  Episode? get nextEpisodeToAir;
  @override
  @JsonKey(name: 'networks')
  List<Network>? get networks;
  @override
  @JsonKey(name: 'number_of_episodes')
  int? get numberOfEpisodes;
  @override
  @JsonKey(name: 'number_of_seasons')
  int? get numberOfSeasons;
  @override
  @JsonKey(name: 'origin_country')
  List<String>? get originCountry;
  @override
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @override
  @JsonKey(name: 'original_name')
  String? get originalName;
  @override
  @JsonKey(name: 'overview')
  String? get overview;
  @override
  @JsonKey(name: 'popularity')
  double? get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? get productionCompanies;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? get productionCountries;
  @override
  @JsonKey(name: 'seasons')
  List<Season>? get seasons;
  @override
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? get spokenLanguages;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'tagline')
  String? get tagline;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  @JsonKey(name: 'aggregate_credits')
  AggregateCredits? get aggregateCredits;
  @override
  @JsonKey(name: 'videos')
  Videos? get videos;
  @override
  @JsonKey(name: 'account_states')
  AccountStates? get accountStates;
  @override
  @JsonKey(ignore: true)
  _$$DetailsTvShowsImplCopyWith<_$DetailsTvShowsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Creator _$CreatorFromJson(Map<String, dynamic> json) {
  return _Creator.fromJson(json);
}

/// @nodoc
mixin _$Creator {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_id')
  String get creditId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  int get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatorCopyWith<Creator> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatorCopyWith<$Res> {
  factory $CreatorCopyWith(Creator value, $Res Function(Creator) then) =
      _$CreatorCopyWithImpl<$Res, Creator>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'credit_id') String creditId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'gender') int gender,
      @JsonKey(name: 'profile_path') String? profilePath});
}

/// @nodoc
class _$CreatorCopyWithImpl<$Res, $Val extends Creator>
    implements $CreatorCopyWith<$Res> {
  _$CreatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creditId = null,
    Object? name = null,
    Object? originalName = null,
    Object? gender = null,
    Object? profilePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatorImplCopyWith<$Res> implements $CreatorCopyWith<$Res> {
  factory _$$CreatorImplCopyWith(
          _$CreatorImpl value, $Res Function(_$CreatorImpl) then) =
      __$$CreatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'credit_id') String creditId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'gender') int gender,
      @JsonKey(name: 'profile_path') String? profilePath});
}

/// @nodoc
class __$$CreatorImplCopyWithImpl<$Res>
    extends _$CreatorCopyWithImpl<$Res, _$CreatorImpl>
    implements _$$CreatorImplCopyWith<$Res> {
  __$$CreatorImplCopyWithImpl(
      _$CreatorImpl _value, $Res Function(_$CreatorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creditId = null,
    Object? name = null,
    Object? originalName = null,
    Object? gender = null,
    Object? profilePath = freezed,
  }) {
    return _then(_$CreatorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatorImpl implements _Creator {
  const _$CreatorImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'credit_id') required this.creditId,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'original_name') required this.originalName,
      @JsonKey(name: 'gender') required this.gender,
      @JsonKey(name: 'profile_path') this.profilePath});

  factory _$CreatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatorImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'credit_id')
  final String creditId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  @JsonKey(name: 'gender')
  final int gender;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  @override
  String toString() {
    return 'Creator(id: $id, creditId: $creditId, name: $name, originalName: $originalName, gender: $gender, profilePath: $profilePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, creditId, name, originalName, gender, profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatorImplCopyWith<_$CreatorImpl> get copyWith =>
      __$$CreatorImplCopyWithImpl<_$CreatorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatorImplToJson(
      this,
    );
  }
}

abstract class _Creator implements Creator {
  const factory _Creator(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'credit_id') required final String creditId,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'original_name') required final String originalName,
          @JsonKey(name: 'gender') required final int gender,
          @JsonKey(name: 'profile_path') final String? profilePath}) =
      _$CreatorImpl;

  factory _Creator.fromJson(Map<String, dynamic> json) = _$CreatorImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'credit_id')
  String get creditId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  @JsonKey(name: 'gender')
  int get gender;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$CreatorImplCopyWith<_$CreatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return _SpokenLanguage.fromJson(json);
}

/// @nodoc
mixin _$SpokenLanguage {
  @JsonKey(name: 'english_name')
  String get englishName => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_639_1')
  String get iso6391 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpokenLanguageCopyWith<SpokenLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpokenLanguageCopyWith<$Res> {
  factory $SpokenLanguageCopyWith(
          SpokenLanguage value, $Res Function(SpokenLanguage) then) =
      _$SpokenLanguageCopyWithImpl<$Res, SpokenLanguage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'english_name') String englishName,
      @JsonKey(name: 'iso_639_1') String iso6391,
      String name});
}

/// @nodoc
class _$SpokenLanguageCopyWithImpl<$Res, $Val extends SpokenLanguage>
    implements $SpokenLanguageCopyWith<$Res> {
  _$SpokenLanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? englishName = null,
    Object? iso6391 = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpokenLanguageImplCopyWith<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  factory _$$SpokenLanguageImplCopyWith(_$SpokenLanguageImpl value,
          $Res Function(_$SpokenLanguageImpl) then) =
      __$$SpokenLanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'english_name') String englishName,
      @JsonKey(name: 'iso_639_1') String iso6391,
      String name});
}

/// @nodoc
class __$$SpokenLanguageImplCopyWithImpl<$Res>
    extends _$SpokenLanguageCopyWithImpl<$Res, _$SpokenLanguageImpl>
    implements _$$SpokenLanguageImplCopyWith<$Res> {
  __$$SpokenLanguageImplCopyWithImpl(
      _$SpokenLanguageImpl _value, $Res Function(_$SpokenLanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? englishName = null,
    Object? iso6391 = null,
    Object? name = null,
  }) {
    return _then(_$SpokenLanguageImpl(
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpokenLanguageImpl implements _SpokenLanguage {
  const _$SpokenLanguageImpl(
      {@JsonKey(name: 'english_name') required this.englishName,
      @JsonKey(name: 'iso_639_1') required this.iso6391,
      required this.name});

  factory _$SpokenLanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpokenLanguageImplFromJson(json);

  @override
  @JsonKey(name: 'english_name')
  final String englishName;
  @override
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @override
  final String name;

  @override
  String toString() {
    return 'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpokenLanguageImpl &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.iso6391, iso6391) || other.iso6391 == iso6391) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, englishName, iso6391, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpokenLanguageImplCopyWith<_$SpokenLanguageImpl> get copyWith =>
      __$$SpokenLanguageImplCopyWithImpl<_$SpokenLanguageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpokenLanguageImplToJson(
      this,
    );
  }
}

abstract class _SpokenLanguage implements SpokenLanguage {
  const factory _SpokenLanguage(
      {@JsonKey(name: 'english_name') required final String englishName,
      @JsonKey(name: 'iso_639_1') required final String iso6391,
      required final String name}) = _$SpokenLanguageImpl;

  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) =
      _$SpokenLanguageImpl.fromJson;

  @override
  @JsonKey(name: 'english_name')
  String get englishName;
  @override
  @JsonKey(name: 'iso_639_1')
  String get iso6391;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SpokenLanguageImplCopyWith<_$SpokenLanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return _Episode.fromJson(json);
}

/// @nodoc
mixin _$Episode {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_date')
  String? get airDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_number')
  int get episodeNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_code')
  String? get productionCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'runtime')
  int? get runtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_number')
  int get seasonNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_id')
  int get showId => throw _privateConstructorUsedError;
  @JsonKey(name: 'still_path')
  String? get stillPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeCopyWith<Episode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeCopyWith<$Res> {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) then) =
      _$EpisodeCopyWithImpl<$Res, Episode>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'overview') String? overview,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      @JsonKey(name: 'air_date') String? airDate,
      @JsonKey(name: 'episode_number') int episodeNumber,
      @JsonKey(name: 'production_code') String? productionCode,
      @JsonKey(name: 'runtime') int? runtime,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'show_id') int showId,
      @JsonKey(name: 'still_path') String? stillPath});
}

/// @nodoc
class _$EpisodeCopyWithImpl<$Res, $Val extends Episode>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? overview = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? airDate = freezed,
    Object? episodeNumber = null,
    Object? productionCode = freezed,
    Object? runtime = freezed,
    Object? seasonNumber = null,
    Object? showId = null,
    Object? stillPath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeNumber: null == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      productionCode: freezed == productionCode
          ? _value.productionCode
          : productionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      showId: null == showId
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
      stillPath: freezed == stillPath
          ? _value.stillPath
          : stillPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpisodeImplCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$$EpisodeImplCopyWith(
          _$EpisodeImpl value, $Res Function(_$EpisodeImpl) then) =
      __$$EpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'overview') String? overview,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      @JsonKey(name: 'air_date') String? airDate,
      @JsonKey(name: 'episode_number') int episodeNumber,
      @JsonKey(name: 'production_code') String? productionCode,
      @JsonKey(name: 'runtime') int? runtime,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'show_id') int showId,
      @JsonKey(name: 'still_path') String? stillPath});
}

/// @nodoc
class __$$EpisodeImplCopyWithImpl<$Res>
    extends _$EpisodeCopyWithImpl<$Res, _$EpisodeImpl>
    implements _$$EpisodeImplCopyWith<$Res> {
  __$$EpisodeImplCopyWithImpl(
      _$EpisodeImpl _value, $Res Function(_$EpisodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? overview = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? airDate = freezed,
    Object? episodeNumber = null,
    Object? productionCode = freezed,
    Object? runtime = freezed,
    Object? seasonNumber = null,
    Object? showId = null,
    Object? stillPath = freezed,
  }) {
    return _then(_$EpisodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeNumber: null == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      productionCode: freezed == productionCode
          ? _value.productionCode
          : productionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      showId: null == showId
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
      stillPath: freezed == stillPath
          ? _value.stillPath
          : stillPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeImpl implements _Episode {
  const _$EpisodeImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'overview') this.overview,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount,
      @JsonKey(name: 'air_date') this.airDate,
      @JsonKey(name: 'episode_number') required this.episodeNumber,
      @JsonKey(name: 'production_code') this.productionCode,
      @JsonKey(name: 'runtime') this.runtime,
      @JsonKey(name: 'season_number') required this.seasonNumber,
      @JsonKey(name: 'show_id') required this.showId,
      @JsonKey(name: 'still_path') this.stillPath});

  factory _$EpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'overview')
  final String? overview;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @override
  @JsonKey(name: 'air_date')
  final String? airDate;
  @override
  @JsonKey(name: 'episode_number')
  final int episodeNumber;
  @override
  @JsonKey(name: 'production_code')
  final String? productionCode;
  @override
  @JsonKey(name: 'runtime')
  final int? runtime;
  @override
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @override
  @JsonKey(name: 'show_id')
  final int showId;
  @override
  @JsonKey(name: 'still_path')
  final String? stillPath;

  @override
  String toString() {
    return 'Episode(id: $id, name: $name, overview: $overview, voteAverage: $voteAverage, voteCount: $voteCount, airDate: $airDate, episodeNumber: $episodeNumber, productionCode: $productionCode, runtime: $runtime, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            (identical(other.productionCode, productionCode) ||
                other.productionCode == productionCode) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.showId, showId) || other.showId == showId) &&
            (identical(other.stillPath, stillPath) ||
                other.stillPath == stillPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      overview,
      voteAverage,
      voteCount,
      airDate,
      episodeNumber,
      productionCode,
      runtime,
      seasonNumber,
      showId,
      stillPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      __$$EpisodeImplCopyWithImpl<_$EpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeImplToJson(
      this,
    );
  }
}

abstract class _Episode implements Episode {
  const factory _Episode(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'overview') final String? overview,
      @JsonKey(name: 'vote_average') final double? voteAverage,
      @JsonKey(name: 'vote_count') final int? voteCount,
      @JsonKey(name: 'air_date') final String? airDate,
      @JsonKey(name: 'episode_number') required final int episodeNumber,
      @JsonKey(name: 'production_code') final String? productionCode,
      @JsonKey(name: 'runtime') final int? runtime,
      @JsonKey(name: 'season_number') required final int seasonNumber,
      @JsonKey(name: 'show_id') required final int showId,
      @JsonKey(name: 'still_path') final String? stillPath}) = _$EpisodeImpl;

  factory _Episode.fromJson(Map<String, dynamic> json) = _$EpisodeImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'overview')
  String? get overview;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  @JsonKey(name: 'air_date')
  String? get airDate;
  @override
  @JsonKey(name: 'episode_number')
  int get episodeNumber;
  @override
  @JsonKey(name: 'production_code')
  String? get productionCode;
  @override
  @JsonKey(name: 'runtime')
  int? get runtime;
  @override
  @JsonKey(name: 'season_number')
  int get seasonNumber;
  @override
  @JsonKey(name: 'show_id')
  int get showId;
  @override
  @JsonKey(name: 'still_path')
  String? get stillPath;
  @override
  @JsonKey(ignore: true)
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Network _$NetworkFromJson(Map<String, dynamic> json) {
  return _Network.fromJson(json);
}

/// @nodoc
mixin _$Network {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_path')
  String? get logoPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_country')
  String get originCountry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkCopyWith<Network> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkCopyWith<$Res> {
  factory $NetworkCopyWith(Network value, $Res Function(Network) then) =
      _$NetworkCopyWithImpl<$Res, Network>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'logo_path') String? logoPath,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'origin_country') String originCountry});
}

/// @nodoc
class _$NetworkCopyWithImpl<$Res, $Val extends Network>
    implements $NetworkCopyWith<$Res> {
  _$NetworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logoPath = freezed,
    Object? name = null,
    Object? originCountry = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkImplCopyWith<$Res> implements $NetworkCopyWith<$Res> {
  factory _$$NetworkImplCopyWith(
          _$NetworkImpl value, $Res Function(_$NetworkImpl) then) =
      __$$NetworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'logo_path') String? logoPath,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'origin_country') String originCountry});
}

/// @nodoc
class __$$NetworkImplCopyWithImpl<$Res>
    extends _$NetworkCopyWithImpl<$Res, _$NetworkImpl>
    implements _$$NetworkImplCopyWith<$Res> {
  __$$NetworkImplCopyWithImpl(
      _$NetworkImpl _value, $Res Function(_$NetworkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logoPath = freezed,
    Object? name = null,
    Object? originCountry = null,
  }) {
    return _then(_$NetworkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkImpl implements _Network {
  const _$NetworkImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'logo_path') this.logoPath,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'origin_country') required this.originCountry});

  factory _$NetworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'origin_country')
  final String originCountry;

  @override
  String toString() {
    return 'Network(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, logoPath, name, originCountry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      __$$NetworkImplCopyWithImpl<_$NetworkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkImplToJson(
      this,
    );
  }
}

abstract class _Network implements Network {
  const factory _Network(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'logo_path') final String? logoPath,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'origin_country')
      required final String originCountry}) = _$NetworkImpl;

  factory _Network.fromJson(Map<String, dynamic> json) = _$NetworkImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'logo_path')
  String? get logoPath;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'origin_country')
  String get originCountry;
  @override
  @JsonKey(ignore: true)
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AggregateCredits _$AggregateCreditsFromJson(Map<String, dynamic> json) {
  return _AggregateCredits.fromJson(json);
}

/// @nodoc
mixin _$AggregateCredits {
  @JsonKey(name: 'cast')
  List<Cast> get cast => throw _privateConstructorUsedError;
  @JsonKey(name: 'crew')
  List<Crew> get crew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AggregateCreditsCopyWith<AggregateCredits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AggregateCreditsCopyWith<$Res> {
  factory $AggregateCreditsCopyWith(
          AggregateCredits value, $Res Function(AggregateCredits) then) =
      _$AggregateCreditsCopyWithImpl<$Res, AggregateCredits>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cast') List<Cast> cast,
      @JsonKey(name: 'crew') List<Crew> crew});
}

/// @nodoc
class _$AggregateCreditsCopyWithImpl<$Res, $Val extends AggregateCredits>
    implements $AggregateCreditsCopyWith<$Res> {
  _$AggregateCreditsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cast = null,
    Object? crew = null,
  }) {
    return _then(_value.copyWith(
      cast: null == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
      crew: null == crew
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<Crew>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AggregateCreditsImplCopyWith<$Res>
    implements $AggregateCreditsCopyWith<$Res> {
  factory _$$AggregateCreditsImplCopyWith(_$AggregateCreditsImpl value,
          $Res Function(_$AggregateCreditsImpl) then) =
      __$$AggregateCreditsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cast') List<Cast> cast,
      @JsonKey(name: 'crew') List<Crew> crew});
}

/// @nodoc
class __$$AggregateCreditsImplCopyWithImpl<$Res>
    extends _$AggregateCreditsCopyWithImpl<$Res, _$AggregateCreditsImpl>
    implements _$$AggregateCreditsImplCopyWith<$Res> {
  __$$AggregateCreditsImplCopyWithImpl(_$AggregateCreditsImpl _value,
      $Res Function(_$AggregateCreditsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cast = null,
    Object? crew = null,
  }) {
    return _then(_$AggregateCreditsImpl(
      cast: null == cast
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
      crew: null == crew
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<Crew>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AggregateCreditsImpl implements _AggregateCredits {
  const _$AggregateCreditsImpl(
      {@JsonKey(name: 'cast') required final List<Cast> cast,
      @JsonKey(name: 'crew') required final List<Crew> crew})
      : _cast = cast,
        _crew = crew;

  factory _$AggregateCreditsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AggregateCreditsImplFromJson(json);

  final List<Cast> _cast;
  @override
  @JsonKey(name: 'cast')
  List<Cast> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cast);
  }

  final List<Crew> _crew;
  @override
  @JsonKey(name: 'crew')
  List<Crew> get crew {
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crew);
  }

  @override
  String toString() {
    return 'AggregateCredits(cast: $cast, crew: $crew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AggregateCreditsImpl &&
            const DeepCollectionEquality().equals(other._cast, _cast) &&
            const DeepCollectionEquality().equals(other._crew, _crew));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cast),
      const DeepCollectionEquality().hash(_crew));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AggregateCreditsImplCopyWith<_$AggregateCreditsImpl> get copyWith =>
      __$$AggregateCreditsImplCopyWithImpl<_$AggregateCreditsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AggregateCreditsImplToJson(
      this,
    );
  }
}

abstract class _AggregateCredits implements AggregateCredits {
  const factory _AggregateCredits(
          {@JsonKey(name: 'cast') required final List<Cast> cast,
          @JsonKey(name: 'crew') required final List<Crew> crew}) =
      _$AggregateCreditsImpl;

  factory _AggregateCredits.fromJson(Map<String, dynamic> json) =
      _$AggregateCreditsImpl.fromJson;

  @override
  @JsonKey(name: 'cast')
  List<Cast> get cast;
  @override
  @JsonKey(name: 'crew')
  List<Crew> get crew;
  @override
  @JsonKey(ignore: true)
  _$$AggregateCreditsImplCopyWith<_$AggregateCreditsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return _Crew.fromJson(json);
}

/// @nodoc
mixin _$Crew {
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'jobs')
  List<Job> get jobs => throw _privateConstructorUsedError; // Include jobs
  @JsonKey(name: 'department')
  String get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_episode_count')
  int get totalEpisodeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrewCopyWith<Crew> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrewCopyWith<$Res> {
  factory $CrewCopyWith(Crew value, $Res Function(Crew) then) =
      _$CrewCopyWithImpl<$Res, Crew>;
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'profile_path') String? profilePath,
      int gender,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'jobs') List<Job> jobs,
      @JsonKey(name: 'department') String department,
      @JsonKey(name: 'total_episode_count') int totalEpisodeCount});
}

/// @nodoc
class _$CrewCopyWithImpl<$Res, $Val extends Crew>
    implements $CrewCopyWith<$Res> {
  _$CrewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? id = null,
    Object? name = null,
    Object? profilePath = freezed,
    Object? gender = null,
    Object? knownForDepartment = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? jobs = null,
    Object? department = null,
    Object? totalEpisodeCount = null,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      jobs: null == jobs
          ? _value.jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<Job>,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      totalEpisodeCount: null == totalEpisodeCount
          ? _value.totalEpisodeCount
          : totalEpisodeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrewImplCopyWith<$Res> implements $CrewCopyWith<$Res> {
  factory _$$CrewImplCopyWith(
          _$CrewImpl value, $Res Function(_$CrewImpl) then) =
      __$$CrewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'profile_path') String? profilePath,
      int gender,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'jobs') List<Job> jobs,
      @JsonKey(name: 'department') String department,
      @JsonKey(name: 'total_episode_count') int totalEpisodeCount});
}

/// @nodoc
class __$$CrewImplCopyWithImpl<$Res>
    extends _$CrewCopyWithImpl<$Res, _$CrewImpl>
    implements _$$CrewImplCopyWith<$Res> {
  __$$CrewImplCopyWithImpl(_$CrewImpl _value, $Res Function(_$CrewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? id = null,
    Object? name = null,
    Object? profilePath = freezed,
    Object? gender = null,
    Object? knownForDepartment = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? jobs = null,
    Object? department = null,
    Object? totalEpisodeCount = null,
  }) {
    return _then(_$CrewImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      jobs: null == jobs
          ? _value._jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<Job>,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      totalEpisodeCount: null == totalEpisodeCount
          ? _value.totalEpisodeCount
          : totalEpisodeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrewImpl implements _Crew {
  const _$CrewImpl(
      {required this.adult,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'profile_path') this.profilePath,
      required this.gender,
      @JsonKey(name: 'known_for_department') required this.knownForDepartment,
      @JsonKey(name: 'original_name') required this.originalName,
      @JsonKey(name: 'popularity') required this.popularity,
      @JsonKey(name: 'jobs') required final List<Job> jobs,
      @JsonKey(name: 'department') required this.department,
      @JsonKey(name: 'total_episode_count') required this.totalEpisodeCount})
      : _jobs = jobs;

  factory _$CrewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrewImplFromJson(json);

  @override
  final bool adult;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  final int gender;
  @override
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  @JsonKey(name: 'popularity')
  final double popularity;
  final List<Job> _jobs;
  @override
  @JsonKey(name: 'jobs')
  List<Job> get jobs {
    if (_jobs is EqualUnmodifiableListView) return _jobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobs);
  }

// Include jobs
  @override
  @JsonKey(name: 'department')
  final String department;
  @override
  @JsonKey(name: 'total_episode_count')
  final int totalEpisodeCount;

  @override
  String toString() {
    return 'Crew(adult: $adult, id: $id, name: $name, profilePath: $profilePath, gender: $gender, knownForDepartment: $knownForDepartment, originalName: $originalName, popularity: $popularity, jobs: $jobs, department: $department, totalEpisodeCount: $totalEpisodeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrewImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.knownForDepartment, knownForDepartment) ||
                other.knownForDepartment == knownForDepartment) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            const DeepCollectionEquality().equals(other._jobs, _jobs) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.totalEpisodeCount, totalEpisodeCount) ||
                other.totalEpisodeCount == totalEpisodeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      id,
      name,
      profilePath,
      gender,
      knownForDepartment,
      originalName,
      popularity,
      const DeepCollectionEquality().hash(_jobs),
      department,
      totalEpisodeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrewImplCopyWith<_$CrewImpl> get copyWith =>
      __$$CrewImplCopyWithImpl<_$CrewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrewImplToJson(
      this,
    );
  }
}

abstract class _Crew implements Crew {
  const factory _Crew(
      {required final bool adult,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'profile_path') final String? profilePath,
      required final int gender,
      @JsonKey(name: 'known_for_department')
      required final String knownForDepartment,
      @JsonKey(name: 'original_name') required final String originalName,
      @JsonKey(name: 'popularity') required final double popularity,
      @JsonKey(name: 'jobs') required final List<Job> jobs,
      @JsonKey(name: 'department') required final String department,
      @JsonKey(name: 'total_episode_count')
      required final int totalEpisodeCount}) = _$CrewImpl;

  factory _Crew.fromJson(Map<String, dynamic> json) = _$CrewImpl.fromJson;

  @override
  bool get adult;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  int get gender;
  @override
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  @JsonKey(name: 'popularity')
  double get popularity;
  @override
  @JsonKey(name: 'jobs')
  List<Job> get jobs;
  @override // Include jobs
  @JsonKey(name: 'department')
  String get department;
  @override
  @JsonKey(name: 'total_episode_count')
  int get totalEpisodeCount;
  @override
  @JsonKey(ignore: true)
  _$$CrewImplCopyWith<_$CrewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cast _$CastFromJson(Map<String, dynamic> json) {
  return _Cast.fromJson(json);
}

/// @nodoc
mixin _$Cast {
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  double? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_episode_count')
  int get totalEpisodeCount => throw _privateConstructorUsedError;
  List<Roles>? get roles => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CastCopyWith<Cast> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CastCopyWith<$Res> {
  factory $CastCopyWith(Cast value, $Res Function(Cast) then) =
      _$CastCopyWithImpl<$Res, Cast>;
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'profile_path') String? profilePath,
      int gender,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'popularity') double? popularity,
      @JsonKey(name: 'total_episode_count') int totalEpisodeCount,
      List<Roles>? roles,
      int order});
}

/// @nodoc
class _$CastCopyWithImpl<$Res, $Val extends Cast>
    implements $CastCopyWith<$Res> {
  _$CastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? id = null,
    Object? name = null,
    Object? profilePath = freezed,
    Object? gender = null,
    Object? knownForDepartment = null,
    Object? originalName = null,
    Object? popularity = freezed,
    Object? totalEpisodeCount = null,
    Object? roles = freezed,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      totalEpisodeCount: null == totalEpisodeCount
          ? _value.totalEpisodeCount
          : totalEpisodeCount // ignore: cast_nullable_to_non_nullable
              as int,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Roles>?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CastImplCopyWith<$Res> implements $CastCopyWith<$Res> {
  factory _$$CastImplCopyWith(
          _$CastImpl value, $Res Function(_$CastImpl) then) =
      __$$CastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'profile_path') String? profilePath,
      int gender,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'popularity') double? popularity,
      @JsonKey(name: 'total_episode_count') int totalEpisodeCount,
      List<Roles>? roles,
      int order});
}

/// @nodoc
class __$$CastImplCopyWithImpl<$Res>
    extends _$CastCopyWithImpl<$Res, _$CastImpl>
    implements _$$CastImplCopyWith<$Res> {
  __$$CastImplCopyWithImpl(_$CastImpl _value, $Res Function(_$CastImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? id = null,
    Object? name = null,
    Object? profilePath = freezed,
    Object? gender = null,
    Object? knownForDepartment = null,
    Object? originalName = null,
    Object? popularity = freezed,
    Object? totalEpisodeCount = null,
    Object? roles = freezed,
    Object? order = null,
  }) {
    return _then(_$CastImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      totalEpisodeCount: null == totalEpisodeCount
          ? _value.totalEpisodeCount
          : totalEpisodeCount // ignore: cast_nullable_to_non_nullable
              as int,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Roles>?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CastImpl implements _Cast {
  const _$CastImpl(
      {required this.adult,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'profile_path') this.profilePath,
      required this.gender,
      @JsonKey(name: 'known_for_department') required this.knownForDepartment,
      @JsonKey(name: 'original_name') required this.originalName,
      @JsonKey(name: 'popularity') this.popularity,
      @JsonKey(name: 'total_episode_count') required this.totalEpisodeCount,
      required final List<Roles>? roles,
      required this.order})
      : _roles = roles;

  factory _$CastImpl.fromJson(Map<String, dynamic> json) =>
      _$$CastImplFromJson(json);

  @override
  final bool adult;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  final int gender;
  @override
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  @JsonKey(name: 'popularity')
  final double? popularity;
  @override
  @JsonKey(name: 'total_episode_count')
  final int totalEpisodeCount;
  final List<Roles>? _roles;
  @override
  List<Roles>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int order;

  @override
  String toString() {
    return 'Cast(adult: $adult, id: $id, name: $name, profilePath: $profilePath, gender: $gender, knownForDepartment: $knownForDepartment, originalName: $originalName, popularity: $popularity, totalEpisodeCount: $totalEpisodeCount, roles: $roles, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.knownForDepartment, knownForDepartment) ||
                other.knownForDepartment == knownForDepartment) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.totalEpisodeCount, totalEpisodeCount) ||
                other.totalEpisodeCount == totalEpisodeCount) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      id,
      name,
      profilePath,
      gender,
      knownForDepartment,
      originalName,
      popularity,
      totalEpisodeCount,
      const DeepCollectionEquality().hash(_roles),
      order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CastImplCopyWith<_$CastImpl> get copyWith =>
      __$$CastImplCopyWithImpl<_$CastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CastImplToJson(
      this,
    );
  }
}

abstract class _Cast implements Cast {
  const factory _Cast(
      {required final bool adult,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'profile_path') final String? profilePath,
      required final int gender,
      @JsonKey(name: 'known_for_department')
      required final String knownForDepartment,
      @JsonKey(name: 'original_name') required final String originalName,
      @JsonKey(name: 'popularity') final double? popularity,
      @JsonKey(name: 'total_episode_count')
      required final int totalEpisodeCount,
      required final List<Roles>? roles,
      required final int order}) = _$CastImpl;

  factory _Cast.fromJson(Map<String, dynamic> json) = _$CastImpl.fromJson;

  @override
  bool get adult;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  int get gender;
  @override
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  @JsonKey(name: 'popularity')
  double? get popularity;
  @override
  @JsonKey(name: 'total_episode_count')
  int get totalEpisodeCount;
  @override
  List<Roles>? get roles;
  @override
  int get order;
  @override
  @JsonKey(ignore: true)
  _$$CastImplCopyWith<_$CastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Job _$JobFromJson(Map<String, dynamic> json) {
  return _Job.fromJson(json);
}

/// @nodoc
mixin _$Job {
  @JsonKey(name: 'credit_id')
  String get creditId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job')
  String get job => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_count')
  int get episodeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobCopyWith<Job> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCopyWith<$Res> {
  factory $JobCopyWith(Job value, $Res Function(Job) then) =
      _$JobCopyWithImpl<$Res, Job>;
  @useResult
  $Res call(
      {@JsonKey(name: 'credit_id') String creditId,
      @JsonKey(name: 'job') String job,
      @JsonKey(name: 'episode_count') int episodeCount});
}

/// @nodoc
class _$JobCopyWithImpl<$Res, $Val extends Job> implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditId = null,
    Object? job = null,
    Object? episodeCount = null,
  }) {
    return _then(_value.copyWith(
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      episodeCount: null == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobImplCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$$JobImplCopyWith(_$JobImpl value, $Res Function(_$JobImpl) then) =
      __$$JobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'credit_id') String creditId,
      @JsonKey(name: 'job') String job,
      @JsonKey(name: 'episode_count') int episodeCount});
}

/// @nodoc
class __$$JobImplCopyWithImpl<$Res> extends _$JobCopyWithImpl<$Res, _$JobImpl>
    implements _$$JobImplCopyWith<$Res> {
  __$$JobImplCopyWithImpl(_$JobImpl _value, $Res Function(_$JobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditId = null,
    Object? job = null,
    Object? episodeCount = null,
  }) {
    return _then(_$JobImpl(
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      episodeCount: null == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobImpl implements _Job {
  const _$JobImpl(
      {@JsonKey(name: 'credit_id') required this.creditId,
      @JsonKey(name: 'job') required this.job,
      @JsonKey(name: 'episode_count') required this.episodeCount});

  factory _$JobImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobImplFromJson(json);

  @override
  @JsonKey(name: 'credit_id')
  final String creditId;
  @override
  @JsonKey(name: 'job')
  final String job;
  @override
  @JsonKey(name: 'episode_count')
  final int episodeCount;

  @override
  String toString() {
    return 'Job(creditId: $creditId, job: $job, episodeCount: $episodeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobImpl &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.episodeCount, episodeCount) ||
                other.episodeCount == episodeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, creditId, job, episodeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      __$$JobImplCopyWithImpl<_$JobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobImplToJson(
      this,
    );
  }
}

abstract class _Job implements Job {
  const factory _Job(
          {@JsonKey(name: 'credit_id') required final String creditId,
          @JsonKey(name: 'job') required final String job,
          @JsonKey(name: 'episode_count') required final int episodeCount}) =
      _$JobImpl;

  factory _Job.fromJson(Map<String, dynamic> json) = _$JobImpl.fromJson;

  @override
  @JsonKey(name: 'credit_id')
  String get creditId;
  @override
  @JsonKey(name: 'job')
  String get job;
  @override
  @JsonKey(name: 'episode_count')
  int get episodeCount;
  @override
  @JsonKey(ignore: true)
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Roles _$RolesFromJson(Map<String, dynamic> json) {
  return _Roles.fromJson(json);
}

/// @nodoc
mixin _$Roles {
  @JsonKey(name: 'credit_id')
  String get creditId => throw _privateConstructorUsedError;
  String get character => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_count')
  int get episodeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RolesCopyWith<Roles> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesCopyWith<$Res> {
  factory $RolesCopyWith(Roles value, $Res Function(Roles) then) =
      _$RolesCopyWithImpl<$Res, Roles>;
  @useResult
  $Res call(
      {@JsonKey(name: 'credit_id') String creditId,
      String character,
      @JsonKey(name: 'episode_count') int episodeCount});
}

/// @nodoc
class _$RolesCopyWithImpl<$Res, $Val extends Roles>
    implements $RolesCopyWith<$Res> {
  _$RolesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditId = null,
    Object? character = null,
    Object? episodeCount = null,
  }) {
    return _then(_value.copyWith(
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      episodeCount: null == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RolesImplCopyWith<$Res> implements $RolesCopyWith<$Res> {
  factory _$$RolesImplCopyWith(
          _$RolesImpl value, $Res Function(_$RolesImpl) then) =
      __$$RolesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'credit_id') String creditId,
      String character,
      @JsonKey(name: 'episode_count') int episodeCount});
}

/// @nodoc
class __$$RolesImplCopyWithImpl<$Res>
    extends _$RolesCopyWithImpl<$Res, _$RolesImpl>
    implements _$$RolesImplCopyWith<$Res> {
  __$$RolesImplCopyWithImpl(
      _$RolesImpl _value, $Res Function(_$RolesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditId = null,
    Object? character = null,
    Object? episodeCount = null,
  }) {
    return _then(_$RolesImpl(
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      episodeCount: null == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RolesImpl implements _Roles {
  const _$RolesImpl(
      {@JsonKey(name: 'credit_id') required this.creditId,
      required this.character,
      @JsonKey(name: 'episode_count') required this.episodeCount});

  factory _$RolesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RolesImplFromJson(json);

  @override
  @JsonKey(name: 'credit_id')
  final String creditId;
  @override
  final String character;
  @override
  @JsonKey(name: 'episode_count')
  final int episodeCount;

  @override
  String toString() {
    return 'Roles(creditId: $creditId, character: $character, episodeCount: $episodeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RolesImpl &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.episodeCount, episodeCount) ||
                other.episodeCount == episodeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, creditId, character, episodeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RolesImplCopyWith<_$RolesImpl> get copyWith =>
      __$$RolesImplCopyWithImpl<_$RolesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RolesImplToJson(
      this,
    );
  }
}

abstract class _Roles implements Roles {
  const factory _Roles(
          {@JsonKey(name: 'credit_id') required final String creditId,
          required final String character,
          @JsonKey(name: 'episode_count') required final int episodeCount}) =
      _$RolesImpl;

  factory _Roles.fromJson(Map<String, dynamic> json) = _$RolesImpl.fromJson;

  @override
  @JsonKey(name: 'credit_id')
  String get creditId;
  @override
  String get character;
  @override
  @JsonKey(name: 'episode_count')
  int get episodeCount;
  @override
  @JsonKey(ignore: true)
  _$$RolesImplCopyWith<_$RolesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Season _$SeasonFromJson(Map<String, dynamic> json) {
  return _Season.fromJson(json);
}

/// @nodoc
mixin _$Season {
  @JsonKey(name: 'air_date')
  String? get airDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_count')
  int get episodeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_number')
  int get seasonNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeasonCopyWith<Season> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonCopyWith<$Res> {
  factory $SeasonCopyWith(Season value, $Res Function(Season) then) =
      _$SeasonCopyWithImpl<$Res, Season>;
  @useResult
  $Res call(
      {@JsonKey(name: 'air_date') String? airDate,
      @JsonKey(name: 'episode_count') int episodeCount,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'overview') String? overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class _$SeasonCopyWithImpl<$Res, $Val extends Season>
    implements $SeasonCopyWith<$Res> {
  _$SeasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeCount = null,
    Object? id = null,
    Object? name = null,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? seasonNumber = null,
    Object? voteAverage = freezed,
  }) {
    return _then(_value.copyWith(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeCount: null == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeasonImplCopyWith<$Res> implements $SeasonCopyWith<$Res> {
  factory _$$SeasonImplCopyWith(
          _$SeasonImpl value, $Res Function(_$SeasonImpl) then) =
      __$$SeasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'air_date') String? airDate,
      @JsonKey(name: 'episode_count') int episodeCount,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'overview') String? overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class __$$SeasonImplCopyWithImpl<$Res>
    extends _$SeasonCopyWithImpl<$Res, _$SeasonImpl>
    implements _$$SeasonImplCopyWith<$Res> {
  __$$SeasonImplCopyWithImpl(
      _$SeasonImpl _value, $Res Function(_$SeasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeCount = null,
    Object? id = null,
    Object? name = null,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? seasonNumber = null,
    Object? voteAverage = freezed,
  }) {
    return _then(_$SeasonImpl(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeCount: null == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeasonImpl implements _Season {
  const _$SeasonImpl(
      {@JsonKey(name: 'air_date') this.airDate,
      @JsonKey(name: 'episode_count') required this.episodeCount,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'overview') this.overview,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'season_number') required this.seasonNumber,
      @JsonKey(name: 'vote_average') this.voteAverage});

  factory _$SeasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonImplFromJson(json);

  @override
  @JsonKey(name: 'air_date')
  final String? airDate;
  @override
  @JsonKey(name: 'episode_count')
  final int episodeCount;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'overview')
  final String? overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @override
  String toString() {
    return 'Season(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonImpl &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.episodeCount, episodeCount) ||
                other.episodeCount == episodeCount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, airDate, episodeCount, id, name,
      overview, posterPath, seasonNumber, voteAverage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonImplCopyWith<_$SeasonImpl> get copyWith =>
      __$$SeasonImplCopyWithImpl<_$SeasonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonImplToJson(
      this,
    );
  }
}

abstract class _Season implements Season {
  const factory _Season(
      {@JsonKey(name: 'air_date') final String? airDate,
      @JsonKey(name: 'episode_count') required final int episodeCount,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'overview') final String? overview,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'season_number') required final int seasonNumber,
      @JsonKey(name: 'vote_average') final double? voteAverage}) = _$SeasonImpl;

  factory _Season.fromJson(Map<String, dynamic> json) = _$SeasonImpl.fromJson;

  @override
  @JsonKey(name: 'air_date')
  String? get airDate;
  @override
  @JsonKey(name: 'episode_count')
  int get episodeCount;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'overview')
  String? get overview;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'season_number')
  int get seasonNumber;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(ignore: true)
  _$$SeasonImplCopyWith<_$SeasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
