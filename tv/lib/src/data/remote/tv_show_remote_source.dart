import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import '../model/detail_tv_show.dart';
import '../model/tv_show.dart';

abstract class TvShowRemoteSource extends BaseRemote {
  TvShowRemoteSource(Dio dio, Logger logger) : super(dio, logger);

  Future<Either<Failure, PagingModel<List<TvShow>>>> getDiscoverTvShow(
      int page);

  Future<Either<Failure, DetailTvShow>> getDetailTvShow(int tvShowId);
}
