import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import '../model/tv_show.dart';

abstract class TvShowRepository extends BaseRepository {
  TvShowRepository(Logger logger) : super(logger);

  Future<Either<Failure, PagingModel<List<TvShow>>>> getDiscoverTvShow(
      int page);
}
