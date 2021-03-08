import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tv/src/data/model/videos.dart';
import '../model/cast_and_crew.dart';
import '../model/detail_tv_show.dart';
import '../model/tv_show.dart';

abstract class TvShowRemoteSource extends BaseRemote {
  TvShowRemoteSource(Dio dio, Logger logger) : super(dio, logger);

  Future<Either<Failure, List<TvShow>>> getDiscoverTvShow(int page);
  Future<Either<Failure, DetailTvShow>> getDetailTvShow(int tvShowId);
  Future<Either<Failure, List<Cast>>> getCastAndCrew(int tvShowId);
  Future<Either<Failure, List<TvShow>>> getSimilarTvShow(
      int tvShowId, int page);
  Future<Either<Failure, List<Video>>> getTvShowTrailer(int tvShowId);
}
