part of 'favorite_bloc.dart';

class FavoriteState {
  final List<Movie> movies;
  final List<TvShow> tvShows;
  final FavoriteType favoriteType;
  final bool showBotomSheet;

  FavoriteState({
    this.movies = const [],
    this.tvShows = const [],
    this.favoriteType = FavoriteType.MOVIE,
    this.showBotomSheet = false,
  });

  FavoriteState copyWith(
      {List<Movie>? movies,
      List<TvShow>? tvShows,
      FavoriteType? favoriteType,
      bool? showBotomSheet}) {
    return FavoriteState(
      movies: movies ?? this.movies,
      tvShows: tvShows ?? this.tvShows,
      favoriteType: favoriteType ?? this.favoriteType,
      showBotomSheet: showBotomSheet ?? this.showBotomSheet,
    );
  }
}

enum FavoriteType { MOVIE, TVSHOW }
