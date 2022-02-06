import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/feature/home/home_event_state.dart';
import 'package:themovie_flutter/src/usecase/movie/get_discover_movies_usecase.dart';

class HomeDiscoverMovieBloc extends BaseBloc<HomeEvent, HomeState> {
  final MovieRepository _repository;

  HomeDiscoverMovieBloc(this._repository) : super(LoadingState()) {
    on<HomeEvent>(_fetchDiscoverMovie);
  }

  Future<void> _fetchDiscoverMovie(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event is GetDiscoverMovieEvent) {
      emit(LoadingState());

      final result = await _getDiscoverMovie(1);

      result.fold((failure) {
        emit(FailedGetTvShowState(failure.message));
      }, (response) {
        emit(SuccessGetMovieState(response));
      });
    } else if (event is InitialEvent) {
      emit(LoadingState());
    }
  }

  GetDiscoverMovieUseCase get _getDiscoverMovie =>
      GetDiscoverMovieUseCase(_repository);
}
