import 'package:floor/floor.dart';

@Entity(tableName: 'people')
class People {
  @primaryKey
  final int id;
  final bool adult;
  final int gender;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;

  People({
    required this.id,
    required this.adult,
    required this.gender,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
  });

  // Factory method to create a People from JSON
  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      id: json['id'] as int? ?? 0, // Default to 0 if 'id' is null
      adult: json['adult'] as bool? ?? false, // Default to false if 'adult' is null
      gender: json['gender'] as int? ?? 0, // Default to 0 if 'gender' is null
      knownForDepartment: json['known_for_department'] as String? ?? '', // Default to empty string if 'known_for_department' is null
      name: json['name'] as String? ?? '', // Default to empty string if 'name' is null
      originalName: json['original_name'] as String? ?? '', // Default to empty string if 'original_name' is null
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0, // Default to 0.0 if 'popularity' is null
      profilePath: json['profile_path'] as String? ?? '', // Default to empty string if 'profile_path' is null
    );
  }

  // Method to convert a People to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'gender': gender,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
    };
  }
}
