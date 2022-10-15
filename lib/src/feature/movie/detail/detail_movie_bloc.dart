import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/data/local/movie_local_source.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/data/remote/movie_remote_source.dart';
import 'package:themovie_flutter/src/navigation/movie/movie_navigation.dart';
import 'package:themovie_flutter/src/usecase/movie/get_detail_movie_usecase.dart';
import '../../../core/base/api_state.dart';
import '../../../data/model/detail_movie_content.dart';
import '../../../utils/extension/string_utils.dart';

part 'detail_movie_state.dart';

class DetailMovieBloc extends Cubit<DetailMovieState> {
  final MovieRemoteSource _remoteSource;
  final MovieLocalSource _localSource;
  final MovieNavigation _movieNavigation;

  DetailMovieBloc(
    this._remoteSource,
    this._localSource,
    this._movieNavigation,
  ) : super(DetailMovieState());

  Future<void> fetchDetailMovie(int movieId) async {
    emit(state.copyWith(apiState: ApiState.LOADING));

    final result = await _getDetailMovie(movieId);

    await result.fold((failure) {
      emit(state.copyWith(
        apiState: ApiState.FAILED,
        errorMessage: failure.message.orEmpty(),
      ));
    }, (response) async {
      final isAlreadyFavorite = await _localSource.isAlreadyFavorite(
        response.detailMovie?.id ?? 0,
      );
      emit(state.copyWith(
        content: response,
        apiState: ApiState.SUCCESS,
        isMovieFavorite: isAlreadyFavorite,
      ));
    });
  }

  void goToTrailerScreen(BuildContext context, int movieId) {
    _movieNavigation.goToTrailerMovie(context, movieId);
  }

  void goToDetailMovieScreen(BuildContext context, int movieId) {
    _movieNavigation.goToDetailMovie(context, movieId);
  }

  Future<void> addOrRemoveMovieToFavorite() async {
    final detailMovie = state.content?.detailMovie;
    if (detailMovie != null) {
      final movie = Movie(
        adult: detailMovie.adult,
        backdropPath: detailMovie.backdropPath,
        id: detailMovie.id,
        originalLanguage: detailMovie.originalLanguage,
        originalTitle: detailMovie.originalTitle,
        overview: detailMovie.overview,
        popularity: detailMovie.popularity,
        posterPath: detailMovie.posterPath,
        releaseDate: detailMovie.releaseDate,
        title: detailMovie.title,
        video: detailMovie.video,
        voteAverage: '${detailMovie.voteAverage}',
        voteCount: detailMovie.voteCount,
      );
      if (!state.isMovieFavorite) {
        await _localSource.insertMovie(movie);
        emit(state.copyWith(isMovieFavorite: true));
      } else {
        await _localSource.deleteMovie(movie);
        emit(state.copyWith(isMovieFavorite: false));
      }
    }
  }

  GetDetailMovieUseCase get _getDetailMovie =>
      GetDetailMovieUseCase(_remoteSource);
}
