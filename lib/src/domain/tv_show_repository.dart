import 'package:dartz/dartz.dart';
import '../logger/app_logger.dart';
import '../data/config/failure.dart';
import '../data/model/tv_show.dart';
import '../data/model/detail_tv_show.dart';
import '../data/model/cast_and_crew.dart';
import '../data/model/detail_tv_show_content.dart';
import '../data/model/videos.dart';
import 'base/base_repository.dart';

abstract class TvShowRepository extends BaseRepository {
  TvShowRepository(AppLogger logger) : super(logger);

  Future<Either<Failure, List<TvShow>>> getDiscoverTvShow(int page);
  Future<Either<Failure, DetailTvShow>> getDetailTvShow(int tvShowId);
  Future<Either<Failure, List<Cast>>> getCastAndCrew(int tvShowId);
  Future<Either<Failure, List<TvShow>>> getSimilarTvShow(
      int tvShowId, int page);
  Future<Either<Failure?, DetailTvShowContent>> getDetailTvShowContent(
      int? tvShowId);
  Future<Either<Failure, List<Video>>> getTvShowTrailer(int tvShowId);
}
