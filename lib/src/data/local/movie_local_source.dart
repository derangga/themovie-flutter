import '../model/movie.dart';
import 'db/movie_db.dart';

abstract class MovieLocalSource {
  Future insertMovie(MovieEntityData movie);

  Future deleteMovie(MovieEntityData movie);

  Future deleteAllMovie();

  Future<List<Movie>> getAllMovie();
}
