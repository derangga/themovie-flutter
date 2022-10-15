import 'package:dartz/dartz.dart';

import '../../data/model/movie.dart';
import '../../data/remote/config/failure.dart';
import '../../data/remote/source/trending_remote_source.dart';
import '../usecase.dart';

class GetTrendingMovieUseCase extends UseCase<List<Movie>, NoParams> {
  final TrendingRemoteSource _remoteSource;

  GetTrendingMovieUseCase(this._remoteSource);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await _remoteSource.getTrendingMovie();
  }
}
