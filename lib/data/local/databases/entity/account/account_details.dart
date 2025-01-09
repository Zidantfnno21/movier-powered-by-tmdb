// ignore_for_file: invalid_annotation_target, unnecessary_lambdas

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_databases/data/local/databases/entity/account/account.dart';

part 'account_details.freezed.dart';
part 'account_details.g.dart';

@freezed
class AccountDetails with _$AccountDetails {
  const factory AccountDetails({
    required int id,
    required Avatar avatar,
    @JsonKey(name: 'iso_639_1') required String iso6391,
    @JsonKey(name: 'iso_3166_1') required String iso31661,
    @Default('') String name,
    @JsonKey(name: 'include_adult') required bool includeAdult,
    required String username,
  }) = _AccountDetails;

  factory AccountDetails.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsFromJson(json);
}

extension AccountDetailsExtensions on AccountDetails {
  Account toAccount() {
    return Account(
      id: id,
      name: name,
      username: username,
      iso6391: iso6391,
      iso31661: iso31661,
      includeAdult: includeAdult,
      gravatarHash: avatar.gravatar.hash,
      avatarPath: avatar.tmdb?.avatarPath ?? '',
    );
  }
}

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    required Gravatar gravatar,
    Tmdb? tmdb,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}

@freezed
class Tmdb with _$Tmdb {
  const factory Tmdb({
    @JsonKey(name: 'avatar_path') String? avatarPath,
  }) = _Tmdb;

  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);
}

@freezed
class Gravatar with _$Gravatar {
  const factory Gravatar({
    required String hash,
  }) = _Gravatar;

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
}
