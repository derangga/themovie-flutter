import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/data/remote/trending_remote_source.dart';
import 'package:themovie_flutter/src/feature/home/home_event_state.dart';
import 'package:themovie_flutter/src/usecase/trending/get_trending_movie_usecase.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

class HomeTrendingMovieBloc extends BaseBloc<HomeEvent, HomeState> {
  final TrendingRemoteSouce _remoteSouce;

  HomeTrendingMovieBloc(this._remoteSouce) : super(LoadingState()) {
    on<HomeEvent>(_fetchTrendingMovie);
  }

  Future<void> _fetchTrendingMovie(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event is GetTrendingMovieEvent) {
      emit(LoadingState());

      final result = await _getTrendingMovie(NoParams());

      result.fold((failure) {
        emit(FailedGetMovieState(failure.message));
      }, (response) {
        bool isMoreOrEqFiveContent = response.length >= 6;
        if (isMoreOrEqFiveContent) {
          final movies = response.sublist(0, 6);
          emit(SuccessGetMovieState(movies));
        } else {
          emit(SuccessGetMovieState(response));
        }
      });
    } else if (event is InitialEvent) {
      emit(LoadingState());
    }
  }

  GetTrendingMovieUseCase get _getTrendingMovie =>
      GetTrendingMovieUseCase(_remoteSouce);
}
