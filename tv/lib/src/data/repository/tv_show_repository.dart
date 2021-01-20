import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import '../model/videos.dart';
import '../model/detail_tv_show_content.dart';
import '../model/detail_tv_show.dart';
import '../model/tv_show.dart';
import '../model/cast_and_crew.dart';

abstract class TvShowRepository extends BaseRepository {
  TvShowRepository(Logger logger) : super(logger);

  Future<Either<Failure, List<TvShow>>> getDiscoverTvShow(int page);
  Future<Either<Failure, DetailTvShow>> getDetailTvShow(int tvShowId);
  Future<Either<Failure, List<Cast>>> getCastAndCrew(int tvShowId);
  Future<Either<Failure, List<TvShow>>> getSimilarTvShow(
      int tvShowId, int page);
  Future<Either<Failure, DetailTvShowContent>> getDetailTvShowContent(
      int tvShowId);
  Future<Either<Failure, List<Video>>> getTvShowTrailer(int tvShowId);
}
