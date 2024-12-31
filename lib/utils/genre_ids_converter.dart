import 'dart:convert';

import 'package:floor/floor.dart';

class GenreIdsConverter extends TypeConverter<List<int>, String> {
  @override
  List<int> decode(String databaseValue) {
    if (databaseValue.isEmpty) return [];
    return (jsonDecode(databaseValue) as List<dynamic>).map((e) => e as int).toList();
  }

  @override
  String encode(List<int> value) {
    return jsonEncode(value);
  }
}
