// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'videos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Videos _$VideosFromJson(Map<String, dynamic> json) {
  return _Videos.fromJson(json);
}

/// @nodoc
mixin _$Videos {
  @JsonKey(name: 'results')
  List<Video> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideosCopyWith<Videos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideosCopyWith<$Res> {
  factory $VideosCopyWith(Videos value, $Res Function(Videos) then) =
      _$VideosCopyWithImpl<$Res, Videos>;
  @useResult
  $Res call({@JsonKey(name: 'results') List<Video> results});
}

/// @nodoc
class _$VideosCopyWithImpl<$Res, $Val extends Videos>
    implements $VideosCopyWith<$Res> {
  _$VideosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Video>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideosImplCopyWith<$Res> implements $VideosCopyWith<$Res> {
  factory _$$VideosImplCopyWith(
          _$VideosImpl value, $Res Function(_$VideosImpl) then) =
      __$$VideosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'results') List<Video> results});
}

/// @nodoc
class __$$VideosImplCopyWithImpl<$Res>
    extends _$VideosCopyWithImpl<$Res, _$VideosImpl>
    implements _$$VideosImplCopyWith<$Res> {
  __$$VideosImplCopyWithImpl(
      _$VideosImpl _value, $Res Function(_$VideosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$VideosImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Video>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideosImpl implements _Videos {
  const _$VideosImpl(
      {@JsonKey(name: 'results') required final List<Video> results})
      : _results = results;

  factory _$VideosImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideosImplFromJson(json);

  final List<Video> _results;
  @override
  @JsonKey(name: 'results')
  List<Video> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'Videos(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideosImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideosImplCopyWith<_$VideosImpl> get copyWith =>
      __$$VideosImplCopyWithImpl<_$VideosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideosImplToJson(
      this,
    );
  }
}

abstract class _Videos implements Videos {
  const factory _Videos(
          {@JsonKey(name: 'results') required final List<Video> results}) =
      _$VideosImpl;

  factory _Videos.fromJson(Map<String, dynamic> json) = _$VideosImpl.fromJson;

  @override
  @JsonKey(name: 'results')
  List<Video> get results;
  @override
  @JsonKey(ignore: true)
  _$$VideosImplCopyWith<_$VideosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
