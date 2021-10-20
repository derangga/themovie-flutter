import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import '../data/model/detail_movie_content.dart';
import '../data/config/failure.dart';
import '../data/model/movie.dart';
import 'base/base_repository.dart';

abstract class MovieRepository extends BaseRepository {
  MovieRepository(Logger logger) : super(logger);

  Future<Either<Failure, List<Movie>>> getDiscoverMovieRemote(int page);
  Future<Either<Failure, DetailMovieContent>> getDetailMovieRemote(int movieId);
}
