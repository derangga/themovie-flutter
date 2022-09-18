import 'package:dartz/dartz.dart';
import '../../data/config/failure.dart';
import '../../data/model/detail_tv_show.dart';
import '../../data/remote/tv_show_remote_source.dart';

class GetTvShowByIdUseCase {
  final TvShowRemoteSource _repository;

  GetTvShowByIdUseCase(this._repository);

  Future<Either<Failure, DetailTvShow>> call(int tvShowId) async {
    return await _repository.getTvShowById(tvShowId);
  }
}
