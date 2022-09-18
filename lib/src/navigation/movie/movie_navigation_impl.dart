import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/navigation/movie/movie_navigation.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';

class MovieNavigationImpl extends MovieNavigation {
  @override
  void goToDetailMovie<T>(BuildContext context, int movieId) {
    Navigator.pushNamed(
      context,
      RouteApp.DETAIL_MOVIE_SCREEN,
      arguments: movieId,
    );
  }

  @override
  void goToDiscoverMovie(BuildContext context) {
    Navigator.pushNamed(context, RouteApp.DISCOVER_MOVIE_SCREEN);
  }

  @override
  void goToTrailerMovie(BuildContext context, int movieId) {
    Navigator.pushNamed(
      context,
      RouteApp.TRAILER_MOVIE_SCREEN,
      arguments: movieId,
    );
  }

  @override
  void goToTrendingMovie(BuildContext context) {
    Navigator.pushNamed(context, RouteApp.TRENDING_MOVIE_SCREEN);
  }

  @override
  void goToUpcomingMovie(BuildContext context) {
    Navigator.pushNamed(context, RouteApp.UPCOMING_MOVIE_SCREEN);
  }
}
