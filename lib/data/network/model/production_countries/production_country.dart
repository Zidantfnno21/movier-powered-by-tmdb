// ignore_for_file: invalid_annotation_target, unnecessary_lambdas

import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_country.freezed.dart';
part 'production_country.g.dart';

@freezed
class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @JsonKey(name: 'iso_3166_1') required String iso31661,
    @JsonKey(name: 'name') required String name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}