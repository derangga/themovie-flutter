import 'package:dartz/dartz.dart';

import '../../data/config/failure.dart';
import '../../data/model/detail_movie.dart';
import '../../data/remote/movie_remote_source.dart';
import '../usecase.dart';

class GetMovieByIdUseCase implements UseCase<DetailMovie, int> {
  final MovieRemoteSource _repository;

  GetMovieByIdUseCase(this._repository);

  @override
  Future<Either<Failure, DetailMovie>> call(int params) async {
    return await _repository.getMovieById(params);
  }
}
