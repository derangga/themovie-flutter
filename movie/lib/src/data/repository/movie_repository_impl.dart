import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:movie/src/data/local/movie_local_source.dart';
import '../remote/movie_remote_source.dart';
import '../model/movie.dart';
import '../mapper/movie_mapper.dart';
import '../model/detail_movie.dart';
import '../repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteSource _remoteSource;
  final MovieLocalSource _localSource;

  MovieRepositoryImpl(Logger logger, this._remoteSource, this._localSource)
      : super(null);

  @override
  Future<Either<Failure, DetailMovie>> getDetailMovieRemote(int movieId) async {
    return await _remoteSource.getDetailMovie(movieId);
  }

  @override
  Future<Either<Failure, Movies>> getDiscoverMovieRemote(int page) async {
    return await _remoteSource.getDiscoverMovie(page);
  }

  @override
  Future insertDiscoverMoviesLocal(List<Movie> movies) async {
    for (Movie movie in movies) {
      await _localSource.insertMovie(movie.toEntity());
    }
  }

  @override
  Future<List<Movie>> getDiscoverMoveLocal() async {
    return await _localSource.getAllMovie();
  }

  @override
  Future replaceAllDiscoverMovieLocal(List<Movie> movies) async {
    await _localSource.deleteAllMovie();
    await insertDiscoverMoviesLocal(movies);
  }
}
