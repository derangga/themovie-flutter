import '../model/movie.dart';

abstract class MovieLocalSource {
  Future<int> insertMovie(Movie movie);

  Future<int> deleteMovie(Movie movie);

  Future<int> deleteAllMovie();

  Future<List<Movie>> getAllMovie();

  Future<Movie?> getMovieFavoriteById(int movieId);

  Future<bool> isAlreadyFavorite(int movieId);
}
