import 'package:drift/drift.dart';
import 'package:themovie_flutter/src/data/model/movie_favorite_entity.dart';

import 'app_database.dart';

part 'movie_favorite_dao.g.dart';

@DriftAccessor(tables: [MovieFavoriteEntity])
class MovieFavoriteDao extends DatabaseAccessor<AppDatabase>
    with _$MovieFavoriteDaoMixin {
  MovieFavoriteDao(AppDatabase db) : super(db);

  Future<int> insertMovie(MovieFavoriteEntityData movie) =>
      into(movieFavoriteEntity).insert(movie, mode: InsertMode.insertOrReplace);
  Future<bool> updateMovie(MovieFavoriteEntityData movie) =>
      update(movieFavoriteEntity).replace(movie);
  Future<int> deleteMovie(MovieFavoriteEntityData movie) =>
      delete(movieFavoriteEntity).delete(movie);

  Future<int> deleteAllMovie() => delete(movieFavoriteEntity).go();
  Future<List<MovieFavoriteEntityData>> getAllMovie() =>
      select(movieFavoriteEntity).get();

  Future<MovieFavoriteEntityData?> getMovieFavoriteById(int movieId) =>
      (select(movieFavoriteEntity)
            ..where((tbl) => tbl.id.equals(movieId))
            ..limit(1))
          .getSingleOrNull();
}
