import 'package:dartz/dartz.dart';
import '../data/config/failure.dart';
import '../data/model/videos.dart';
import '../data/model/cast_and_crew.dart';
import '../data/model/detail_tv_show.dart';
import '../data/remote/tv_show_remote_source.dart';
import '../data/model/tv_show.dart';
import 'tv_show_repository.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  final TvShowRemoteSource _remoteSource;

  TvShowRepositoryImpl(this._remoteSource);

  @override
  Future<Either<Failure, List<TvShow>>> getDiscoverTvShow(int page) async {
    return await _remoteSource.getDiscoverTvShow(page);
  }

  @override
  Future<Either<Failure, List<Cast>>> getCastAndCrew(int tvShowId) async {
    return await _remoteSource.getCastAndCrew(tvShowId);
  }

  @override
  Future<Either<Failure, DetailTvShow>> getTvShowById(int tvShowId) async {
    return await _remoteSource.getTvShowById(tvShowId);
  }

  @override
  Future<Either<Failure, List<TvShow>>> getSimilarTvShow(int tvShowId) async {
    return await _remoteSource.getSimilarTvShow(tvShowId);
  }

  @override
  Future<Either<Failure, List<Video>>> getTvShowTrailer(int tvShowId) async {
    return await _remoteSource.getTvShowTrailer(tvShowId);
  }
}
