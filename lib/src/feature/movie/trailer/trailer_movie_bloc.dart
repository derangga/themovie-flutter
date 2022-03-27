import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_event_state.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/usecase/movie/get_trailer_movie_usecase.dart';

import '../../../data/model/videos.dart';

part 'trailer_movie_event_state.dart';

class TrailerMovieBloc extends BaseBloc<TrailerMovieEvent, TrailerMovieState> {
  final MovieRepository _repository;
  TrailerMovieBloc(this._repository) : super(LoadingState()) {
    on<TrailerMovieEvent>(_fetchTrailer);
  }

  GetTrailerMovieUseCase get _getTrailerUseCase =>
      GetTrailerMovieUseCase(_repository);

  Future<void> _fetchTrailer(
      TrailerMovieEvent event, Emitter<TrailerMovieState> emit) async {
    if (event is GetTrailerMovieEvent) {
      emit(LoadingState());

      final result = await _getTrailerUseCase(event.movieId);

      result.fold((failure) {
        emit(ErrorGetTrailerMovieState(failure.message));
      }, (response) {
        emit(SuccessGetTrailerMovieState(response));
      });
    }
  }
}
