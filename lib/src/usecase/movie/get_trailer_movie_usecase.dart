import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/videos.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

import '../../domain/movie_repository.dart';

class GetTrailerMovieUseCase extends UseCase<List<Video>, int> {
  final MovieRepository _repository;

  GetTrailerMovieUseCase(this._repository);

  @override
  Future<Either<Failure, List<Video>>> call(int params) async {
    return await _repository.getTrailerMovie(params);
  }
}
