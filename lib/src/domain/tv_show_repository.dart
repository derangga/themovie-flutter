import 'package:dartz/dartz.dart';
import '../data/config/failure.dart';
import '../data/model/tv_show.dart';
import '../data/model/detail_tv_show.dart';
import '../data/model/cast_and_crew.dart';
import '../data/model/videos.dart';

abstract class TvShowRepository {
  Future<Either<Failure, List<TvShow>>> getDiscoverTvShow(int page);

  Future<Either<Failure, DetailTvShow>> getTvShowById(int tvShowId);

  Future<Either<Failure, List<Cast>>> getCastAndCrew(int tvShowId);

  Future<Either<Failure, List<TvShow>>> getSimilarTvShow(int tvShowId);

  Future<Either<Failure, List<Video>>> getTvShowTrailer(int tvShowId);

  Future<Either<Failure, List<Video>>> getTrailerMovie(int tvShowId);
}
