import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/usecase/movie/get_upcoming_movie_usecase.dart';

import '../home_event_state.dart';

class HomeUpcomingMovieBloc extends BaseBloc<HomeEvent, HomeState> {
  final MovieRepository _repository;
  HomeUpcomingMovieBloc(this._repository) : super(LoadingState()) {
    on<HomeEvent>(_fetchUpcomingMovie);
  }

  Future<void> _fetchUpcomingMovie(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event is GetUpcomingMovieEvent) {
      emit(LoadingState());

      final result = await _getUpcomingMovie(1);

      result.fold((failure) {
        emit(FailedGetMovieState(failure.message));
      }, (response) {
        emit(SuccessGetMovieState(response));
      });
    } else if (event is InitialEvent) {
      emit(LoadingState());
    }
  }

  GetUpcomingMovieUseCase get _getUpcomingMovie =>
      GetUpcomingMovieUseCase(_repository);
}
