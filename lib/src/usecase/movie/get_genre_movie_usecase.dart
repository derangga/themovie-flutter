import 'package:dartz/dartz.dart';

import '../../data/remote/config/failure.dart';
import '../../data/model/genre.dart';
import '../../data/remote/source/movie_remote_source.dart';
import '../usecase.dart';

class GetGenreMovieUsecase implements UseCase<List<Genre>, NoParams> {
  final MovieRemoteSource _repository;

  GetGenreMovieUsecase(this._repository);

  @override
  Future<Either<Failure, List<Genre>>> call(NoParams params) async {
    return await _repository.getGenreMovie();
  }
}
