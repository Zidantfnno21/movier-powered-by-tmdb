// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountStatesImpl _$$AccountStatesImplFromJson(Map<String, dynamic> json) =>
    _$AccountStatesImpl(
      favorite: json['favorite'] as bool,
      rated: json['rated'] as bool,
      watchlist: json['watchlist'] as bool,
    );

Map<String, dynamic> _$$AccountStatesImplToJson(_$AccountStatesImpl instance) =>
    <String, dynamic>{
      'favorite': instance.favorite,
      'rated': instance.rated,
      'watchlist': instance.watchlist,
    };
