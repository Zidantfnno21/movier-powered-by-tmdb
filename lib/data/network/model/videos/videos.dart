// ignore_for_file: invalid_annotation_target, unnecessary_lambdas

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_databases/data/network/model/videos/video.dart';

part 'videos.freezed.dart';
part 'videos.g.dart';

@freezed
class Videos with _$Videos {
  const factory Videos({
    @JsonKey(name: 'results') required List<Video> results,
  }) = _Videos;

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);
}
