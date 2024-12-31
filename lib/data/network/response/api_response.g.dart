// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map(toJsonT).toList(),
    };

ApiErrorResponse _$ApiErrorResponseFromJson(Map<String, dynamic> json) =>
    ApiErrorResponse(
      success: json['success'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      statusMessage: json['statusMessage'] as String,
    );

Map<String, dynamic> _$ApiErrorResponseToJson(ApiErrorResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
    };

ApiPostResponse _$ApiPostResponseFromJson(Map<String, dynamic> json) =>
    ApiPostResponse(
      statusCode: (json['status_code'] as num).toInt(),
      statusMessage: json['status_message'] as String,
    );

Map<String, dynamic> _$ApiPostResponseToJson(ApiPostResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };

ApiResponseGuestSession _$ApiResponseGuestSessionFromJson(
        Map<String, dynamic> json) =>
    ApiResponseGuestSession(
      success: json['success'] as bool,
      guestSessionId: json['guest_session_id'] as String,
      expiresAt: json['expires_at'] as String,
    );

Map<String, dynamic> _$ApiResponseGuestSessionToJson(
        ApiResponseGuestSession instance) =>
    <String, dynamic>{
      'success': instance.success,
      'guest_session_id': instance.guestSessionId,
      'expires_at': instance.expiresAt,
    };

ApiResponseVideos _$ApiResponseVideosFromJson(Map<String, dynamic> json) =>
    ApiResponseVideos(
      id: (json['id'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Videos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiResponseVideosToJson(ApiResponseVideos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
