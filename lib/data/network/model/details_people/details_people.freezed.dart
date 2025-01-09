// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_people.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailsPeople _$DetailsPeopleFromJson(Map<String, dynamic> json) {
  return _DetailsPeople.fromJson(json);
}

/// @nodoc
mixin _$DetailsPeople {
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'also_known_as', defaultValue: [])
  List<String> get alsoKnownAs => throw _privateConstructorUsedError;
  String? get biography => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get deathday => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdb_id')
  String? get imdbId => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth => throw _privateConstructorUsedError;
  double? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'combined_credits')
  CombinedCredits? get combinedCredits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailsPeopleCopyWith<DetailsPeople> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsPeopleCopyWith<$Res> {
  factory $DetailsPeopleCopyWith(
          DetailsPeople value, $Res Function(DetailsPeople) then) =
      _$DetailsPeopleCopyWithImpl<$Res, DetailsPeople>;
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'also_known_as', defaultValue: [])
      List<String> alsoKnownAs,
      String? biography,
      String? birthday,
      String? deathday,
      int gender,
      String? homepage,
      int id,
      @JsonKey(name: 'imdb_id') String? imdbId,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      String name,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      double? popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'combined_credits') CombinedCredits? combinedCredits});

  $CombinedCreditsCopyWith<$Res>? get combinedCredits;
}

/// @nodoc
class _$DetailsPeopleCopyWithImpl<$Res, $Val extends DetailsPeople>
    implements $DetailsPeopleCopyWith<$Res> {
  _$DetailsPeopleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? alsoKnownAs = null,
    Object? biography = freezed,
    Object? birthday = freezed,
    Object? deathday = freezed,
    Object? gender = null,
    Object? homepage = freezed,
    Object? id = null,
    Object? imdbId = freezed,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? placeOfBirth = freezed,
    Object? popularity = freezed,
    Object? profilePath = freezed,
    Object? combinedCredits = freezed,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      alsoKnownAs: null == alsoKnownAs
          ? _value.alsoKnownAs
          : alsoKnownAs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      deathday: freezed == deathday
          ? _value.deathday
          : deathday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
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
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      combinedCredits: freezed == combinedCredits
          ? _value.combinedCredits
          : combinedCredits // ignore: cast_nullable_to_non_nullable
              as CombinedCredits?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CombinedCreditsCopyWith<$Res>? get combinedCredits {
    if (_value.combinedCredits == null) {
      return null;
    }

    return $CombinedCreditsCopyWith<$Res>(_value.combinedCredits!, (value) {
      return _then(_value.copyWith(combinedCredits: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailsPeopleImplCopyWith<$Res>
    implements $DetailsPeopleCopyWith<$Res> {
  factory _$$DetailsPeopleImplCopyWith(
          _$DetailsPeopleImpl value, $Res Function(_$DetailsPeopleImpl) then) =
      __$$DetailsPeopleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'also_known_as', defaultValue: [])
      List<String> alsoKnownAs,
      String? biography,
      String? birthday,
      String? deathday,
      int gender,
      String? homepage,
      int id,
      @JsonKey(name: 'imdb_id') String? imdbId,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      String name,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      double? popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'combined_credits') CombinedCredits? combinedCredits});

  @override
  $CombinedCreditsCopyWith<$Res>? get combinedCredits;
}

/// @nodoc
class __$$DetailsPeopleImplCopyWithImpl<$Res>
    extends _$DetailsPeopleCopyWithImpl<$Res, _$DetailsPeopleImpl>
    implements _$$DetailsPeopleImplCopyWith<$Res> {
  __$$DetailsPeopleImplCopyWithImpl(
      _$DetailsPeopleImpl _value, $Res Function(_$DetailsPeopleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? alsoKnownAs = null,
    Object? biography = freezed,
    Object? birthday = freezed,
    Object? deathday = freezed,
    Object? gender = null,
    Object? homepage = freezed,
    Object? id = null,
    Object? imdbId = freezed,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? placeOfBirth = freezed,
    Object? popularity = freezed,
    Object? profilePath = freezed,
    Object? combinedCredits = freezed,
  }) {
    return _then(_$DetailsPeopleImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      alsoKnownAs: null == alsoKnownAs
          ? _value._alsoKnownAs
          : alsoKnownAs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      deathday: freezed == deathday
          ? _value.deathday
          : deathday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
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
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      combinedCredits: freezed == combinedCredits
          ? _value.combinedCredits
          : combinedCredits // ignore: cast_nullable_to_non_nullable
              as CombinedCredits?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailsPeopleImpl implements _DetailsPeople {
  const _$DetailsPeopleImpl(
      {required this.adult,
      @JsonKey(name: 'also_known_as', defaultValue: [])
      required final List<String> alsoKnownAs,
      required this.biography,
      required this.birthday,
      required this.deathday,
      required this.gender,
      required this.homepage,
      required this.id,
      @JsonKey(name: 'imdb_id') required this.imdbId,
      @JsonKey(name: 'known_for_department') required this.knownForDepartment,
      required this.name,
      @JsonKey(name: 'place_of_birth') required this.placeOfBirth,
      required this.popularity,
      @JsonKey(name: 'profile_path') required this.profilePath,
      @JsonKey(name: 'combined_credits') this.combinedCredits})
      : _alsoKnownAs = alsoKnownAs;

  factory _$DetailsPeopleImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailsPeopleImplFromJson(json);

  @override
  final bool adult;
  final List<String> _alsoKnownAs;
  @override
  @JsonKey(name: 'also_known_as', defaultValue: [])
  List<String> get alsoKnownAs {
    if (_alsoKnownAs is EqualUnmodifiableListView) return _alsoKnownAs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alsoKnownAs);
  }

  @override
  final String? biography;
  @override
  final String? birthday;
  @override
  final String? deathday;
  @override
  final int gender;
  @override
  final String? homepage;
  @override
  final int id;
  @override
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @override
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @override
  final String name;
  @override
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  @override
  final double? popularity;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  @JsonKey(name: 'combined_credits')
  final CombinedCredits? combinedCredits;

  @override
  String toString() {
    return 'DetailsPeople(adult: $adult, alsoKnownAs: $alsoKnownAs, biography: $biography, birthday: $birthday, deathday: $deathday, gender: $gender, homepage: $homepage, id: $id, imdbId: $imdbId, knownForDepartment: $knownForDepartment, name: $name, placeOfBirth: $placeOfBirth, popularity: $popularity, profilePath: $profilePath, combinedCredits: $combinedCredits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsPeopleImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality()
                .equals(other._alsoKnownAs, _alsoKnownAs) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.deathday, deathday) ||
                other.deathday == deathday) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imdbId, imdbId) || other.imdbId == imdbId) &&
            (identical(other.knownForDepartment, knownForDepartment) ||
                other.knownForDepartment == knownForDepartment) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.combinedCredits, combinedCredits) ||
                other.combinedCredits == combinedCredits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      const DeepCollectionEquality().hash(_alsoKnownAs),
      biography,
      birthday,
      deathday,
      gender,
      homepage,
      id,
      imdbId,
      knownForDepartment,
      name,
      placeOfBirth,
      popularity,
      profilePath,
      combinedCredits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsPeopleImplCopyWith<_$DetailsPeopleImpl> get copyWith =>
      __$$DetailsPeopleImplCopyWithImpl<_$DetailsPeopleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailsPeopleImplToJson(
      this,
    );
  }
}

abstract class _DetailsPeople implements DetailsPeople {
  const factory _DetailsPeople(
      {required final bool adult,
      @JsonKey(name: 'also_known_as', defaultValue: [])
      required final List<String> alsoKnownAs,
      required final String? biography,
      required final String? birthday,
      required final String? deathday,
      required final int gender,
      required final String? homepage,
      required final int id,
      @JsonKey(name: 'imdb_id') required final String? imdbId,
      @JsonKey(name: 'known_for_department')
      required final String knownForDepartment,
      required final String name,
      @JsonKey(name: 'place_of_birth') required final String? placeOfBirth,
      required final double? popularity,
      @JsonKey(name: 'profile_path') required final String? profilePath,
      @JsonKey(name: 'combined_credits')
      final CombinedCredits? combinedCredits}) = _$DetailsPeopleImpl;

  factory _DetailsPeople.fromJson(Map<String, dynamic> json) =
      _$DetailsPeopleImpl.fromJson;

  @override
  bool get adult;
  @override
  @JsonKey(name: 'also_known_as', defaultValue: [])
  List<String> get alsoKnownAs;
  @override
  String? get biography;
  @override
  String? get birthday;
  @override
  String? get deathday;
  @override
  int get gender;
  @override
  String? get homepage;
  @override
  int get id;
  @override
  @JsonKey(name: 'imdb_id')
  String? get imdbId;
  @override
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment;
  @override
  String get name;
  @override
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth;
  @override
  double? get popularity;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(name: 'combined_credits')
  CombinedCredits? get combinedCredits;
  @override
  @JsonKey(ignore: true)
  _$$DetailsPeopleImplCopyWith<_$DetailsPeopleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CombinedCredits _$CombinedCreditsFromJson(Map<String, dynamic> json) {
  return _CombinedCredits.fromJson(json);
}

/// @nodoc
mixin _$CombinedCredits {
  List<CastWithCharacter>? get cast => throw _privateConstructorUsedError;
  List<CrewWithJob>? get crew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CombinedCreditsCopyWith<CombinedCredits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CombinedCreditsCopyWith<$Res> {
  factory $CombinedCreditsCopyWith(
          CombinedCredits value, $Res Function(CombinedCredits) then) =
      _$CombinedCreditsCopyWithImpl<$Res, CombinedCredits>;
  @useResult
  $Res call({List<CastWithCharacter>? cast, List<CrewWithJob>? crew});
}

/// @nodoc
class _$CombinedCreditsCopyWithImpl<$Res, $Val extends CombinedCredits>
    implements $CombinedCreditsCopyWith<$Res> {
  _$CombinedCreditsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cast = freezed,
    Object? crew = freezed,
  }) {
    return _then(_value.copyWith(
      cast: freezed == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastWithCharacter>?,
      crew: freezed == crew
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<CrewWithJob>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CombinedCreditsImplCopyWith<$Res>
    implements $CombinedCreditsCopyWith<$Res> {
  factory _$$CombinedCreditsImplCopyWith(_$CombinedCreditsImpl value,
          $Res Function(_$CombinedCreditsImpl) then) =
      __$$CombinedCreditsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CastWithCharacter>? cast, List<CrewWithJob>? crew});
}

/// @nodoc
class __$$CombinedCreditsImplCopyWithImpl<$Res>
    extends _$CombinedCreditsCopyWithImpl<$Res, _$CombinedCreditsImpl>
    implements _$$CombinedCreditsImplCopyWith<$Res> {
  __$$CombinedCreditsImplCopyWithImpl(
      _$CombinedCreditsImpl _value, $Res Function(_$CombinedCreditsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cast = freezed,
    Object? crew = freezed,
  }) {
    return _then(_$CombinedCreditsImpl(
      cast: freezed == cast
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastWithCharacter>?,
      crew: freezed == crew
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<CrewWithJob>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CombinedCreditsImpl implements _CombinedCredits {
  const _$CombinedCreditsImpl(
      {final List<CastWithCharacter>? cast = const [],
      final List<CrewWithJob>? crew = const []})
      : _cast = cast,
        _crew = crew;

  factory _$CombinedCreditsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CombinedCreditsImplFromJson(json);

  final List<CastWithCharacter>? _cast;
  @override
  @JsonKey()
  List<CastWithCharacter>? get cast {
    final value = _cast;
    if (value == null) return null;
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CrewWithJob>? _crew;
  @override
  @JsonKey()
  List<CrewWithJob>? get crew {
    final value = _crew;
    if (value == null) return null;
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CombinedCredits(cast: $cast, crew: $crew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CombinedCreditsImpl &&
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
  _$$CombinedCreditsImplCopyWith<_$CombinedCreditsImpl> get copyWith =>
      __$$CombinedCreditsImplCopyWithImpl<_$CombinedCreditsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CombinedCreditsImplToJson(
      this,
    );
  }
}

abstract class _CombinedCredits implements CombinedCredits {
  const factory _CombinedCredits(
      {final List<CastWithCharacter>? cast,
      final List<CrewWithJob>? crew}) = _$CombinedCreditsImpl;

  factory _CombinedCredits.fromJson(Map<String, dynamic> json) =
      _$CombinedCreditsImpl.fromJson;

  @override
  List<CastWithCharacter>? get cast;
  @override
  List<CrewWithJob>? get crew;
  @override
  @JsonKey(ignore: true)
  _$$CombinedCreditsImplCopyWith<_$CombinedCreditsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CastWithCharacter _$CastWithCharacterFromJson(Map<String, dynamic> json) {
  return _CastWithCharacter.fromJson(json);
}

/// @nodoc
mixin _$CastWithCharacter {
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String? get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String? get originalTitle => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String? get mediaType => throw _privateConstructorUsedError;
  String? get character => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CastWithCharacterCopyWith<CastWithCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CastWithCharacterCopyWith<$Res> {
  factory $CastWithCharacterCopyWith(
          CastWithCharacter value, $Res Function(CastWithCharacter) then) =
      _$CastWithCharacterCopyWithImpl<$Res, CastWithCharacter>;
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'genre_ids') List<int>? genreIds,
      int id,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_title') String? originalTitle,
      String? overview,
      double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'release_date') String? releaseDate,
      String? title,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      @JsonKey(name: 'media_type') String? mediaType,
      String? character,
      int? order});
}

/// @nodoc
class _$CastWithCharacterCopyWithImpl<$Res, $Val extends CastWithCharacter>
    implements $CastWithCharacterCopyWith<$Res> {
  _$CastWithCharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = null,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? mediaType = freezed,
    Object? character = freezed,
    Object? order = freezed,
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
      genreIds: freezed == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CastWithCharacterImplCopyWith<$Res>
    implements $CastWithCharacterCopyWith<$Res> {
  factory _$$CastWithCharacterImplCopyWith(_$CastWithCharacterImpl value,
          $Res Function(_$CastWithCharacterImpl) then) =
      __$$CastWithCharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'genre_ids') List<int>? genreIds,
      int id,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_title') String? originalTitle,
      String? overview,
      double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'release_date') String? releaseDate,
      String? title,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      @JsonKey(name: 'media_type') String? mediaType,
      String? character,
      int? order});
}

/// @nodoc
class __$$CastWithCharacterImplCopyWithImpl<$Res>
    extends _$CastWithCharacterCopyWithImpl<$Res, _$CastWithCharacterImpl>
    implements _$$CastWithCharacterImplCopyWith<$Res> {
  __$$CastWithCharacterImplCopyWithImpl(_$CastWithCharacterImpl _value,
      $Res Function(_$CastWithCharacterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = null,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? mediaType = freezed,
    Object? character = freezed,
    Object? order = freezed,
  }) {
    return _then(_$CastWithCharacterImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CastWithCharacterImpl implements _CastWithCharacter {
  const _$CastWithCharacterImpl(
      {required this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'genre_ids') final List<int>? genreIds,
      required this.id,
      @JsonKey(name: 'original_language') required this.originalLanguage,
      @JsonKey(name: 'original_title') this.originalTitle,
      required this.overview,
      required this.popularity,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'release_date') this.releaseDate,
      required this.title,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount,
      @JsonKey(name: 'media_type') this.mediaType,
      required this.character,
      required this.order})
      : _genreIds = genreIds;

  factory _$CastWithCharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CastWithCharacterImplFromJson(json);

  @override
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final List<int>? _genreIds;
  @override
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds {
    final value = _genreIds;
    if (value == null) return null;
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int id;
  @override
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @override
  final String? overview;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @override
  final String? title;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  final String? character;
  @override
  final int? order;

  @override
  String toString() {
    return 'CastWithCharacter(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage, voteCount: $voteCount, mediaType: $mediaType, character: $character, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastWithCharacterImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      backdropPath,
      const DeepCollectionEquality().hash(_genreIds),
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      voteAverage,
      voteCount,
      mediaType,
      character,
      order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CastWithCharacterImplCopyWith<_$CastWithCharacterImpl> get copyWith =>
      __$$CastWithCharacterImplCopyWithImpl<_$CastWithCharacterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CastWithCharacterImplToJson(
      this,
    );
  }
}

abstract class _CastWithCharacter implements CastWithCharacter {
  const factory _CastWithCharacter(
      {required final bool adult,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'genre_ids') final List<int>? genreIds,
      required final int id,
      @JsonKey(name: 'original_language')
      required final String? originalLanguage,
      @JsonKey(name: 'original_title') final String? originalTitle,
      required final String? overview,
      required final double popularity,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'release_date') final String? releaseDate,
      required final String? title,
      @JsonKey(name: 'vote_average') final double? voteAverage,
      @JsonKey(name: 'vote_count') final int? voteCount,
      @JsonKey(name: 'media_type') final String? mediaType,
      required final String? character,
      required final int? order}) = _$CastWithCharacterImpl;

  factory _CastWithCharacter.fromJson(Map<String, dynamic> json) =
      _$CastWithCharacterImpl.fromJson;

  @override
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds;
  @override
  int get id;
  @override
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String? get originalTitle;
  @override
  String? get overview;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'release_date')
  String? get releaseDate;
  @override
  String? get title;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  String? get character;
  @override
  int? get order;
  @override
  @JsonKey(ignore: true)
  _$$CastWithCharacterImplCopyWith<_$CastWithCharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CrewWithJob _$CrewWithJobFromJson(Map<String, dynamic> json) {
  return _CrewWithJob.fromJson(json);
}

/// @nodoc
mixin _$CrewWithJob {
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String? get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String? get originalTitle => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String? get mediaType => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String? get job => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrewWithJobCopyWith<CrewWithJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrewWithJobCopyWith<$Res> {
  factory $CrewWithJobCopyWith(
          CrewWithJob value, $Res Function(CrewWithJob) then) =
      _$CrewWithJobCopyWithImpl<$Res, CrewWithJob>;
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'genre_ids') List<int>? genreIds,
      int id,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_title') String? originalTitle,
      String? overview,
      double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'release_date') String? releaseDate,
      String? title,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      @JsonKey(name: 'media_type') String? mediaType,
      String? department,
      String? job});
}

/// @nodoc
class _$CrewWithJobCopyWithImpl<$Res, $Val extends CrewWithJob>
    implements $CrewWithJobCopyWith<$Res> {
  _$CrewWithJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = null,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? mediaType = freezed,
    Object? department = freezed,
    Object? job = freezed,
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
      genreIds: freezed == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrewWithJobImplCopyWith<$Res>
    implements $CrewWithJobCopyWith<$Res> {
  factory _$$CrewWithJobImplCopyWith(
          _$CrewWithJobImpl value, $Res Function(_$CrewWithJobImpl) then) =
      __$$CrewWithJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'genre_ids') List<int>? genreIds,
      int id,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_title') String? originalTitle,
      String? overview,
      double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'release_date') String? releaseDate,
      String? title,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      @JsonKey(name: 'media_type') String? mediaType,
      String? department,
      String? job});
}

/// @nodoc
class __$$CrewWithJobImplCopyWithImpl<$Res>
    extends _$CrewWithJobCopyWithImpl<$Res, _$CrewWithJobImpl>
    implements _$$CrewWithJobImplCopyWith<$Res> {
  __$$CrewWithJobImplCopyWithImpl(
      _$CrewWithJobImpl _value, $Res Function(_$CrewWithJobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = null,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? mediaType = freezed,
    Object? department = freezed,
    Object? job = freezed,
  }) {
    return _then(_$CrewWithJobImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrewWithJobImpl implements _CrewWithJob {
  const _$CrewWithJobImpl(
      {required this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'genre_ids') final List<int>? genreIds,
      required this.id,
      @JsonKey(name: 'original_language') required this.originalLanguage,
      @JsonKey(name: 'original_title') this.originalTitle,
      required this.overview,
      required this.popularity,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'release_date') this.releaseDate,
      required this.title,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount,
      @JsonKey(name: 'media_type') this.mediaType,
      required this.department,
      required this.job})
      : _genreIds = genreIds;

  factory _$CrewWithJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrewWithJobImplFromJson(json);

  @override
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final List<int>? _genreIds;
  @override
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds {
    final value = _genreIds;
    if (value == null) return null;
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int id;
  @override
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @override
  final String? overview;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @override
  final String? title;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  final String? department;
  @override
  final String? job;

  @override
  String toString() {
    return 'CrewWithJob(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage, voteCount: $voteCount, mediaType: $mediaType, department: $department, job: $job)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrewWithJobImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      backdropPath,
      const DeepCollectionEquality().hash(_genreIds),
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      voteAverage,
      voteCount,
      mediaType,
      department,
      job);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrewWithJobImplCopyWith<_$CrewWithJobImpl> get copyWith =>
      __$$CrewWithJobImplCopyWithImpl<_$CrewWithJobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrewWithJobImplToJson(
      this,
    );
  }
}

abstract class _CrewWithJob implements CrewWithJob {
  const factory _CrewWithJob(
      {required final bool adult,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'genre_ids') final List<int>? genreIds,
      required final int id,
      @JsonKey(name: 'original_language')
      required final String? originalLanguage,
      @JsonKey(name: 'original_title') final String? originalTitle,
      required final String? overview,
      required final double popularity,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'release_date') final String? releaseDate,
      required final String? title,
      @JsonKey(name: 'vote_average') final double? voteAverage,
      @JsonKey(name: 'vote_count') final int? voteCount,
      @JsonKey(name: 'media_type') final String? mediaType,
      required final String? department,
      required final String? job}) = _$CrewWithJobImpl;

  factory _CrewWithJob.fromJson(Map<String, dynamic> json) =
      _$CrewWithJobImpl.fromJson;

  @override
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds;
  @override
  int get id;
  @override
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String? get originalTitle;
  @override
  String? get overview;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'release_date')
  String? get releaseDate;
  @override
  String? get title;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  String? get department;
  @override
  String? get job;
  @override
  @JsonKey(ignore: true)
  _$$CrewWithJobImplCopyWith<_$CrewWithJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
