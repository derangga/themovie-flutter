import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/cast_and_crew.dart';
import 'package:themovie_flutter/src/domain/tv_show_repository.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetCastAndCrewTvShowUseCase implements UseCase<List<Cast>, int> {
  final TvShowRepository _repository;

  GetCastAndCrewTvShowUseCase(this._repository);

  @override
  Future<Either<Failure, List<Cast>>> call(int params) async {
    return _repository.getCastAndCrew(params);
  }
}
