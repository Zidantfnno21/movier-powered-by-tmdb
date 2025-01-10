// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      author: json['author'] as String?,
      authorDetails: AuthorDetails.fromJson(
          json['author_details'] as Map<String, dynamic>),
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as String?,
      updatedAt: json['updated_at'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'author_details': instance.authorDetails,
      'content': instance.content,
      'created_at': instance.createdAt,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'url': instance.url,
    };

_$AuthorDetailsImpl _$$AuthorDetailsImplFromJson(Map<String, dynamic> json) =>
    _$AuthorDetailsImpl(
      name: json['name'] as String?,
      username: json['username'] as String?,
      avatarPath: json['avatarPath'] as String?,
      rating: (json['rating'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AuthorDetailsImplToJson(_$AuthorDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatarPath': instance.avatarPath,
      'rating': instance.rating,
    };
