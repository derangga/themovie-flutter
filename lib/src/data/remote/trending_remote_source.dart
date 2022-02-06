import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:themovie_flutter/src/data/base/base_remote.dart';
import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/data/model/tv_show.dart';

abstract class TrendingRemoteSouce extends BaseRemote {
  TrendingRemoteSouce(Dio dio) : super(dio);

  Future<Either<Failure, List<Movie>>> getTrendingMovie();
  Future<Either<Failure, List<TvShow>>> getTrendingTv();
}
