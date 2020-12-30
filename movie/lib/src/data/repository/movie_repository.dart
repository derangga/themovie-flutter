import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../model/movie.dart';
import '../model/detail_movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movies>> getDiscoverMovie(int page);
  Future<Either<Failure, DetailMovie>> getDetailMovie(int movieId);
  Future insertMovie(List<Movie> movies);
  Future replaceAllMovieData(List<Movie> movies);
  Future<List<Movie>> getMoveLocalSource();
}
