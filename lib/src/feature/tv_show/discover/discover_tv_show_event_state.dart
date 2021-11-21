part of 'discover_tv_show_bloc.dart';

abstract class DiscoverTvShowEvent extends BlocEvent {}

class GetFirstPageTvShowEvent extends DiscoverTvShowEvent {
  final int page = 1;
}

class GetNextPageTvShowEvent extends DiscoverTvShowEvent {}

class RetryNextPageEvent extends DiscoverTvShowEvent {}

/// State

enum DiscoverTvShowStatus { INITIAL, LOADING, SUCCESS, FAILED }

class DiscoverTvShowState extends BlocState {
  final DiscoverTvShowStatus status;
  final List<TvShow> tvShows;
  final bool hasReachedMax;
  final String? errorMessage;

  DiscoverTvShowState({
    this.status = DiscoverTvShowStatus.INITIAL,
    this.tvShows = const [],
    this.hasReachedMax = false,
    this.errorMessage,
  });

  DiscoverTvShowState copyWith(
      {DiscoverTvShowStatus? status,
      List<TvShow>? tvShows,
      bool? hasReachedMax,
      String? errorMessage}) {
    return DiscoverTvShowState(
      status: status ?? this.status,
      tvShows: tvShows ?? this.tvShows,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage,
    );
  }
}
