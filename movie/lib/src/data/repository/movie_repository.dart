import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../model/movie.dart';
import '../model/detail_movie.dart';

abstract class MovieRepository extends BaseRepository {
  MovieRepository(Logger logger) : super(logger);

  Future<Either<Failure, PagingModel<List<Movie>>>> getDiscoverMovieRemote(
      int page);
  Future<Either<Failure, DetailMovie>> getDetailMovieRemote(int movieId);
  Future insertDiscoverMoviesLocal(List<Movie> movies);
  Future replaceAllDiscoverMovieLocal(List<Movie> movies);
  Future<List<Movie>> getDiscoverMoveLocal();
}
