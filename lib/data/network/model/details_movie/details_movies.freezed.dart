// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_movies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailsMovies _$DetailsMoviesFromJson(Map<String, dynamic> json) {
  return _DetailsMovies.fromJson(json);
}

/// @nodoc
mixin _$DetailsMovies {
  @JsonKey(name: 'adult')
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection? get belongsToCollection =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'budget')
  int get budget => throw _privateConstructorUsedError;
  @JsonKey(name: 'genres')
  List<Genre> get genres => throw _privateConstructorUsedError;
  @JsonKey(name: 'homepage')
  String? get homepage => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdb_id')
  String? get imdbId => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String get originalTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> get productionCompanies =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> get productionCountries =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'revenue')
  int get revenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'runtime')
  int? get runtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> get spokenLanguages =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'tagline')
  String? get tagline => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'video')
  bool get video => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'credits')
  Credits? get credits => throw _privateConstructorUsedError;
  @JsonKey(name: 'videos')
  Videos? get videos => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_states')
  AccountStates? get accountStates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailsMoviesCopyWith<DetailsMovies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsMoviesCopyWith<$Res> {
  factory $DetailsMoviesCopyWith(
          DetailsMovies value, $Res Function(DetailsMovies) then) =
      _$DetailsMoviesCopyWithImpl<$Res, DetailsMovies>;
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'belongs_to_collection')
      BelongsToCollection? belongsToCollection,
      @JsonKey(name: 'budget') int budget,
      @JsonKey(name: 'genres') List<Genre> genres,
      @JsonKey(name: 'homepage') String? homepage,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'imdb_id') String? imdbId,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'production_companies')
      List<ProductionCompany> productionCompanies,
      @JsonKey(name: 'production_countries')
      List<ProductionCountry> productionCountries,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'revenue') int revenue,
      @JsonKey(name: 'runtime') int? runtime,
      @JsonKey(name: 'spoken_languages') List<SpokenLanguage> spokenLanguages,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'tagline') String? tagline,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'video') bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount,
      @JsonKey(name: 'credits') Credits? credits,
      @JsonKey(name: 'videos') Videos? videos,
      @JsonKey(name: 'account_states') AccountStates? accountStates});

  $BelongsToCollectionCopyWith<$Res>? get belongsToCollection;
  $CreditsCopyWith<$Res>? get credits;
  $VideosCopyWith<$Res>? get videos;
  $AccountStatesCopyWith<$Res>? get accountStates;
}

/// @nodoc
class _$DetailsMoviesCopyWithImpl<$Res, $Val extends DetailsMovies>
    implements $DetailsMoviesCopyWith<$Res> {
  _$DetailsMoviesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? belongsToCollection = freezed,
    Object? budget = null,
    Object? genres = null,
    Object? homepage = freezed,
    Object? id = null,
    Object? imdbId = freezed,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? productionCompanies = null,
    Object? productionCountries = null,
    Object? releaseDate = null,
    Object? revenue = null,
    Object? runtime = freezed,
    Object? spokenLanguages = null,
    Object? status = null,
    Object? tagline = freezed,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? credits = freezed,
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
      belongsToCollection: freezed == belongsToCollection
          ? _value.belongsToCollection
          : belongsToCollection // ignore: cast_nullable_to_non_nullable
              as BelongsToCollection?,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imdbId: freezed == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: null == productionCompanies
          ? _value.productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>,
      productionCountries: null == productionCountries
          ? _value.productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionCountry>,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      spokenLanguages: null == spokenLanguages
          ? _value.spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<SpokenLanguage>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits?,
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
  $BelongsToCollectionCopyWith<$Res>? get belongsToCollection {
    if (_value.belongsToCollection == null) {
      return null;
    }

    return $BelongsToCollectionCopyWith<$Res>(_value.belongsToCollection!,
        (value) {
      return _then(_value.copyWith(belongsToCollection: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditsCopyWith<$Res>? get credits {
    if (_value.credits == null) {
      return null;
    }

    return $CreditsCopyWith<$Res>(_value.credits!, (value) {
      return _then(_value.copyWith(credits: value) as $Val);
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
abstract class _$$DetailsMoviesImplCopyWith<$Res>
    implements $DetailsMoviesCopyWith<$Res> {
  factory _$$DetailsMoviesImplCopyWith(
          _$DetailsMoviesImpl value, $Res Function(_$DetailsMoviesImpl) then) =
      __$$DetailsMoviesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'belongs_to_collection')
      BelongsToCollection? belongsToCollection,
      @JsonKey(name: 'budget') int budget,
      @JsonKey(name: 'genres') List<Genre> genres,
      @JsonKey(name: 'homepage') String? homepage,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'imdb_id') String? imdbId,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'production_companies')
      List<ProductionCompany> productionCompanies,
      @JsonKey(name: 'production_countries')
      List<ProductionCountry> productionCountries,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'revenue') int revenue,
      @JsonKey(name: 'runtime') int? runtime,
      @JsonKey(name: 'spoken_languages') List<SpokenLanguage> spokenLanguages,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'tagline') String? tagline,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'video') bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount,
      @JsonKey(name: 'credits') Credits? credits,
      @JsonKey(name: 'videos') Videos? videos,
      @JsonKey(name: 'account_states') AccountStates? accountStates});

  @override
  $BelongsToCollectionCopyWith<$Res>? get belongsToCollection;
  @override
  $CreditsCopyWith<$Res>? get credits;
  @override
  $VideosCopyWith<$Res>? get videos;
  @override
  $AccountStatesCopyWith<$Res>? get accountStates;
}

/// @nodoc
class __$$DetailsMoviesImplCopyWithImpl<$Res>
    extends _$DetailsMoviesCopyWithImpl<$Res, _$DetailsMoviesImpl>
    implements _$$DetailsMoviesImplCopyWith<$Res> {
  __$$DetailsMoviesImplCopyWithImpl(
      _$DetailsMoviesImpl _value, $Res Function(_$DetailsMoviesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? belongsToCollection = freezed,
    Object? budget = null,
    Object? genres = null,
    Object? homepage = freezed,
    Object? id = null,
    Object? imdbId = freezed,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? productionCompanies = null,
    Object? productionCountries = null,
    Object? releaseDate = null,
    Object? revenue = null,
    Object? runtime = freezed,
    Object? spokenLanguages = null,
    Object? status = null,
    Object? tagline = freezed,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? credits = freezed,
    Object? videos = freezed,
    Object? accountStates = freezed,
  }) {
    return _then(_$DetailsMoviesImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      belongsToCollection: freezed == belongsToCollection
          ? _value.belongsToCollection
          : belongsToCollection // ignore: cast_nullable_to_non_nullable
              as BelongsToCollection?,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imdbId: freezed == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: null == productionCompanies
          ? _value._productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>,
      productionCountries: null == productionCountries
          ? _value._productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionCountry>,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      spokenLanguages: null == spokenLanguages
          ? _value._spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<SpokenLanguage>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits?,
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
class _$DetailsMoviesImpl implements _DetailsMovies {
  const _$DetailsMoviesImpl(
      {@JsonKey(name: 'adult') required this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'belongs_to_collection') this.belongsToCollection,
      @JsonKey(name: 'budget') required this.budget,
      @JsonKey(name: 'genres') required final List<Genre> genres,
      @JsonKey(name: 'homepage') this.homepage,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'imdb_id') this.imdbId,
      @JsonKey(name: 'original_language') required this.originalLanguage,
      @JsonKey(name: 'original_title') required this.originalTitle,
      @JsonKey(name: 'overview') required this.overview,
      @JsonKey(name: 'popularity') required this.popularity,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'production_companies')
      required final List<ProductionCompany> productionCompanies,
      @JsonKey(name: 'production_countries')
      required final List<ProductionCountry> productionCountries,
      @JsonKey(name: 'release_date') required this.releaseDate,
      @JsonKey(name: 'revenue') required this.revenue,
      @JsonKey(name: 'runtime') this.runtime,
      @JsonKey(name: 'spoken_languages')
      required final List<SpokenLanguage> spokenLanguages,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'tagline') this.tagline,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'video') required this.video,
      @JsonKey(name: 'vote_average') required this.voteAverage,
      @JsonKey(name: 'vote_count') required this.voteCount,
      @JsonKey(name: 'credits') this.credits,
      @JsonKey(name: 'videos') this.videos,
      @JsonKey(name: 'account_states') this.accountStates})
      : _genres = genres,
        _productionCompanies = productionCompanies,
        _productionCountries = productionCountries,
        _spokenLanguages = spokenLanguages;

  factory _$DetailsMoviesImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailsMoviesImplFromJson(json);

  @override
  @JsonKey(name: 'adult')
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'belongs_to_collection')
  final BelongsToCollection? belongsToCollection;
  @override
  @JsonKey(name: 'budget')
  final int budget;
  final List<Genre> _genres;
  @override
  @JsonKey(name: 'genres')
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  @JsonKey(name: 'homepage')
  final String? homepage;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  @JsonKey(name: 'overview')
  final String overview;
  @override
  @JsonKey(name: 'popularity')
  final double popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final List<ProductionCompany> _productionCompanies;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> get productionCompanies {
    if (_productionCompanies is EqualUnmodifiableListView)
      return _productionCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productionCompanies);
  }

  final List<ProductionCountry> _productionCountries;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> get productionCountries {
    if (_productionCountries is EqualUnmodifiableListView)
      return _productionCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productionCountries);
  }

  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  @JsonKey(name: 'revenue')
  final int revenue;
  @override
  @JsonKey(name: 'runtime')
  final int? runtime;
  final List<SpokenLanguage> _spokenLanguages;
  @override
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> get spokenLanguages {
    if (_spokenLanguages is EqualUnmodifiableListView) return _spokenLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spokenLanguages);
  }

  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'tagline')
  final String? tagline;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'video')
  final bool video;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @override
  @JsonKey(name: 'credits')
  final Credits? credits;
  @override
  @JsonKey(name: 'videos')
  final Videos? videos;
  @override
  @JsonKey(name: 'account_states')
  final AccountStates? accountStates;

  @override
  String toString() {
    return 'DetailsMovies(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, credits: $credits, videos: $videos, accountStates: $accountStates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsMoviesImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.belongsToCollection, belongsToCollection) ||
                other.belongsToCollection == belongsToCollection) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imdbId, imdbId) || other.imdbId == imdbId) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
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
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            const DeepCollectionEquality()
                .equals(other._spokenLanguages, _spokenLanguages) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.credits, credits) || other.credits == credits) &&
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
        belongsToCollection,
        budget,
        const DeepCollectionEquality().hash(_genres),
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        const DeepCollectionEquality().hash(_productionCompanies),
        const DeepCollectionEquality().hash(_productionCountries),
        releaseDate,
        revenue,
        runtime,
        const DeepCollectionEquality().hash(_spokenLanguages),
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
        credits,
        videos,
        accountStates
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsMoviesImplCopyWith<_$DetailsMoviesImpl> get copyWith =>
      __$$DetailsMoviesImplCopyWithImpl<_$DetailsMoviesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailsMoviesImplToJson(
      this,
    );
  }
}

abstract class _DetailsMovies implements DetailsMovies {
  const factory _DetailsMovies(
      {@JsonKey(name: 'adult') required final bool adult,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'belongs_to_collection')
      final BelongsToCollection? belongsToCollection,
      @JsonKey(name: 'budget') required final int budget,
      @JsonKey(name: 'genres') required final List<Genre> genres,
      @JsonKey(name: 'homepage') final String? homepage,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'imdb_id') final String? imdbId,
      @JsonKey(name: 'original_language')
      required final String originalLanguage,
      @JsonKey(name: 'original_title') required final String originalTitle,
      @JsonKey(name: 'overview') required final String overview,
      @JsonKey(name: 'popularity') required final double popularity,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'production_companies')
      required final List<ProductionCompany> productionCompanies,
      @JsonKey(name: 'production_countries')
      required final List<ProductionCountry> productionCountries,
      @JsonKey(name: 'release_date') required final String releaseDate,
      @JsonKey(name: 'revenue') required final int revenue,
      @JsonKey(name: 'runtime') final int? runtime,
      @JsonKey(name: 'spoken_languages')
      required final List<SpokenLanguage> spokenLanguages,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'tagline') final String? tagline,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'video') required final bool video,
      @JsonKey(name: 'vote_average') required final double voteAverage,
      @JsonKey(name: 'vote_count') required final int voteCount,
      @JsonKey(name: 'credits') final Credits? credits,
      @JsonKey(name: 'videos') final Videos? videos,
      @JsonKey(name: 'account_states')
      final AccountStates? accountStates}) = _$DetailsMoviesImpl;

  factory _DetailsMovies.fromJson(Map<String, dynamic> json) =
      _$DetailsMoviesImpl.fromJson;

  @override
  @JsonKey(name: 'adult')
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection? get belongsToCollection;
  @override
  @JsonKey(name: 'budget')
  int get budget;
  @override
  @JsonKey(name: 'genres')
  List<Genre> get genres;
  @override
  @JsonKey(name: 'homepage')
  String? get homepage;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'imdb_id')
  String? get imdbId;
  @override
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  @JsonKey(name: 'overview')
  String get overview;
  @override
  @JsonKey(name: 'popularity')
  double get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> get productionCompanies;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> get productionCountries;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  @JsonKey(name: 'revenue')
  int get revenue;
  @override
  @JsonKey(name: 'runtime')
  int? get runtime;
  @override
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> get spokenLanguages;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'tagline')
  String? get tagline;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'video')
  bool get video;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int get voteCount;
  @override
  @JsonKey(name: 'credits')
  Credits? get credits;
  @override
  @JsonKey(name: 'videos')
  Videos? get videos;
  @override
  @JsonKey(name: 'account_states')
  AccountStates? get accountStates;
  @override
  @JsonKey(ignore: true)
  _$$DetailsMoviesImplCopyWith<_$DetailsMoviesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) {
  return _BelongsToCollection.fromJson(json);
}

/// @nodoc
mixin _$BelongsToCollection {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BelongsToCollectionCopyWith<BelongsToCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BelongsToCollectionCopyWith<$Res> {
  factory $BelongsToCollectionCopyWith(
          BelongsToCollection value, $Res Function(BelongsToCollection) then) =
      _$BelongsToCollectionCopyWithImpl<$Res, BelongsToCollection>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath});
}

/// @nodoc
class _$BelongsToCollectionCopyWithImpl<$Res, $Val extends BelongsToCollection>
    implements $BelongsToCollectionCopyWith<$Res> {
  _$BelongsToCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
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
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BelongsToCollectionImplCopyWith<$Res>
    implements $BelongsToCollectionCopyWith<$Res> {
  factory _$$BelongsToCollectionImplCopyWith(_$BelongsToCollectionImpl value,
          $Res Function(_$BelongsToCollectionImpl) then) =
      __$$BelongsToCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath});
}

/// @nodoc
class __$$BelongsToCollectionImplCopyWithImpl<$Res>
    extends _$BelongsToCollectionCopyWithImpl<$Res, _$BelongsToCollectionImpl>
    implements _$$BelongsToCollectionImplCopyWith<$Res> {
  __$$BelongsToCollectionImplCopyWithImpl(_$BelongsToCollectionImpl _value,
      $Res Function(_$BelongsToCollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
  }) {
    return _then(_$BelongsToCollectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BelongsToCollectionImpl implements _BelongsToCollection {
  const _$BelongsToCollectionImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'backdrop_path') this.backdropPath});

  factory _$BelongsToCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BelongsToCollectionImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @override
  String toString() {
    return 'BelongsToCollection(id: $id, name: $name, posterPath: $posterPath, backdropPath: $backdropPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BelongsToCollectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, posterPath, backdropPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BelongsToCollectionImplCopyWith<_$BelongsToCollectionImpl> get copyWith =>
      __$$BelongsToCollectionImplCopyWithImpl<_$BelongsToCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BelongsToCollectionImplToJson(
      this,
    );
  }
}

abstract class _BelongsToCollection implements BelongsToCollection {
  const factory _BelongsToCollection(
          {required final int id,
          required final String name,
          @JsonKey(name: 'poster_path') final String? posterPath,
          @JsonKey(name: 'backdrop_path') final String? backdropPath}) =
      _$BelongsToCollectionImpl;

  factory _BelongsToCollection.fromJson(Map<String, dynamic> json) =
      _$BelongsToCollectionImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(ignore: true)
  _$$BelongsToCollectionImplCopyWith<_$BelongsToCollectionImpl> get copyWith =>
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
  @JsonKey(name: 'name')
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
      @JsonKey(name: 'name') String name});
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
      @JsonKey(name: 'name') String name});
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
      @JsonKey(name: 'name') required this.name});

  factory _$SpokenLanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpokenLanguageImplFromJson(json);

  @override
  @JsonKey(name: 'english_name')
  final String englishName;
  @override
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @override
  @JsonKey(name: 'name')
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
          @JsonKey(name: 'name') required final String name}) =
      _$SpokenLanguageImpl;

  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) =
      _$SpokenLanguageImpl.fromJson;

  @override
  @JsonKey(name: 'english_name')
  String get englishName;
  @override
  @JsonKey(name: 'iso_639_1')
  String get iso6391;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SpokenLanguageImplCopyWith<_$SpokenLanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Credits _$CreditsFromJson(Map<String, dynamic> json) {
  return _Credits.fromJson(json);
}

/// @nodoc
mixin _$Credits {
  @JsonKey(name: 'cast')
  List<MovieCast> get cast => throw _privateConstructorUsedError;
  List<Crew> get crew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditsCopyWith<Credits> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditsCopyWith<$Res> {
  factory $CreditsCopyWith(Credits value, $Res Function(Credits) then) =
      _$CreditsCopyWithImpl<$Res, Credits>;
  @useResult
  $Res call({@JsonKey(name: 'cast') List<MovieCast> cast, List<Crew> crew});
}

/// @nodoc
class _$CreditsCopyWithImpl<$Res, $Val extends Credits>
    implements $CreditsCopyWith<$Res> {
  _$CreditsCopyWithImpl(this._value, this._then);

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
              as List<MovieCast>,
      crew: null == crew
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<Crew>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditsImplCopyWith<$Res> implements $CreditsCopyWith<$Res> {
  factory _$$CreditsImplCopyWith(
          _$CreditsImpl value, $Res Function(_$CreditsImpl) then) =
      __$$CreditsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'cast') List<MovieCast> cast, List<Crew> crew});
}

/// @nodoc
class __$$CreditsImplCopyWithImpl<$Res>
    extends _$CreditsCopyWithImpl<$Res, _$CreditsImpl>
    implements _$$CreditsImplCopyWith<$Res> {
  __$$CreditsImplCopyWithImpl(
      _$CreditsImpl _value, $Res Function(_$CreditsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cast = null,
    Object? crew = null,
  }) {
    return _then(_$CreditsImpl(
      cast: null == cast
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<MovieCast>,
      crew: null == crew
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<Crew>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditsImpl implements _Credits {
  const _$CreditsImpl(
      {@JsonKey(name: 'cast') required final List<MovieCast> cast,
      required final List<Crew> crew})
      : _cast = cast,
        _crew = crew;

  factory _$CreditsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditsImplFromJson(json);

  final List<MovieCast> _cast;
  @override
  @JsonKey(name: 'cast')
  List<MovieCast> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cast);
  }

  final List<Crew> _crew;
  @override
  List<Crew> get crew {
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crew);
  }

  @override
  String toString() {
    return 'Credits(cast: $cast, crew: $crew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditsImpl &&
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
  _$$CreditsImplCopyWith<_$CreditsImpl> get copyWith =>
      __$$CreditsImplCopyWithImpl<_$CreditsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditsImplToJson(
      this,
    );
  }
}

abstract class _Credits implements Credits {
  const factory _Credits(
      {@JsonKey(name: 'cast') required final List<MovieCast> cast,
      required final List<Crew> crew}) = _$CreditsImpl;

  factory _Credits.fromJson(Map<String, dynamic> json) = _$CreditsImpl.fromJson;

  @override
  @JsonKey(name: 'cast')
  List<MovieCast> get cast;
  @override
  List<Crew> get crew;
  @override
  @JsonKey(ignore: true)
  _$$CreditsImplCopyWith<_$CreditsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MovieCast _$MovieCastFromJson(Map<String, dynamic> json) {
  return _MovieCast.fromJson(json);
}

/// @nodoc
mixin _$MovieCast {
  bool get adult => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'cast_id')
  int get castId => throw _privateConstructorUsedError;
  @JsonKey(name: 'character')
  String get character => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_id')
  String get creditId => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCastCopyWith<MovieCast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCastCopyWith<$Res> {
  factory $MovieCastCopyWith(MovieCast value, $Res Function(MovieCast) then) =
      _$MovieCastCopyWithImpl<$Res, MovieCast>;
  @useResult
  $Res call(
      {bool adult,
      int gender,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'original_name') String originalName,
      double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'cast_id') int castId,
      @JsonKey(name: 'character') String character,
      @JsonKey(name: 'credit_id') String creditId,
      int order});
}

/// @nodoc
class _$MovieCastCopyWithImpl<$Res, $Val extends MovieCast>
    implements $MovieCastCopyWith<$Res> {
  _$MovieCastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? gender = null,
    Object? id = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? castId = null,
    Object? character = null,
    Object? creditId = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      castId: null == castId
          ? _value.castId
          : castId // ignore: cast_nullable_to_non_nullable
              as int,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieCastImplCopyWith<$Res>
    implements $MovieCastCopyWith<$Res> {
  factory _$$MovieCastImplCopyWith(
          _$MovieCastImpl value, $Res Function(_$MovieCastImpl) then) =
      __$$MovieCastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      int gender,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'original_name') String originalName,
      double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'cast_id') int castId,
      @JsonKey(name: 'character') String character,
      @JsonKey(name: 'credit_id') String creditId,
      int order});
}

/// @nodoc
class __$$MovieCastImplCopyWithImpl<$Res>
    extends _$MovieCastCopyWithImpl<$Res, _$MovieCastImpl>
    implements _$$MovieCastImplCopyWith<$Res> {
  __$$MovieCastImplCopyWithImpl(
      _$MovieCastImpl _value, $Res Function(_$MovieCastImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? gender = null,
    Object? id = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? castId = null,
    Object? character = null,
    Object? creditId = null,
    Object? order = null,
  }) {
    return _then(_$MovieCastImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      castId: null == castId
          ? _value.castId
          : castId // ignore: cast_nullable_to_non_nullable
              as int,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieCastImpl implements _MovieCast {
  const _$MovieCastImpl(
      {required this.adult,
      required this.gender,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'known_for_department') required this.knownForDepartment,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'original_name') required this.originalName,
      required this.popularity,
      @JsonKey(name: 'profile_path') this.profilePath,
      @JsonKey(name: 'cast_id') required this.castId,
      @JsonKey(name: 'character') required this.character,
      @JsonKey(name: 'credit_id') required this.creditId,
      required this.order});

  factory _$MovieCastImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieCastImplFromJson(json);

  @override
  final bool adult;
  @override
  final int gender;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  @JsonKey(name: 'cast_id')
  final int castId;
  @override
  @JsonKey(name: 'character')
  final String character;
  @override
  @JsonKey(name: 'credit_id')
  final String creditId;
  @override
  final int order;

  @override
  String toString() {
    return 'MovieCast(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieCastImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.knownForDepartment, knownForDepartment) ||
                other.knownForDepartment == knownForDepartment) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.castId, castId) || other.castId == castId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      castId,
      character,
      creditId,
      order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieCastImplCopyWith<_$MovieCastImpl> get copyWith =>
      __$$MovieCastImplCopyWithImpl<_$MovieCastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieCastImplToJson(
      this,
    );
  }
}

abstract class _MovieCast implements MovieCast {
  const factory _MovieCast(
      {required final bool adult,
      required final int gender,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'known_for_department')
      required final String knownForDepartment,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'original_name') required final String originalName,
      required final double popularity,
      @JsonKey(name: 'profile_path') final String? profilePath,
      @JsonKey(name: 'cast_id') required final int castId,
      @JsonKey(name: 'character') required final String character,
      @JsonKey(name: 'credit_id') required final String creditId,
      required final int order}) = _$MovieCastImpl;

  factory _MovieCast.fromJson(Map<String, dynamic> json) =
      _$MovieCastImpl.fromJson;

  @override
  bool get adult;
  @override
  int get gender;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(name: 'cast_id')
  int get castId;
  @override
  @JsonKey(name: 'character')
  String get character;
  @override
  @JsonKey(name: 'credit_id')
  String get creditId;
  @override
  int get order;
  @override
  @JsonKey(ignore: true)
  _$$MovieCastImplCopyWith<_$MovieCastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return _Crew.fromJson(json);
}

/// @nodoc
mixin _$Crew {
  bool get adult => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_id')
  String get creditId => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;

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
      int gender,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      String name,
      @JsonKey(name: 'original_name') String originalName,
      double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'credit_id') String creditId,
      String department,
      String job});
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
    Object? gender = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? creditId = null,
    Object? department = null,
    Object? job = null,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
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
      int gender,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      String name,
      @JsonKey(name: 'original_name') String originalName,
      double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'credit_id') String creditId,
      String department,
      String job});
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
    Object? gender = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? creditId = null,
    Object? department = null,
    Object? job = null,
  }) {
    return _then(_$CrewImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrewImpl implements _Crew {
  const _$CrewImpl(
      {required this.adult,
      required this.gender,
      @JsonKey(name: 'known_for_department') required this.knownForDepartment,
      required this.name,
      @JsonKey(name: 'original_name') required this.originalName,
      required this.popularity,
      @JsonKey(name: 'profile_path') required this.profilePath,
      @JsonKey(name: 'credit_id') required this.creditId,
      required this.department,
      required this.job});

  factory _$CrewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrewImplFromJson(json);

  @override
  final bool adult;
  @override
  final int gender;
  @override
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @override
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  @JsonKey(name: 'credit_id')
  final String creditId;
  @override
  final String department;
  @override
  final String job;

  @override
  String toString() {
    return 'Crew(adult: $adult, gender: $gender, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, creditId: $creditId, department: $department, job: $job)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrewImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.knownForDepartment, knownForDepartment) ||
                other.knownForDepartment == knownForDepartment) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      gender,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      creditId,
      department,
      job);

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
      required final int gender,
      @JsonKey(name: 'known_for_department')
      required final String knownForDepartment,
      required final String name,
      @JsonKey(name: 'original_name') required final String originalName,
      required final double popularity,
      @JsonKey(name: 'profile_path') required final String? profilePath,
      @JsonKey(name: 'credit_id') required final String creditId,
      required final String department,
      required final String job}) = _$CrewImpl;

  factory _Crew.fromJson(Map<String, dynamic> json) = _$CrewImpl.fromJson;

  @override
  bool get adult;
  @override
  int get gender;
  @override
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment;
  @override
  String get name;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(name: 'credit_id')
  String get creditId;
  @override
  String get department;
  @override
  String get job;
  @override
  @JsonKey(ignore: true)
  _$$CrewImplCopyWith<_$CrewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
