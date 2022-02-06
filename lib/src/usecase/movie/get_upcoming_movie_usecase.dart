import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetUpcomingMovieUseCase extends UseCase<List<Movie>, NoParams> {
  final MovieRepository _repository;

  GetUpcomingMovieUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await _repository.getUpcomingMovie();
  }
}
