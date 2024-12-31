import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:the_movie_databases/data/local/databases/dao/account_dao.dart';
import 'package:the_movie_databases/data/local/databases/dao/genres_dao.dart';

import '../../../utils/genre_ids_converter.dart';
import 'dao/movies_dao.dart';
import 'dao/people_dao.dart';
import 'dao/trending_dao.dart';
import 'dao/tv_shows_dao.dart';
import 'entity/account/account.dart';
import 'entity/genres.dart';
import 'entity/movies.dart';
import 'entity/people.dart';
import 'entity/trending.dart';
import 'entity/tv_shows.dart';

part 'app_databases.g.dart';

@TypeConverters([GenreIdsConverter])
@Database(
    version: 1, entities: [Movies, People, Trending, TvShows, Genres, Account])
abstract class AppDatabases extends FloorDatabase {
  MoviesDao get moviesDao;
  PeopleDao get peopleDao;
  TrendingDao get trendingDao;
  TvShowsDao get tvShowsDao;
  GenresDao get genresDao;
  AccountDao get accountDao;

  Future<void> clearAllTables() async {
    await moviesDao.deleteAllMovies();
    await peopleDao.deleteAllPeople();
    await trendingDao.deleteAllTrending();
    await tvShowsDao.deleteAllTvShows();
    await genresDao.deleteAllGenres();
    await accountDao.deleteAccount();
  }
}
