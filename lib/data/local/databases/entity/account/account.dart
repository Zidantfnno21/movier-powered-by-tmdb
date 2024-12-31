import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'account_details.dart';

@Entity(tableName: 'account')
class Account {
  @primaryKey
  final int id;
  final String username;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String? name;
  @JsonKey(name: 'include_adult')
  final bool includeAdult;
  @JsonKey(name: 'avatar.gravatar.hash')
  final String gravatarHash;
  @JsonKey(name: 'avatar.tmdb.avatar_path')
  final String? avatarPath;

  Account({
    required this.id,
    required this.username,
    required this.iso6391,
    required this.iso31661,
    this.name,
    required this.includeAdult,
    required this.gravatarHash,
    this.avatarPath,
  });

  // Convert from AccountDetails to Account
  factory Account.fromEntity(AccountDetails accountDetails) {
    return Account(
      id: accountDetails.id,
      username: accountDetails.username,
      iso6391: accountDetails.iso6391,
      iso31661: accountDetails.iso31661,
      name: accountDetails.name,
      includeAdult: accountDetails.includeAdult,
      gravatarHash: accountDetails.avatar.gravatar.hash,
      avatarPath: accountDetails.avatar.tmdb?.avatarPath,
    );
  }

  AccountDetails toEntity() {
    return AccountDetails(
      id: id,
      avatar: Avatar(
        gravatar: Gravatar(hash: gravatarHash),
        tmdb: avatarPath != null ? Tmdb(avatarPath: avatarPath) : null,
      ),
      iso6391: iso6391,
      iso31661: iso31661,
      name: name ?? '',
      includeAdult: includeAdult,
      username: username,
    );
  }
}
