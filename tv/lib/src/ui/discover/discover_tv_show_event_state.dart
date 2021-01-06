part of 'discover_tv_show_bloc.dart';

abstract class DiscoverTvShowEvent implements BlocEvent {}

class GetFirstPageTvShowEvent implements DiscoverTvShowEvent {
  final int page = 1;
}

class GetNextPageTvShowEvent implements DiscoverTvShowEvent {}

class RetryNextPageEvent implements DiscoverTvShowEvent {}

/// State

abstract class DiscoverTvShowState implements BlocState {}

class LoadingFirstPageState implements DiscoverTvShowState {}

class LoadingRetryNextPageState implements DiscoverTvShowState {
  final List<TvShow> tvShows;
  LoadingRetryNextPageState(this.tvShows);

  copyWith({List<TvShow> nextTvShows, bool hasReachedMax}) {
    return LoadingRetryNextPageState(nextTvShows ?? this.tvShows);
  }
}

class ErrorGetFirstPageTvShowState implements DiscoverTvShowState {
  final String message;
  ErrorGetFirstPageTvShowState(this.message);
}

class ErrorGetNextPageTvShowState implements DiscoverTvShowState {
  final String message;
  final List<TvShow> tvShows;
  ErrorGetNextPageTvShowState(this.tvShows, this.message);
  copyWith({List<TvShow> nextTvShows, bool hasReachedMax}) {
    return ErrorGetNextPageTvShowState(nextTvShows ?? this.tvShows, message ?? this.message);
  }
}

class SuccessGetDiscoverTvShowState implements DiscoverTvShowState {
  final List<TvShow> tvShows;
  final bool hasReachedMax;
  SuccessGetDiscoverTvShowState(this.tvShows, this.hasReachedMax);

  copyWith({List<TvShow> nextTvShows, bool hasReachedMax}) {
    return SuccessGetDiscoverTvShowState(
        nextTvShows ?? this.tvShows, hasReachedMax ?? this.hasReachedMax);
  }
}
