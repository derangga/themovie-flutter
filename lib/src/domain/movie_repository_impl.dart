import 'package:dartz/dartz.dart';
import '../logger/app_logger.dart';
import '../data/model/detail_movie_content.dart';
import '../data/config/failure.dart';
import '../data/remote/movie_remote_source.dart';
import '../data/model/movie.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteSource? _remoteSource;

  MovieRepositoryImpl(AppLogger logger, this._remoteSource) : super(logger);

  @override
  Future<Either<Failure?, DetailMovieContent>> getDetailMovieRemote(
      int? movieId) async {
    final detailMovie = await _remoteSource!.getDetailMovie(movieId);
    final casts = await _remoteSource!.getCastAndCrew(movieId);
    final similarMovie = await _remoteSource!.getSimilarMovie(movieId);
    final detailContent = DetailMovieContent();
    Failure? failedGetContent;

    detailMovie.fold((failure) {
      failure.message = 'Failed get detail tv show';
      failedGetContent = failure;
    }, (success) {
      detailContent.detailMovie = success;
    });

    casts.fold((failure) {
      failure.message = 'Failed get casts and crew tv show';
      failedGetContent = failure;
    }, (success) {
      detailContent.castsMovie = success;
    });

    similarMovie.fold((failure) {
      failure.message = 'Failed get similar tv show';
      failedGetContent = failure;
    }, (success) {
      detailContent.similarMOvie = success;
    });

    if (failedGetContent == null) {
      return Right(detailContent);
    } else {
      return Left(failedGetContent);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getDiscoverMovieRemote(int page) async {
    return await _remoteSource!.getDiscoverMovie(page);
  }
}
