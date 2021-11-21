import 'package:dartz/dartz.dart';
import '../data/model/detail_movie_content.dart';
import '../data/config/failure.dart';
import '../data/model/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getDiscoverMovieRemote(int page);
  Future<Either<Failure?, DetailMovieContent>> getDetailMovieRemote(
      int? movieId);
}
