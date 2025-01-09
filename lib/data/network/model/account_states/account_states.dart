// ignore_for_file: invalid_annotation_target, unnecessary_lambdas

import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_states.freezed.dart';
part 'account_states.g.dart';

@freezed
class AccountStates with _$AccountStates {
  const factory AccountStates({
    @JsonKey(name: 'favorite') required bool favorite,
    @JsonKey(name: 'rated') required bool rated,
    @JsonKey(name: 'watchlist') required bool watchlist,
  }) = _AccountStates;

  factory AccountStates.fromJson(Map<String, dynamic> json) =>
      _$AccountStatesFromJson(json);
}
