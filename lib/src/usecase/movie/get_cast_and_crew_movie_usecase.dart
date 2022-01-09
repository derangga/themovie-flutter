import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/cast_and_crew.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetCastAndCrewMovieUseCase implements UseCase<List<Cast>, int> {
  final MovieRepository _repository;

  GetCastAndCrewMovieUseCase(this._repository);

  @override
  Future<Either<Failure, List<Cast>>> call(int params) async {
    return await _repository.getCastAndCrew(params);
  }
}
