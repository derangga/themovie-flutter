import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/data/remote/trending_remote_source.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetTrendingMovieUseCase extends UseCase<List<Movie>, NoParams> {
  final TrendingRemoteSource _remoteSource;

  GetTrendingMovieUseCase(this._remoteSource);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await _remoteSource.getTrendingMovie();
  }
}
