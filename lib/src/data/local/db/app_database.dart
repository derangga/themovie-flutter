import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:themovie_flutter/src/data/local/db/tv_show_favorite_dao.dart';
import 'package:themovie_flutter/src/data/model/movie_favorite_entity.dart';
import 'package:themovie_flutter/src/data/model/tv_show_favorite_entity.dart';
import 'movie_favorite_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
    tables: [MovieFavoriteEntity, TvShowFavoriteEntity],
    daos: [MovieFavoriteDao, TvShowFavoriteDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          SqfliteQueryExecutor.inDatabaseFolder(
            path: 'app_database.sqlite',
          ),
        );

  @override
  int get schemaVersion => 1;
}
