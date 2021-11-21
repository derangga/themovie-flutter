import '../local/db/genre_db.dart';
import '../model/genre.dart';

abstract class GenreMovieLocalSource {
  Future insertGenreMovie(GenreMovieEntityData genre);

  Future deleteGenreMovie(GenreMovieEntityData genre);

  Future deleteAllGenreMovie();

  Future<List<Genre>> getAllGenreMovie();
}
