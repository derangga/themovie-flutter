import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import '../service/movie_remote_source.dart';
import '../model/movie.dart';
import '../model/detail_movie.dart';
import '../repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteSource _service;

  MovieRepositoryImpl(this._service);

  @override
  Future<Either<Failure, DetailMovie>> getDetailMovie(int movieId) async {
    return await _service.getDetailMovie(movieId);
  }

  @override
  Future<Either<Failure, Movies>> getDiscoverMovie(int page) async {
    return await _service.getDiscoverMovie(page);
  }
}
