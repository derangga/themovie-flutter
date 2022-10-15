import 'package:dartz/dartz.dart';

import '../../data/model/tv_show.dart';
import '../../data/remote/config/failure.dart';
import '../../data/remote/source/trending_remote_source.dart';
import '../usecase.dart';

class GetTrendingTvShowUseCase extends UseCase<List<TvShow>, NoParams> {
  final TrendingRemoteSource _remoteSouce;

  GetTrendingTvShowUseCase(this._remoteSouce);

  @override
  Future<Either<Failure, List<TvShow>>> call(NoParams params) async {
    return await _remoteSouce.getTrendingTv();
  }
}
