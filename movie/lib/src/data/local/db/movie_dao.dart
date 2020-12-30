import 'package:core/core.dart';
import 'package:movie/src/data/model/movie.dart';

import 'movie_db.dart';

part 'movie_dao.g.dart';

@UseDao(tables: [MovieEntity])
class MovieDao extends DatabaseAccessor<MovieDb> with _$MovieDaoMixin {
  MovieDao(MovieDb db) : super(db);

  Future insertMovie(MovieEntityData movie) =>
      into(movieEntity).insert(movie, mode: InsertMode.insertOrReplace);
  Future updateMovie(MovieEntityData movie) =>
      update(movieEntity).replace(movie);
  Future deleteMovie(MovieEntityData movie) =>
      delete(movieEntity).delete(movie);

  Future deleteAllMovie() => delete(movieEntity).go();
  Future<List<MovieEntityData>> getAllMovie() => select(movieEntity).get();
}
