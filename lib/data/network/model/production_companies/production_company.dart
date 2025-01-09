// ignore_for_file: invalid_annotation_target, unnecessary_lambdas

import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_company.freezed.dart';
part 'production_company.g.dart';

@freezed
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'origin_country') required String originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}