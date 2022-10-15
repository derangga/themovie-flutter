import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/remote/config/failure.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/data/model/tv_show.dart';

abstract class TrendingRemoteSource {
  Future<Either<Failure, List<Movie>>> getTrendingMovie();
  Future<Either<Failure, List<TvShow>>> getTrendingTv();
}
