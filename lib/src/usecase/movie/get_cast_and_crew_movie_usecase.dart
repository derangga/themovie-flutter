import 'package:dartz/dartz.dart';

import '../../data/remote/config/failure.dart';
import '../../data/model/cast_and_crew.dart';
import '../../data/remote/source/movie_remote_source.dart';
import '../usecase.dart';

class GetCastAndCrewMovieUseCase implements UseCase<List<Cast>, int> {
  final MovieRemoteSource _repository;

  GetCastAndCrewMovieUseCase(this._repository);

  @override
  Future<Either<Failure, List<Cast>>> call(int params) async {
    return await _repository.getCastAndCrew(params);
  }
}
