import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/tv_show.dart';
import 'package:themovie_flutter/src/domain/tv_show_repository.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetSimilarTvShowUseCase implements UseCase<List<TvShow>, int> {
  final TvShowRepository _repository;

  GetSimilarTvShowUseCase(this._repository);

  @override
  Future<Either<Failure, List<TvShow>>> call(int params) async {
    return _repository.getSimilarTvShow(params);
  }
}
