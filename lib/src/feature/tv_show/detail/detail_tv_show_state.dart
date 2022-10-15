part of 'detail_tv_show_bloc.dart';

class DetailTvShowState {
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
    DetailTvShowContent? content,
    bool? isMovieFavorite,
    ApiState? apiState,
    String? errorMessage,
  }) {
    return DetailTvShowState(
      content: content ?? this.content,
      isAlreadyFavorite: isMovieFavorite ?? this.isAlreadyFavorite,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
