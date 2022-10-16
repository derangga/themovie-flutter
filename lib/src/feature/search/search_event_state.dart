part of 'search_bloc.dart';

abstract class SearchEvent {}

class GoToSuggestionEvent extends SearchEvent {
  final BuildContext context;
  GoToSuggestionEvent(this.context);
}

class FetchSearchMovieEvent extends SearchEvent {
  final bool shouldFetchNextPage;
  FetchSearchMovieEvent(this.shouldFetchNextPage);
}

class FetchSearchTvShowEvent extends SearchEvent {
  final bool shouldFetchNextPage;
  FetchSearchTvShowEvent(this.shouldFetchNextPage);
}

class ShowSearchFilterEvent extends SearchEvent {}

enum SearchStatus { INITIAL, LOADING, LOADING_FOOTER, SUCCESS, FAILED }

enum SearchType { MOVIE, TVSHOW }

class SearchState {
  final SearchStatus status;
  final SearchType searchType;
  final List<Movie> movies;
  final List<TvShow> tvShows;
  final bool hasReachedMax;
  final String? errorMessage;
  final String searchQuery;
  final bool showBotomSheet;

  SearchState({
    this.status = SearchStatus.INITIAL,
    this.searchType = SearchType.MOVIE,
    this.movies = const [],
    this.tvShows = const [],
    this.hasReachedMax = false,
    this.errorMessage,
    this.searchQuery = '',
    this.showBotomSheet = false,
  });

  SearchState copyWith({
    SearchStatus? status,
    SearchType? searchType,
    List<Movie>? movies,
    List<TvShow>? tvShows,
    bool? hasReachedMax,
    String? errorMessage,
    String? searchQuery,
    bool? showBotomSheet,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchType: searchType ?? this.searchType,
      movies: movies ?? this.movies,
      tvShows: tvShows ?? this.tvShows,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      showBotomSheet: showBotomSheet ?? this.showBotomSheet,
    );
  }
}
