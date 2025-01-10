import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_databases/data/network/model/reviews/review.dart';

part 'reviews.freezed.dart';
part 'reviews.g.dart';

@freezed
class Reviews with _$Reviews {
  const factory Reviews({
    required int page,
    @Default([]) List<Review> results,
    @JsonKey(name: 'total_pages') required int? totalPage,
    @JsonKey(name: 'total_results') required int? totalResults,
  }) = _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);

}