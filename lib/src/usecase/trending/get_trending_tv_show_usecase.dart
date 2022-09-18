import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/tv_show.dart';
import 'package:themovie_flutter/src/data/remote/trending_remote_source.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetTrendingTvShowUseCase extends UseCase<List<TvShow>, NoParams> {
  final TrendingRemoteSource _remoteSouce;

  GetTrendingTvShowUseCase(this._remoteSouce);

  @override
  Future<Either<Failure, List<TvShow>>> call(NoParams params) async {
    return await _remoteSouce.getTrendingTv();
  }
}
