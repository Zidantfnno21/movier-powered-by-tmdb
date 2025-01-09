// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailsPeopleImpl _$$DetailsPeopleImplFromJson(Map<String, dynamic> json) =>
    _$DetailsPeopleImpl(
      adult: json['adult'] as bool,
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      biography: json['biography'] as String?,
      birthday: json['birthday'] as String?,
      deathday: json['deathday'] as String?,
      gender: (json['gender'] as num).toInt(),
      homepage: json['homepage'] as String?,
      id: (json['id'] as num).toInt(),
      imdbId: json['imdb_id'] as String?,
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      placeOfBirth: json['place_of_birth'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
      combinedCredits: json['combined_credits'] == null
          ? null
          : CombinedCredits.fromJson(
              json['combined_credits'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$DetailsPeopleImplToJson(_$DetailsPeopleImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'also_known_as': instance.alsoKnownAs,
      'biography': instance.biography,
      'birthday': instance.birthday,
      'deathday': instance.deathday,
      'gender': instance.gender,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'place_of_birth': instance.placeOfBirth,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'combined_credits': instance.combinedCredits,
    };

_$CombinedCreditsImpl _$$CombinedCreditsImplFromJson(
        Map<String, dynamic> json) =>
    _$CombinedCreditsImpl(
      cast: (json['cast'] as List<dynamic>?)
              ?.map(
                  (e) => CastWithCharacter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      crew: (json['crew'] as List<dynamic>?)
              ?.map((e) => CrewWithJob.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CombinedCreditsImplToJson(
        _$CombinedCreditsImpl instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };

_$CastWithCharacterImpl _$$CastWithCharacterImplFromJson(
        Map<String, dynamic> json) =>
    _$CastWithCharacterImpl(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num).toInt(),
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      mediaType: json['media_type'] as String?,
      character: json['character'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CastWithCharacterImplToJson(
        _$CastWithCharacterImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'media_type': instance.mediaType,
      'character': instance.character,
      'order': instance.order,
    };

_$CrewWithJobImpl _$$CrewWithJobImplFromJson(Map<String, dynamic> json) =>
    _$CrewWithJobImpl(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num).toInt(),
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      mediaType: json['media_type'] as String?,
      department: json['department'] as String?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$$CrewWithJobImplToJson(_$CrewWithJobImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'media_type': instance.mediaType,
      'department': instance.department,
      'job': instance.job,
    };
