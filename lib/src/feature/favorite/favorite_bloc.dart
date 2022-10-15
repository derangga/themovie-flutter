import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/movie_local_source.dart';
import '../../data/local/tv_show_local_source.dart';
import '../../data/model/movie.dart';
import '../../data/model/tv_show.dart';
import '../../navigation/movie/movie_navigation.dart';
import '../../navigation/tv_show/tv_show_navigation.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Cubit<FavoriteState> {
  final MovieLocalSource _movieLocalSource;
  final TvShowLocalSource _tvShowLocalSource;
  final MovieNavigation _movieNavigation;
  final TvShowNavigation _tvShowNavigation;
  FavoriteBloc(
    this._movieLocalSource,
    this._tvShowLocalSource,
    this._movieNavigation,
    this._tvShowNavigation,
  ) : super(FavoriteState());

  Future<void> getMovieFavorite() async {
    final movies = await _movieLocalSource.getAllMovie();
    emit(
      state.copyWith(
          movies: movies,
          favoriteType: FavoriteType.MOVIE,
          showBotomSheet: false),
    );
  }

  Future<void> getTvShowFavorite() async {
    final tvShows = await _tvShowLocalSource.getAllMovie();
    emit(
      state.copyWith(
          tvShows: tvShows,
          favoriteType: FavoriteType.TVSHOW,
          showBotomSheet: false),
    );
  }

  void showFilterFavoriteBottomSheet() {
    emit(state.copyWith(showBotomSheet: true));
  }

  Future<void> goToDetailMovie(BuildContext context, int movieId) async {
    await _movieNavigation.goToDetailMovie(context, movieId);
    await getMovieFavorite();
  }

  Future<void> goToDetailTvShow(BuildContext context, int tvShowId) async {
    await _tvShowNavigation.goToDetailTvShow(context, tvShowId);
    await getTvShowFavorite();
  }
}
