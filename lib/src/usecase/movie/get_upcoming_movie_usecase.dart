import 'package:dartz/dartz.dart';

import '../../data/remote/config/failure.dart';
import '../../data/model/movie.dart';
import '../../data/remote/source/movie_remote_source.dart';
import '../usecase.dart';

class GetUpcomingMovieUseCase extends UseCase<List<Movie>, int> {
  final MovieRemoteSource _repository;

  GetUpcomingMovieUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(int params) async {
    return await _repository.getUpcomingMovie(params);
  }
}
