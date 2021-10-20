import 'package:logger/logger.dart';
import '../base/base_local.dart';
import '../local/db/genre_db.dart';
import '../model/genre.dart';

abstract class GenreMovieLocalSource extends BaseLocal{
  GenreMovieLocalSource(Logger logger) : super(logger);

  Future insertGenreMovie(GenreMovieEntityData genre);

  Future deleteGenreMovie(GenreMovieEntityData genre);

  Future deleteAllGenreMovie();

  Future<List<Genre>> getAllGenreMovie();
}