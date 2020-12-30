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

  MovieRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<Either<Failure, DetailMovie>> getDetailMovie(int movieId) async {
    return await _remoteSource.getDetailMovie(movieId);
  }

  @override
  Future<Either<Failure, Movies>> getDiscoverMovie(int page) async {
    return await _remoteSource.getDiscoverMovie(page);
  }

  @override
  Future insertMovie(List<Movie> movies) async {
    for (Movie movie in movies) {
      await _localSource.insertMovie(movie.toEntity());
    }
  }

  @override
  Future<List<Movie>> getMoveLocalSource() async {
    return await _localSource.getAllMovie();
  }

  @override
  Future replaceAllMovieData(List<Movie> movies) async {
    _localSource.deleteAllMovie();
    await insertMovie(movies);
  }
}
