import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:themovie_flutter/src/data/model/detail_movie.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetMovieByIdUseCase implements UseCase<DetailMovie, int> {
  final MovieRepository _repository;

  GetMovieByIdUseCase(this._repository);

  @override
  Future<Either<Failure, DetailMovie>> call(int params) async {
    return await _repository.getMovieById(params);
  }
}
