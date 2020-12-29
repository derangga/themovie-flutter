import 'package:core/core.dart';
import '../service/movie_service.dart';
import '../model/movie.dart';
import '../model/detail_movie.dart';
import '../repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieService _service;

  MovieRepositoryImpl(this._service);

  @override
  Future<Result<DetailMovie>> getDetailMovie(int movieId) async {
    return await _service.getDetailMovie(movieId);
  }

  @override
  Future<Result<Movies>> getDiscoverMovie(int page) async {
    return await _service.getDiscoverMovie(page);
  }
}
