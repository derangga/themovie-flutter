import 'package:moor_flutter/moor_flutter.dart';
import '../../model/genre.dart';
import 'genre_db.dart';

part 'genre_dao.g.dart';

@UseDao(tables: [GenreMovieEntity])
class GenreDao extends DatabaseAccessor<GenreDb> with _$GenreDaoMixin {
  GenreDao(GenreDb db) : super(db);

  Future insertGenreMovie(GenreMovieEntityData genre) =>
      into(genreMovieEntity).insert(genre, mode: InsertMode.insertOrReplace);
  Future updateGenreMovie(GenreMovieEntityData genre) =>
      update(genreMovieEntity).replace(genre);
  Future deleteGenreMovie(GenreMovieEntityData genre) =>
      delete(genreMovieEntity).delete(genre);

  Future deleteAllGenreMovie() => delete(genreMovieEntity).go();
  Future<List<GenreMovieEntityData>> getAllGenreMovie() =>
      select(genreMovieEntity).get();
}
