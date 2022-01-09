import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:themovie_flutter/src/data/model/tv_show.dart';
import 'package:themovie_flutter/src/domain/tv_show_repository.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetDiscoverTvShowsUseCase implements UseCase<List<TvShow>, int> {
  final TvShowRepository _repository;

  GetDiscoverTvShowsUseCase(this._repository);

  @override
  Future<Either<Failure, List<TvShow>>> call(int params) async {
    return await _repository.getDiscoverTvShow(params);
  }
}
