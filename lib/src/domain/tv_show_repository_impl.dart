import 'package:dartz/dartz.dart';
import '../data/config/failure.dart';
import '../data/model/videos.dart';
import '../data/model/cast_and_crew.dart';
import '../data/model/detail_tv_show.dart';
import '../data/model/detail_tv_show_content.dart';
import '../data/remote/tv_show_remote_source.dart';
import '../data/model/tv_show.dart';
import 'tv_show_repository.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  final TvShowRemoteSource? _remoteSource;

  TvShowRepositoryImpl(this._remoteSource);

  @override
  Future<Either<Failure, List<TvShow>>> getDiscoverTvShow(int page) async {
    return await _remoteSource!.getDiscoverTvShow(page);
  }

  @override
  Future<Either<Failure, List<Cast>>> getCastAndCrew(int? tvShowId) async {
    return await _remoteSource!.getCastAndCrew(tvShowId);
  }

  @override
  Future<Either<Failure, DetailTvShow>> getDetailTvShow(int? tvShowId) async {
    return await _remoteSource!.getDetailTvShow(tvShowId);
  }

  @override
  Future<Either<Failure, List<TvShow>>> getSimilarTvShow(
      int? tvShowId, int page) async {
    return await _remoteSource!.getSimilarTvShow(tvShowId, page);
  }

  @override
  Future<Either<Failure?, DetailTvShowContent>> getDetailTvShowContent(
      int? tvShowId) async {
    var detailDef = getDetailTvShow(tvShowId);
    var castsDef = getCastAndCrew(tvShowId);
    var similarDef = getSimilarTvShow(tvShowId, 1);

    final detail = await detailDef;
    final casts = await castsDef;
    final similar = await similarDef;
    final detailContent = DetailTvShowContent();
    Failure? failedGetContent;

    detail.fold((failure) {
      failure.message = 'Failed get detail tv show';
      failedGetContent = failure;
    }, (success) {
      detailContent.detailTvShow = success;
    });

    casts.fold((failure) {
      failure.message = 'Failed get casts and crew tv show';
      failedGetContent = failure;
    }, (success) {
      detailContent.castsTvShow = success;
    });
    similar.fold((failure) {
      failure.message = 'Failed get similar tv show';
      failedGetContent = failure;
    }, (success) {
      detailContent.similarTvShow = success;
    });

    if (failedGetContent == null) {
      return Right(detailContent);
    } else
      return Left(failedGetContent);
  }

  @override
  Future<Either<Failure, List<Video>>> getTvShowTrailer(int tvShowId) async {
    return await _remoteSource!.getTvShowTrailer(tvShowId);
  }
}
