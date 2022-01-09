import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/detail_movie_content.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/usecase/movie/get_cast_and_crew_movie_usecase.dart';
import 'package:themovie_flutter/src/usecase/movie/get_movie_by_id_usecase.dart';
import 'package:themovie_flutter/src/usecase/movie/get_similar_movie_usecase.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';
import 'package:themovie_flutter/src/utils/date_helper.dart';

class GetDetailMovieUseCase implements UseCase<DetailMovieContent, int> {
  final MovieRepository _repository;

  GetDetailMovieUseCase(this._repository);

  @override
  Future<Either<Failure, DetailMovieContent>> call(int params) async {
    final movieById = await _getMovieById(params);
    final castAndCrew = await _getCastAndCrew(params);
    final similarMovies = await _getSimilarMovies(params);

    final detailContent = DetailMovieContent();
    Failure failedGetContent = Failure();

    movieById.fold((failure) {
      failure.message = 'Failed get detail movie';
      failedGetContent = failure;
    }, (success) {
      success.releaseDate = DateHelper.formatConverter(
        success.releaseDate,
        DateHelper.FORMAT_YYYY_MM_DD,
        DateHelper.FORMAT_DD_MMM_COMMA_YYYY,
      );
      detailContent.detailMovie = success;
    });

    castAndCrew.fold((failure) {
      failure.message = 'Failed get casts and crew movie';
      failedGetContent = failure;
    }, (success) {
      detailContent.castsMovie = success;
    });

    similarMovies.fold((failure) {
      failure.message = 'Failed get similar movie';
      failedGetContent = failure;
    }, (success) {
      detailContent.similarMOvie = success;
    });

    if (failedGetContent.dioError == null) {
      return Right(detailContent);
    } else {
      return Left(failedGetContent);
    }
  }

  GetMovieByIdUseCase get _getMovieById => GetMovieByIdUseCase(_repository);

  GetCastAndCrewMovieUseCase get _getCastAndCrew =>
      GetCastAndCrewMovieUseCase(_repository);

  GetSimilarMovieUseCase get _getSimilarMovies =>
      GetSimilarMovieUseCase(_repository);
}
