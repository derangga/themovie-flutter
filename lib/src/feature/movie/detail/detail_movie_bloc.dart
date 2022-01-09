import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/usecase/movie/get_detail_movie_usecase.dart';
import '../../../core/base/base_event_state.dart';
import '../../../data/model/detail_movie_content.dart';
import '../../../core/base/base_bloc.dart';
import '../../../domain/movie_repository.dart';

part 'detail_movie_event_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  final MovieRepository _repository;

  DetailMovieBloc(this._repository) : super(LoadingState()) {
    on<DetailMovieEvent>(_fetchDetailMovie);
  }

  Future<void> _fetchDetailMovie(
    DetailMovieEvent event,
    Emitter<DetailMovieState> emit,
  ) async {
    if (event is GetDetailMovieEvent) {
      emit(LoadingState());

      final result = await _getDetailMovie(event.movieId);

      result.fold((failure) {
        emit(ErrorGetDetailMovie(failure.message));
      }, (success) {
        emit(SuccessGetDetailMovie(success));
      });
    }
  }

  GetDetailMovieUseCase get _getDetailMovie =>
      GetDetailMovieUseCase(_repository);
}
