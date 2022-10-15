import 'package:dartz/dartz.dart';

import '../../data/remote/config/failure.dart';
import '../../data/model/cast_and_crew.dart';
import '../../data/remote/source/tv_show_remote_source.dart';
import '../usecase.dart';

class GetCastAndCrewTvShowUseCase implements UseCase<List<Cast>, int> {
  final TvShowRemoteSource _repository;

  GetCastAndCrewTvShowUseCase(this._repository);

  @override
  Future<Either<Failure, List<Cast>>> call(int params) async {
    return _repository.getCastAndCrew(params);
  }
}
