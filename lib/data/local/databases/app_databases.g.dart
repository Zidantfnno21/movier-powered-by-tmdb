// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_databases.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabasesBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabasesBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabasesBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabases> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabases {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabasesBuilderContract databaseBuilder(String name) =>
      _$AppDatabasesBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabasesBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabasesBuilder(null);
}

class _$AppDatabasesBuilder implements $AppDatabasesBuilderContract {
  _$AppDatabasesBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabasesBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabasesBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabases> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabases();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabases extends AppDatabases {
  _$AppDatabases([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MoviesDao? _moviesDaoInstance;

  PeopleDao? _peopleDaoInstance;

  TrendingDao? _trendingDaoInstance;

  TvShowsDao? _tvShowsDaoInstance;

  GenresDao? _genresDaoInstance;

  AccountDao? _accountDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `movies` (`id` INTEGER NOT NULL, `adult` INTEGER NOT NULL, `backdropPath` TEXT NOT NULL, `originalLanguage` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `overview` TEXT NOT NULL, `popularity` REAL NOT NULL, `posterPath` TEXT NOT NULL, `releaseDate` TEXT NOT NULL, `title` TEXT NOT NULL, `video` INTEGER NOT NULL, `voteAverage` REAL NOT NULL, `voteCount` INTEGER NOT NULL, `genreIds` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `people` (`id` INTEGER NOT NULL, `adult` INTEGER NOT NULL, `gender` INTEGER NOT NULL, `knownForDepartment` TEXT NOT NULL, `name` TEXT NOT NULL, `originalName` TEXT NOT NULL, `popularity` REAL NOT NULL, `profilePath` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `trending` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `overview` TEXT NOT NULL, `posterPath` TEXT NOT NULL, `backdropPath` TEXT NOT NULL, `mediaType` TEXT NOT NULL, `adult` INTEGER NOT NULL, `originalLanguage` TEXT NOT NULL, `popularity` REAL NOT NULL, `releaseDate` TEXT NOT NULL, `voteAverage` REAL NOT NULL, `voteCount` INTEGER NOT NULL, `genreIds` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tv_shows` (`id` INTEGER NOT NULL, `adult` INTEGER NOT NULL, `backdropPath` TEXT NOT NULL, `originalLanguage` TEXT NOT NULL, `originalName` TEXT NOT NULL, `overview` TEXT NOT NULL, `popularity` REAL NOT NULL, `posterPath` TEXT NOT NULL, `firstAirDate` TEXT NOT NULL, `name` TEXT NOT NULL, `voteAverage` REAL NOT NULL, `voteCount` INTEGER NOT NULL, `genreIds` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `genres` (`id` INTEGER, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `account` (`id` INTEGER NOT NULL, `username` TEXT NOT NULL, `iso6391` TEXT NOT NULL, `iso31661` TEXT NOT NULL, `name` TEXT, `includeAdult` INTEGER NOT NULL, `gravatarHash` TEXT NOT NULL, `avatarPath` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MoviesDao get moviesDao {
    return _moviesDaoInstance ??= _$MoviesDao(database, changeListener);
  }

  @override
  PeopleDao get peopleDao {
    return _peopleDaoInstance ??= _$PeopleDao(database, changeListener);
  }

  @override
  TrendingDao get trendingDao {
    return _trendingDaoInstance ??= _$TrendingDao(database, changeListener);
  }

  @override
  TvShowsDao get tvShowsDao {
    return _tvShowsDaoInstance ??= _$TvShowsDao(database, changeListener);
  }

  @override
  GenresDao get genresDao {
    return _genresDaoInstance ??= _$GenresDao(database, changeListener);
  }

  @override
  AccountDao get accountDao {
    return _accountDaoInstance ??= _$AccountDao(database, changeListener);
  }
}

class _$MoviesDao extends MoviesDao {
  _$MoviesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _moviesInsertionAdapter = InsertionAdapter(
            database,
            'movies',
            (Movies item) => <String, Object?>{
                  'id': item.id,
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video ? 1 : 0,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'genreIds': _genreIdsConverter.encode(item.genreIds)
                }),
        _moviesUpdateAdapter = UpdateAdapter(
            database,
            'movies',
            ['id'],
            (Movies item) => <String, Object?>{
                  'id': item.id,
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video ? 1 : 0,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'genreIds': _genreIdsConverter.encode(item.genreIds)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movies> _moviesInsertionAdapter;

  final UpdateAdapter<Movies> _moviesUpdateAdapter;

  @override
  Future<List<Movies>> getAllMovies() async {
    return _queryAdapter.queryList('SELECT * FROM movies',
        mapper: (Map<String, Object?> row) => Movies(
            id: row['id'] as int,
            adult: (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            posterPath: row['posterPath'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            video: (row['video'] as int) != 0,
            voteAverage: row['voteAverage'] as double,
            voteCount: row['voteCount'] as int,
            genreIds: _genreIdsConverter.decode(row['genreIds'] as String)));
  }

  @override
  Future<void> deleteAllMovies() async {
    await _queryAdapter.queryNoReturn('DELETE FROM movies');
  }

  @override
  Future<void> insertMovies(Movies movies) async {
    await _moviesInsertionAdapter.insert(movies, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateMovies(Movies movies) async {
    await _moviesUpdateAdapter.update(movies, OnConflictStrategy.replace);
  }
}

class _$PeopleDao extends PeopleDao {
  _$PeopleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _peopleInsertionAdapter = InsertionAdapter(
            database,
            'people',
            (People item) => <String, Object?>{
                  'id': item.id,
                  'adult': item.adult ? 1 : 0,
                  'gender': item.gender,
                  'knownForDepartment': item.knownForDepartment,
                  'name': item.name,
                  'originalName': item.originalName,
                  'popularity': item.popularity,
                  'profilePath': item.profilePath
                }),
        _peopleUpdateAdapter = UpdateAdapter(
            database,
            'people',
            ['id'],
            (People item) => <String, Object?>{
                  'id': item.id,
                  'adult': item.adult ? 1 : 0,
                  'gender': item.gender,
                  'knownForDepartment': item.knownForDepartment,
                  'name': item.name,
                  'originalName': item.originalName,
                  'popularity': item.popularity,
                  'profilePath': item.profilePath
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<People> _peopleInsertionAdapter;

  final UpdateAdapter<People> _peopleUpdateAdapter;

  @override
  Future<List<People>> getAllPeople() async {
    return _queryAdapter.queryList('SELECT * FROM people',
        mapper: (Map<String, Object?> row) => People(
            id: row['id'] as int,
            adult: (row['adult'] as int) != 0,
            gender: row['gender'] as int,
            knownForDepartment: row['knownForDepartment'] as String,
            name: row['name'] as String,
            originalName: row['originalName'] as String,
            popularity: row['popularity'] as double,
            profilePath: row['profilePath'] as String));
  }

  @override
  Future<void> deleteAllPeople() async {
    await _queryAdapter.queryNoReturn('DELETE FROM people');
  }

  @override
  Future<void> insertPeople(People people) async {
    await _peopleInsertionAdapter.insert(people, OnConflictStrategy.replace);
  }

  @override
  Future<void> updatePeople(People people) async {
    await _peopleUpdateAdapter.update(people, OnConflictStrategy.replace);
  }
}

class _$TrendingDao extends TrendingDao {
  _$TrendingDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _trendingInsertionAdapter = InsertionAdapter(
            database,
            'trending',
            (Trending item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'posterPath': item.posterPath,
                  'backdropPath': item.backdropPath,
                  'mediaType': item.mediaType,
                  'adult': item.adult ? 1 : 0,
                  'originalLanguage': item.originalLanguage,
                  'popularity': item.popularity,
                  'releaseDate': item.releaseDate,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'genreIds': _genreIdsConverter.encode(item.genreIds)
                }),
        _trendingUpdateAdapter = UpdateAdapter(
            database,
            'trending',
            ['id'],
            (Trending item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'posterPath': item.posterPath,
                  'backdropPath': item.backdropPath,
                  'mediaType': item.mediaType,
                  'adult': item.adult ? 1 : 0,
                  'originalLanguage': item.originalLanguage,
                  'popularity': item.popularity,
                  'releaseDate': item.releaseDate,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'genreIds': _genreIdsConverter.encode(item.genreIds)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Trending> _trendingInsertionAdapter;

  final UpdateAdapter<Trending> _trendingUpdateAdapter;

  @override
  Future<List<Trending>> getAllTrending() async {
    return _queryAdapter.queryList('SELECT * FROM trending',
        mapper: (Map<String, Object?> row) => Trending(
            id: row['id'] as int,
            title: row['title'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            posterPath: row['posterPath'] as String,
            backdropPath: row['backdropPath'] as String,
            mediaType: row['mediaType'] as String,
            adult: (row['adult'] as int) != 0,
            originalLanguage: row['originalLanguage'] as String,
            popularity: row['popularity'] as double,
            releaseDate: row['releaseDate'] as String,
            voteAverage: row['voteAverage'] as double,
            voteCount: row['voteCount'] as int,
            genreIds: _genreIdsConverter.decode(row['genreIds'] as String)));
  }

  @override
  Future<void> deleteAllTrending() async {
    await _queryAdapter.queryNoReturn('DELETE FROM trending');
  }

  @override
  Future<void> insertTrending(Trending trending) async {
    await _trendingInsertionAdapter.insert(
        trending, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateTrending(Trending trending) async {
    await _trendingUpdateAdapter.update(trending, OnConflictStrategy.replace);
  }
}

class _$TvShowsDao extends TvShowsDao {
  _$TvShowsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _tvShowsInsertionAdapter = InsertionAdapter(
            database,
            'tv_shows',
            (TvShows item) => <String, Object?>{
                  'id': item.id,
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'originalLanguage': item.originalLanguage,
                  'originalName': item.originalName,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'firstAirDate': item.firstAirDate,
                  'name': item.name,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'genreIds': _genreIdsConverter.encode(item.genreIds)
                }),
        _tvShowsUpdateAdapter = UpdateAdapter(
            database,
            'tv_shows',
            ['id'],
            (TvShows item) => <String, Object?>{
                  'id': item.id,
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'originalLanguage': item.originalLanguage,
                  'originalName': item.originalName,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'firstAirDate': item.firstAirDate,
                  'name': item.name,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'genreIds': _genreIdsConverter.encode(item.genreIds)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TvShows> _tvShowsInsertionAdapter;

  final UpdateAdapter<TvShows> _tvShowsUpdateAdapter;

  @override
  Future<List<TvShows>> getAllTvShows() async {
    return _queryAdapter.queryList('SELECT * FROM tv_shows',
        mapper: (Map<String, Object?> row) => TvShows(
            id: row['id'] as int,
            adult: (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String,
            originalLanguage: row['originalLanguage'] as String,
            originalName: row['originalName'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            posterPath: row['posterPath'] as String,
            firstAirDate: row['firstAirDate'] as String,
            name: row['name'] as String,
            voteAverage: row['voteAverage'] as double,
            voteCount: row['voteCount'] as int,
            genreIds: _genreIdsConverter.decode(row['genreIds'] as String)));
  }

  @override
  Future<void> deleteAllTvShows() async {
    await _queryAdapter.queryNoReturn('DELETE FROM tv_shows');
  }

  @override
  Future<void> insertTvShows(TvShows tvShows) async {
    await _tvShowsInsertionAdapter.insert(tvShows, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateTvShows(TvShows tvShows) async {
    await _tvShowsUpdateAdapter.update(tvShows, OnConflictStrategy.replace);
  }
}

class _$GenresDao extends GenresDao {
  _$GenresDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _genresInsertionAdapter = InsertionAdapter(
            database,
            'genres',
            (Genres item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Genres> _genresInsertionAdapter;

  @override
  Future<Genres?> findGenreNameByGenreIds(int id) async {
    return _queryAdapter.query('SELECT name FROM genres WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Genres(id: row['id'] as int?, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteAllGenres() async {
    await _queryAdapter.queryNoReturn('DELETE FROM genres');
  }

  @override
  Future<void> insertGenres(Genres genres) async {
    await _genresInsertionAdapter.insert(genres, OnConflictStrategy.replace);
  }
}

class _$AccountDao extends AccountDao {
  _$AccountDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _accountInsertionAdapter = InsertionAdapter(
            database,
            'account',
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'iso6391': item.iso6391,
                  'iso31661': item.iso31661,
                  'name': item.name,
                  'includeAdult': item.includeAdult ? 1 : 0,
                  'gravatarHash': item.gravatarHash,
                  'avatarPath': item.avatarPath
                }),
        _accountUpdateAdapter = UpdateAdapter(
            database,
            'account',
            ['id'],
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'iso6391': item.iso6391,
                  'iso31661': item.iso31661,
                  'name': item.name,
                  'includeAdult': item.includeAdult ? 1 : 0,
                  'gravatarHash': item.gravatarHash,
                  'avatarPath': item.avatarPath
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Account> _accountInsertionAdapter;

  final UpdateAdapter<Account> _accountUpdateAdapter;

  @override
  Future<Account?> getAccount() async {
    return _queryAdapter.query('SELECT * FROM account',
        mapper: (Map<String, Object?> row) => Account(
            id: row['id'] as int,
            username: row['username'] as String,
            iso6391: row['iso6391'] as String,
            iso31661: row['iso31661'] as String,
            name: row['name'] as String?,
            includeAdult: (row['includeAdult'] as int) != 0,
            gravatarHash: row['gravatarHash'] as String,
            avatarPath: row['avatarPath'] as String?));
  }

  @override
  Future<void> deleteAccount() async {
    await _queryAdapter.queryNoReturn('DELETE FROM account');
  }

  @override
  Future<void> insertAccount(Account account) async {
    await _accountInsertionAdapter.insert(account, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateAccount(Account account) async {
    await _accountUpdateAdapter.update(account, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _genreIdsConverter = GenreIdsConverter();
