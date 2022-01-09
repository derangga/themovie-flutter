import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetDiscoverMovies implements UseCase<List<Movie>, int> {
  final MovieRepository _repository;

  GetDiscoverMovies(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(int params) async {
    return await _repository.getDiscoverMovie(params);
  }
}
