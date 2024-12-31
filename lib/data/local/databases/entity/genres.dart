import 'package:floor/floor.dart';

@Entity(tableName: 'genres')
class Genres{
  @primaryKey
  final int? id ;
  final String name;

  Genres({
    required this.id,
    required this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
        id: json['id'] as int?,
        name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'name': name,
    };
  }
}