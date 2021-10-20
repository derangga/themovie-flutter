part of 'discover_tv_show_bloc.dart';

abstract class DiscoverTvShowEvent extends BlocEvent {}

class GetFirstPageTvShowEvent extends DiscoverTvShowEvent {
  final int page = 1;
}

class GetNextPageTvShowEvent extends DiscoverTvShowEvent {}

class RetryNextPageEvent extends DiscoverTvShowEvent {}

/// State

abstract class DiscoverTvShowState extends BlocState {}

class LoadingFirstPageState extends DiscoverTvShowState {}

class LoadingRetryNextPageState extends DiscoverTvShowState {
  final List<TvShow> tvShows;
  LoadingRetryNextPageState(this.tvShows);

  copyWith({List<TvShow> nextTvShows, bool hasReachedMax}) {
    return LoadingRetryNextPageState(nextTvShows ?? this.tvShows);
  }
}

class ErrorGetFirstPageTvShowState extends DiscoverTvShowState {
  final String message;
  ErrorGetFirstPageTvShowState(this.message);
}

class ErrorGetNextPageTvShowState extends DiscoverTvShowState {
  final String message;
  final List<TvShow> tvShows;
  ErrorGetNextPageTvShowState(this.tvShows, this.message);
  copyWith({List<TvShow> nextTvShows, bool hasReachedMax}) {
    return ErrorGetNextPageTvShowState(
        nextTvShows ?? this.tvShows, message ?? this.message);
  }
}

class SuccessGetDiscoverTvShowState extends DiscoverTvShowState {
  final List<TvShow> tvShows;
  final bool hasReachedMax;
  SuccessGetDiscoverTvShowState(this.tvShows, this.hasReachedMax);

  copyWith({List<TvShow> nextTvShows, bool hasReachedMax}) {
    return SuccessGetDiscoverTvShowState(
        nextTvShows ?? this.tvShows, hasReachedMax ?? this.hasReachedMax);
  }
}
