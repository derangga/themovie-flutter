import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/detail_tv_show_content.dart';
import 'package:themovie_flutter/src/domain/tv_show_repository.dart';
import 'package:themovie_flutter/src/usecase/tv_show/get_cast_and_crew_tv_show_usecase.dart';
import 'package:themovie_flutter/src/usecase/tv_show/get_similar_tv_show_uasecase.dart';
import 'package:themovie_flutter/src/usecase/tv_show/get_tv_show_by_id_usecase.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class GetDetailTvShowUseCase implements UseCase<DetailTvShowContent, int> {
  final TvShowRepository _repository;

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
