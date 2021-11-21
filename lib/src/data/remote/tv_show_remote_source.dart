import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../base/base_remote.dart';
import '../config/failure.dart';
import '../model/cast_and_crew.dart';
import '../model/detail_tv_show.dart';
import '../model/tv_show.dart';
import '../model/videos.dart';

abstract class TvShowRemoteSource extends BaseRemote {
  TvShowRemoteSource(Dio dio) : super(dio);

  Future<Either<Failure, List<TvShow>>> getDiscoverTvShow(int page);
  Future<Either<Failure, DetailTvShow>> getDetailTvShow(int? tvShowId);
  Future<Either<Failure, List<Cast>>> getCastAndCrew(int? tvShowId);
  Future<Either<Failure, List<TvShow>>> getSimilarTvShow(
      int? tvShowId, int page);
  Future<Either<Failure, List<Video>>> getTvShowTrailer(int tvShowId);
}
