import 'package:dartz/dartz.dart';

import '../../data/config/failure.dart';
import '../../data/model/tv_show.dart';
import '../../data/remote/tv_show_remote_source.dart';
import '../usecase.dart';

class GetSimilarTvShowUseCase implements UseCase<List<TvShow>, int> {
  final TvShowRemoteSource _repository;

  GetSimilarTvShowUseCase(this._repository);

  @override
  Future<Either<Failure, List<TvShow>>> call(int params) async {
    return _repository.getSimilarTvShow(params);
  }
}
