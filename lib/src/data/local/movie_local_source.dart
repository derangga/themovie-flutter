import 'package:logger/logger.dart';
import '../base/base_local.dart';
import '../model/movie.dart';
import 'db/movie_db.dart';

abstract class MovieLocalSource extends BaseLocal {
  MovieLocalSource(Logger logger) : super(logger);

  Future insertMovie(MovieEntityData movie);

  Future deleteMovie(MovieEntityData movie);

  Future deleteAllMovie();

  Future<List<Movie>> getAllMovie();
}
