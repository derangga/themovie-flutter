part of 'detail_tv_show_bloc.dart';

abstract class DetailTvShowEvent extends BlocEvent {}

class GetDetailTvShowEvent extends DetailTvShowEvent {
  final tvShowId;
  GetDetailTvShowEvent(this.tvShowId);
}

class AddOrRemoveFavoriteEvent extends DetailTvShowEvent {}

class DetailTvShowState extends BlocState {
  final DetailTvShowContent? content;
  final bool isAlreadyFavorite;
  final ApiState apiState;
  final String? errorMessage;

  DetailTvShowState({
    this.content,
    this.apiState = ApiState.LOADING,
    this.isAlreadyFavorite = false,
    this.errorMessage,
  });

  DetailTvShowState copyWith({
    content,
    isMovieFavorite,
    apiState,
    errorMessage,
  }) {
    return DetailTvShowState(
      content: content ?? this.content,
      isAlreadyFavorite: isMovieFavorite ?? this.isAlreadyFavorite,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
