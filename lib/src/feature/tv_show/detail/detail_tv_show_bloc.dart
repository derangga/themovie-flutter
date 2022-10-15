import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/data/local/tv_show_local_source.dart';
import '../../../core/base/api_state.dart';
import '../../../data/model/detail_tv_show_content.dart';
import '../../../data/model/tv_show.dart';
import '../../../data/remote/source/tv_show_remote_source.dart';
import '../../../navigation/tv_show/tv_show_navigation.dart';
import '../../../usecase/tv_show/get_detail_tv_show_usecase.dart';

part 'detail_tv_show_state.dart';

class DetailTvShowBloc extends Cubit<DetailTvShowState> {
  final TvShowRemoteSource _remoteSouce;
  final TvShowNavigation _navigation;
  final TvShowLocalSource _localSource;
  DetailTvShowBloc(
    this._remoteSouce,
    this._navigation,
    this._localSource,
  ) : super(DetailTvShowState());

  Future<void> fetchDetailTvShow(int tvShowId) async {
    emit(state.copyWith(apiState: ApiState.LOADING));

    final result = await _getDetailTvShow(tvShowId);

    await result.fold((failure) {
      emit(state.copyWith(
        apiState: ApiState.FAILED,
        errorMessage: '${failure.message}',
      ));
    }, (response) async {
      final isAlreadyFavorite = await _localSource.isAlreadyFavorite(
        response.detailTvShow.id,
      );
      emit(state.copyWith(
          isMovieFavorite: isAlreadyFavorite,
          content: response,
          apiState: ApiState.SUCCESS));
    });
  }

  void goToTrailerTvShow(BuildContext context, int tvShowId) {
    _navigation.goToTrailerTvShow(context, tvShowId);
  }

  void goToDetailTvShow(BuildContext context, int tvShowId) {
    _navigation.goToDetailTvShow(context, tvShowId);
  }

  Future<void> addOrRemoveMovieToFavorite() async {
    final detailTvShow = state.content?.detailTvShow;
    if (detailTvShow != null) {
      final tvShow = TvShow(
        backdropPath: detailTvShow.backdropPath,
        id: detailTvShow.id,
        originalLanguage: detailTvShow.originalLanguage,
        overview: detailTvShow.overview,
        posterPath: detailTvShow.posterPath,
        firstAirDate: detailTvShow.firstAirDate,
        name: detailTvShow.name,
        voteAverage: '${detailTvShow.voteAverage}',
        voteCount: detailTvShow.voteCount,
        originalName: detailTvShow.originalName,
      );
      if (!state.isAlreadyFavorite) {
        await _localSource.insertTvShow(tvShow);
        emit(state.copyWith(isMovieFavorite: true));
      } else {
        await _localSource.deleteTvShow(tvShow);
        emit(state.copyWith(isMovieFavorite: false));
      }
    }
  }

  GetDetailTvShowUseCase get _getDetailTvShow =>
      GetDetailTvShowUseCase(_remoteSouce);
}
