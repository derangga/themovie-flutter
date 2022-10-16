import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/navigation/movie/movie_navigation.dart';
import 'package:themovie_flutter/src/navigation/tv_show/tv_show_navigation.dart';
import 'package:themovie_flutter/src/utils/bloc_throttle.dart';

import '../../data/model/movie.dart';
import '../../data/model/tv_show.dart';
import '../../data/remote/config/failure.dart';
import '../../data/remote/source/search_remote_source.dart';
import '../../navigation/search/search_navigation.dart';

part './search_event_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRemoteSource _remoteSource;
  final MovieNavigation _movieNavigation;
  final TvShowNavigation _tvShowNavigation;
  final SearchNavigation _searchNavigation;
  int _page = 1;

  SearchBloc(
    this._remoteSource,
    this._movieNavigation,
    this._tvShowNavigation,
    this._searchNavigation,
  ) : super(SearchState()) {
    on<SearchEvent>(
      _mapEventToAction,
      transformer: throttleDroppable(Duration(milliseconds: 500)),
    );
  }

  Future<void> _mapEventToAction(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event is GoToSuggestionEvent) {
      await _goToSearchSuggestion(emit, event.context);
    } else if (event is FetchSearchMovieEvent) {
      await _fetchSearchMovie(event, emit);
    } else if (event is FetchSearchTvShowEvent) {
      await _fetchSearchTvShow(event, emit);
    } else if (event is ShowSearchFilterEvent) {
      _showFilterFavoriteBottomSheet(emit);
    }
  }

  Future<void> _fetchSearchMovie(
    FetchSearchMovieEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (state.searchQuery.isEmpty) return;

    if (!event.shouldFetchNextPage) {
      _page = 1;
      emit(state.copyWith(
        searchType: SearchType.MOVIE,
        status: SearchStatus.LOADING,
        tvShows: List.empty(),
        showBotomSheet: false,
        hasReachedMax: false,
      ));
      final result = await _remoteSource.searchMovie(state.searchQuery, _page);
      _onGetFirstPageSearchMovie(emit, result);
    } else if (!state.hasReachedMax) {
      emit(state.copyWith(status: SearchStatus.LOADING_FOOTER));
      final result = await _remoteSource.searchMovie(state.searchQuery, _page);
      _onGetNextPageSearchMovie(emit, result);
    }
  }

  void _onGetFirstPageSearchMovie(
    Emitter<SearchState> emit,
    Either<Failure, List<Movie>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: SearchStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
      ));
    }, (response) {
      _page++;
      emit(state.copyWith(
        status: SearchStatus.SUCCESS,
        movies: response,
        hasReachedMax: false,
      ));
    });
  }

  void _onGetNextPageSearchMovie(
    Emitter<SearchState> emit,
    Either<Failure, List<Movie>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: SearchStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
        hasReachedMax: false,
      ));
    }, (response) {
      if (response.isNotEmpty) {
        _page++;
        emit(state.copyWith(
          status: SearchStatus.SUCCESS,
          movies: List.of(state.movies)..addAll(response),
          hasReachedMax: false,
        ));
      } else {
        emit(state.copyWith(
          status: SearchStatus.SUCCESS,
          hasReachedMax: true,
        ));
      }
    });
  }

  Future<void> _fetchSearchTvShow(
    FetchSearchTvShowEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (state.searchQuery.isEmpty) return;

    if (!event.shouldFetchNextPage) {
      _page = 1;
      emit(state.copyWith(
        searchType: SearchType.TVSHOW,
        status: SearchStatus.LOADING,
        movies: List.empty(),
        showBotomSheet: false,
        hasReachedMax: false,
      ));
      final result = await _remoteSource.searchTvShow(state.searchQuery, _page);
      _onGetFirstPageSearchTvShow(emit, result);
    } else if (!state.hasReachedMax) {
      emit(state.copyWith(status: SearchStatus.LOADING_FOOTER));
      final result = await _remoteSource.searchTvShow(state.searchQuery, _page);
      _onGetNextPageSearchTvShow(emit, result);
    }
  }

  void _onGetFirstPageSearchTvShow(
    Emitter<SearchState> emit,
    Either<Failure, List<TvShow>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: SearchStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
      ));
    }, (response) {
      _page++;
      emit(state.copyWith(
        status: SearchStatus.SUCCESS,
        tvShows: response,
        hasReachedMax: false,
      ));
    });
  }

  void _onGetNextPageSearchTvShow(
    Emitter<SearchState> emit,
    Either<Failure, List<TvShow>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: SearchStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
        hasReachedMax: false,
      ));
    }, (response) {
      if (response.isNotEmpty) {
        _page++;
        emit(state.copyWith(
          status: SearchStatus.SUCCESS,
          tvShows: List.of(state.tvShows)..addAll(response),
          hasReachedMax: false,
        ));
      } else {
        emit(state.copyWith(
          status: SearchStatus.SUCCESS,
          hasReachedMax: true,
        ));
      }
    });
  }

  Future<void> _goToSearchSuggestion(
    Emitter<SearchState> emit,
    BuildContext context,
  ) async {
    final searchName = await _searchNavigation.goToSearchSuggestion(
      context,
      state.searchType.name.toLowerCase(),
    );
    if (searchName != null && searchName is String) {
      emit(state.copyWith(
        status: SearchStatus.INITIAL,
        searchQuery: searchName,
        tvShows: List.empty(),
        movies: List.empty(),
        hasReachedMax: false,
        errorMessage: null,
      ));
    }
  }

  bool isOnLoadingOrFailed() {
    return state.status == SearchStatus.LOADING ||
        state.status == SearchStatus.FAILED;
  }

  void goToDetailMovie(BuildContext context, int movieId) {
    _movieNavigation.goToDetailMovie(context, movieId);
  }

  void goToDetailTvShow(BuildContext context, int tvShowId) {
    _tvShowNavigation.goToDetailTvShow(context, tvShowId);
  }

  void _showFilterFavoriteBottomSheet(Emitter<SearchState> emit) {
    emit(state.copyWith(showBotomSheet: true));
  }
}
