import 'package:dartz/dartz.dart';

import '../../data/remote/config/failure.dart';
import '../../data/model/videos.dart';
import '../../data/remote/source/tv_show_remote_source.dart';
import '../usecase.dart';

class GetTrailerTvShowUseCase extends UseCase<List<Video>, int> {
  final TvShowRemoteSource _repository;

  GetTrailerTvShowUseCase(this._repository);

  @override
  Future<Either<Failure, List<Video>>> call(int params) async {
    return await _repository.getTrailerMovie(params);
  }
}
