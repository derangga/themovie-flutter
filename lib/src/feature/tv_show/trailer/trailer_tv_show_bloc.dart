import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/usecase/tv_show/get_trailer_tv_show_usecase.dart';
import '../../../core/base/base_event_state.dart';
import '../../../core/base/base_bloc.dart';
import '../../../domain/tv_show_repository.dart';
import '../../../data/model/videos.dart';

part 'trailer_tv_show_event_state.dart';

class TrailerTvShowBloc
    extends BaseBloc<TrailerTvShowEvent, TrailerTvShowState> {
  final TvShowRepository _repository;

  TrailerTvShowBloc(this._repository) : super(LoadingState()) {
    on<TrailerTvShowEvent>(_fetchTrailer);
  }

  GetTrailerTvShowUseCase get _getTrailerUseCase =>
      GetTrailerTvShowUseCase(_repository);

  Future<void> _fetchTrailer(
    TrailerTvShowEvent event,
    Emitter<TrailerTvShowState> emit,
  ) async {
    if (event is GetTrailerTvShowEvent) {
      emit(LoadingState());

      final result = await _getTrailerUseCase(event.tvShowId);

      result.fold((failure) {
        emit(ErrorGetTrailerTvShowState(failure.message));
      }, (response) {
        emit(SuccessGetTrailerTvShowState(response));
      });
    }
  }
}
