import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:themovie_flutter/src/data/model/detail_tv_show.dart';
import 'package:themovie_flutter/src/domain/tv_show_repository.dart';

class GetTvShowByIdUseCase {
  final TvShowRepository _repository;

  GetTvShowByIdUseCase(this._repository);

  Future<Either<Failure, DetailTvShow>> call(int tvShowId) async {
    return await _repository.getTvShowById(tvShowId);
  }
}
