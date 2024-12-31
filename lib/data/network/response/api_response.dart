import 'package:json_annotation/json_annotation.dart';

import '../../local/databases/entity/genres.dart';
import '../videos.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final int page;
  final List<T> results;

  ApiResponse({required this.page, required this.results});

  // factory ApiResponse.fromJson(
  //     Map<String, dynamic> json,
  //     T Function(Object?) fromJsonT)
  // {
  //   print('Raw JSON Input: $json');
  //   final apiResponse = ApiResponse(
  //     page: json['page'] as int,
  //     results: (json['results'] as List)
  //         .map((e) => fromJsonT(e))
  //         .toList(),
  //   );
  //   print('Parsed ApiResponse: ${apiResponse.results}');
  //   return apiResponse;
  // }
  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);

  // Map<String, dynamic> toJson(T Function(T) toJsonT) => {
  //   'page': page,
  //   'results': results.map(toJsonT).toList(),
  // };
  Map<String, dynamic> toJson(T Function(T) toJsonT) {
    return _$ApiResponseToJson(this, toJsonT);
  }
}

@JsonSerializable()
class ApiErrorResponse {
  final bool success;
  final int statusCode;
  final String statusMessage;

  ApiErrorResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);
}

@JsonSerializable()
class ApiPostResponse {
  @JsonKey(name: 'status_code')
  final int statusCode;
  @JsonKey(name: 'status_message')
  final String statusMessage;

  ApiPostResponse({
    required this.statusCode,
    required this.statusMessage,
  });

  factory ApiPostResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiPostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiPostResponseToJson(this);
}

class ApiResponseGenre {
  final List<Genres> genreList;

  ApiResponseGenre({required this.genreList});

  factory ApiResponseGenre.fromJson(Map<String, dynamic> json) {
    return ApiResponseGenre(
      genreList: (json['genres'] as List<dynamic>)
          .map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'genres': genreList.map((genre) => genre.toJson()).toList(),
    };
  }
}

@JsonSerializable()
class ApiResponseGuestSession {
  final bool success;
  @JsonKey(name: 'guest_session_id')
  final String guestSessionId;
  @JsonKey(name: 'expires_at')
  final String expiresAt;

  ApiResponseGuestSession({
    required this.success,
    required this.guestSessionId,
    required this.expiresAt,
  });

  factory ApiResponseGuestSession.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseGuestSessionFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseGuestSessionToJson(this);
}

@JsonSerializable()
class ApiResponseVideos {
  final int id;
  final List<Videos> results;

  ApiResponseVideos({required this.id, required this.results});

  factory ApiResponseVideos.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseVideosFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseVideosToJson(this);
}
