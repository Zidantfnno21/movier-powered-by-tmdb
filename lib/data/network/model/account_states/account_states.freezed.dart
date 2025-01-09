// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountStates _$AccountStatesFromJson(Map<String, dynamic> json) {
  return _AccountStates.fromJson(json);
}

/// @nodoc
mixin _$AccountStates {
  @JsonKey(name: 'favorite')
  bool get favorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'rated')
  bool get rated => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchlist')
  bool get watchlist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountStatesCopyWith<AccountStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStatesCopyWith<$Res> {
  factory $AccountStatesCopyWith(
          AccountStates value, $Res Function(AccountStates) then) =
      _$AccountStatesCopyWithImpl<$Res, AccountStates>;
  @useResult
  $Res call(
      {@JsonKey(name: 'favorite') bool favorite,
      @JsonKey(name: 'rated') bool rated,
      @JsonKey(name: 'watchlist') bool watchlist});
}

/// @nodoc
class _$AccountStatesCopyWithImpl<$Res, $Val extends AccountStates>
    implements $AccountStatesCopyWith<$Res> {
  _$AccountStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorite = null,
    Object? rated = null,
    Object? watchlist = null,
  }) {
    return _then(_value.copyWith(
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      rated: null == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as bool,
      watchlist: null == watchlist
          ? _value.watchlist
          : watchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountStatesImplCopyWith<$Res>
    implements $AccountStatesCopyWith<$Res> {
  factory _$$AccountStatesImplCopyWith(
          _$AccountStatesImpl value, $Res Function(_$AccountStatesImpl) then) =
      __$$AccountStatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'favorite') bool favorite,
      @JsonKey(name: 'rated') bool rated,
      @JsonKey(name: 'watchlist') bool watchlist});
}

/// @nodoc
class __$$AccountStatesImplCopyWithImpl<$Res>
    extends _$AccountStatesCopyWithImpl<$Res, _$AccountStatesImpl>
    implements _$$AccountStatesImplCopyWith<$Res> {
  __$$AccountStatesImplCopyWithImpl(
      _$AccountStatesImpl _value, $Res Function(_$AccountStatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorite = null,
    Object? rated = null,
    Object? watchlist = null,
  }) {
    return _then(_$AccountStatesImpl(
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      rated: null == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as bool,
      watchlist: null == watchlist
          ? _value.watchlist
          : watchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountStatesImpl implements _AccountStates {
  const _$AccountStatesImpl(
      {@JsonKey(name: 'favorite') required this.favorite,
      @JsonKey(name: 'rated') required this.rated,
      @JsonKey(name: 'watchlist') required this.watchlist});

  factory _$AccountStatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountStatesImplFromJson(json);

  @override
  @JsonKey(name: 'favorite')
  final bool favorite;
  @override
  @JsonKey(name: 'rated')
  final bool rated;
  @override
  @JsonKey(name: 'watchlist')
  final bool watchlist;

  @override
  String toString() {
    return 'AccountStates(favorite: $favorite, rated: $rated, watchlist: $watchlist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountStatesImpl &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.rated, rated) || other.rated == rated) &&
            (identical(other.watchlist, watchlist) ||
                other.watchlist == watchlist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, favorite, rated, watchlist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountStatesImplCopyWith<_$AccountStatesImpl> get copyWith =>
      __$$AccountStatesImplCopyWithImpl<_$AccountStatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountStatesImplToJson(
      this,
    );
  }
}

abstract class _AccountStates implements AccountStates {
  const factory _AccountStates(
          {@JsonKey(name: 'favorite') required final bool favorite,
          @JsonKey(name: 'rated') required final bool rated,
          @JsonKey(name: 'watchlist') required final bool watchlist}) =
      _$AccountStatesImpl;

  factory _AccountStates.fromJson(Map<String, dynamic> json) =
      _$AccountStatesImpl.fromJson;

  @override
  @JsonKey(name: 'favorite')
  bool get favorite;
  @override
  @JsonKey(name: 'rated')
  bool get rated;
  @override
  @JsonKey(name: 'watchlist')
  bool get watchlist;
  @override
  @JsonKey(ignore: true)
  _$$AccountStatesImplCopyWith<_$AccountStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
