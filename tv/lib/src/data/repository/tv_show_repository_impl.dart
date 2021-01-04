import 'package:core/core.dart';
import 'package:logger/logger.dart';
import 'package:dartz/dartz.dart';
import '../remote/tv_show_remote_source.dart';
import '../repository/tv_show_repository.dart';
import '../model/tv_show.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  final TvShowRemoteSource _remoteSource;

  TvShowRepositoryImpl(Logger logger, this._remoteSource) : super(logger);

  @override
  Future<Either<Failure, PagingModel<List<TvShow>>>> getDiscoverTvShow(
      int page) async {
    return await _remoteSource.getDiscoverTvShow(page);
  }
}
