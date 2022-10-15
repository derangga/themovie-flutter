import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/data/local/tv_show_local_source.dart';
import '../../../core/base/base_bloc.dart';
import '../../../core/base/base_event_state.dart';
import '../../../data/model/detail_tv_show.dart';
import '../../../data/model/detail_tv_show_content.dart';
import '../../../data/model/tv_show.dart';
import '../../../data/remote/tv_show_remote_source.dart';
import '../../../navigation/tv_show/tv_show_navigation.dart';
import '../../../usecase/tv_show/get_detail_tv_show_usecase.dart';

part 'detail_tv_show_event_state.dart';

class DetailTvShowBloc extends BaseBloc<DetailTvShowEvent, DetailTvShowState> {
  final TvShowRemoteSource _remoteSouce;
  final TvShowNavigation _navigation;
  final TvShowLocalSource _localSource;
  DetailTvShowBloc(
    this._remoteSouce,
    this._navigation,
    this._localSource,
  ) : super(DetailTvShowState()) {
    on<DetailTvShowEvent>(_mapEventToAction);
  }

  Future<void> _mapEventToAction(
    DetailTvShowEvent event,
    Emitter<DetailTvShowState> emit,
  ) async {
    if (event is GetDetailTvShowEvent) {
      await _fetchDetailTvShow(emit, event.tvShowId);
    } else if (event is AddOrRemoveFavoriteEvent) {
      final detailMovie = state.content?.detailTvShow;
      if (detailMovie != null) {
        await _addOrRemoveMovieToFavorite(
          emit,
          detailMovie,
          state.isAlreadyFavorite,
        );
      }
    }
  }

  Future<void> _fetchDetailTvShow(
    Emitter<DetailTvShowState> emit,
    int tvShowId,
  ) async {
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

  Future<void> _addOrRemoveMovieToFavorite(
    Emitter<DetailTvShowState> emit,
    DetailTvShow detailTvShow,
    bool isAlreadyFavorite,
  ) async {
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
        originalName: detailTvShow.originalLanguage);
    if (!isAlreadyFavorite) {
      await _localSource.insertTvShow(tvShow);
      emit(state.copyWith(isMovieFavorite: true));
    } else {
      await _localSource.deleteTvShow(tvShow);
      emit(state.copyWith(isMovieFavorite: false));
    }
  }

  GetDetailTvShowUseCase get _getDetailTvShow =>
      GetDetailTvShowUseCase(_remoteSouce);
}
