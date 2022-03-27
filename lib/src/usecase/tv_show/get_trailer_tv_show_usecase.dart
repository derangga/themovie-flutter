import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/videos.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

import '../../domain/tv_show_repository.dart';

class GetTrailerTvShowUseCase extends UseCase<List<Video>, int> {
  final TvShowRepository _repository;

  GetTrailerTvShowUseCase(this._repository);

  @override
  Future<Either<Failure, List<Video>>> call(int params) async {
    return await _repository.getTrailerMovie(params);
  }
}
