import 'package:dartz/dartz.dart';

import '../../data/remote/config/failure.dart';
import '../../data/model/videos.dart';
import '../../data/remote/source/movie_remote_source.dart';
import '../usecase.dart';

class GetTrailerMovieUseCase extends UseCase<List<Video>, int> {
  final MovieRemoteSource _repository;

  GetTrailerMovieUseCase(this._repository);

  @override
  Future<Either<Failure, List<Video>>> call(int params) async {
    return await _repository.getTrailerMovie(params);
  }
}
