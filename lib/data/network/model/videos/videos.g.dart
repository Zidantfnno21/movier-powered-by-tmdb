// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideosImpl _$$VideosImplFromJson(Map<String, dynamic> json) => _$VideosImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideosImplToJson(_$VideosImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };