// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountDetailsImpl _$$AccountDetailsImplFromJson(Map<String, dynamic> json) =>
    _$AccountDetailsImpl(
      id: (json['id'] as num).toInt(),
      avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      iso6391: json['iso_639_1'] as String,
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String? ?? '',
      includeAdult: json['include_adult'] as bool,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$AccountDetailsImplToJson(
        _$AccountDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'include_adult': instance.includeAdult,
      'username': instance.username,
    };

_$AvatarImpl _$$AvatarImplFromJson(Map<String, dynamic> json) => _$AvatarImpl(
      gravatar: Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
      tmdb: json['tmdb'] == null
          ? null
          : Tmdb.fromJson(json['tmdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AvatarImplToJson(_$AvatarImpl instance) =>
    <String, dynamic>{
      'gravatar': instance.gravatar,
      'tmdb': instance.tmdb,
    };

_$TmdbImpl _$$TmdbImplFromJson(Map<String, dynamic> json) => _$TmdbImpl(
      avatarPath: json['avatar_path'] as String?,
    );

Map<String, dynamic> _$$TmdbImplToJson(_$TmdbImpl instance) =>
    <String, dynamic>{
      'avatar_path': instance.avatarPath,
    };

_$GravatarImpl _$$GravatarImplFromJson(Map<String, dynamic> json) =>
    _$GravatarImpl(
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$$GravatarImplToJson(_$GravatarImpl instance) =>
    <String, dynamic>{
      'hash': instance.hash,
    };
