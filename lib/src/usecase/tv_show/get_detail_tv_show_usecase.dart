import 'package:dartz/dartz.dart';

import '../../data/config/failure.dart';
import '../../data/model/detail_tv_show_content.dart';
import '../../data/remote/tv_show_remote_source.dart';
import '../usecase.dart';
import 'get_cast_and_crew_tv_show_usecase.dart';
import 'get_similar_tv_show_uasecase.dart';
import 'get_tv_show_by_id_usecase.dart';

class GetDetailTvShowUseCase implements UseCase<DetailTvShowContent, int> {
  final TvShowRemoteSource _repository;

  GetDetailTvShowUseCase(this._repository);

  @override
  Future<Either<Failure, DetailTvShowContent>> call(int params) async {
    final tvShowById = await _getTvShowById(params);
    final castAndCrew = await _getCastAndCrewTvShow(params);
    final similarTvShow = await _getSimilarTvShow(params);

    final detailContent = DetailTvShowContent();
    Failure failedGetContent = Failure();

    tvShowById.fold((failure) {
      failure.message = 'Failed get detail tv show';
      failedGetContent = failure;
    }, (success) {
      detailContent.detailTvShow = success;
    });

    castAndCrew.fold((failure) {
      failure.message = 'Failed get casts and crew tv show';
      failedGetContent = failure;
    }, (success) {
      detailContent.castsTvShow = success;
    });
    similarTvShow.fold((failure) {
      failure.message = 'Failed get similar tv show';
      failedGetContent = failure;
    }, (success) {
      detailContent.similarTvShow = success;
    });

    if (failedGetContent.dioError == null) {
      return Right(detailContent);
    } else
      return Left(failedGetContent);
  }

  GetTvShowByIdUseCase get _getTvShowById => GetTvShowByIdUseCase(_repository);

  GetCastAndCrewTvShowUseCase get _getCastAndCrewTvShow =>
      GetCastAndCrewTvShowUseCase(_repository);

  GetSimilarTvShowUseCase get _getSimilarTvShow =>
      GetSimilarTvShowUseCase(_repository);
}
