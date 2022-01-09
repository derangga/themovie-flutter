import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/usecase/tv_show/get_detail_tv_show_usecase.dart';
import '../../../core/base/base_bloc.dart';
import '../../../core/base/base_event_state.dart';
import '../../../domain/tv_show_repository.dart';
import '../../../data/model/detail_tv_show_content.dart';

part 'detail_tv_show_event_state.dart';

class DetailTvShowBloc extends BaseBloc<DetailTvShowEvent, DetailTvShowState> {
  final TvShowRepository _repository;
  DetailTvShowBloc(this._repository) : super(LoadingState()) {
    on<DetailTvShowEvent>(_fetchDetailTvShow);
  }

  Future<void> _fetchDetailTvShow(
    DetailTvShowEvent event,
    Emitter<DetailTvShowState> emit,
  ) async {
    if (event is GetDetailTvShowEvent) {
      emit(LoadingState());

      final result = await _getDetailTvShow(event.tvShowId);

      result.fold((failure) {
        emit(ErrorGetDetailTvShowState('${failure.message}'));
      }, (success) {
        emit(SuccessGetDetailTvShowState(success));
      });
    }
  }

  GetDetailTvShowUseCase get _getDetailTvShow =>
      GetDetailTvShowUseCase(_repository);
}
