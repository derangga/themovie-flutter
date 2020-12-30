import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:movie/src/data/model/detail_movie.dart';

import '../model/movie.dart';

abstract class MovieRemoteSource extends BaseRemote {
  MovieRemoteSource(Dio dio, Logger logger) : super(dio, logger);

  Future<Either<Failure, Movies>> getDiscoverMovie(int page);
  Future<Either<Failure, DetailMovie>> getDetailMovie(int movieId);
}
