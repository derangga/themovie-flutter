import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/genre.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetGenreMovieUsecase implements UseCase<List<Genre>, NoParams> {
  final MovieRepository _repository;

  GetGenreMovieUsecase(this._repository);

  @override
  Future<Either<Failure, List<Genre>>> call(NoParams params) async {
    return await _repository.getGenreMovie();
  }
}
