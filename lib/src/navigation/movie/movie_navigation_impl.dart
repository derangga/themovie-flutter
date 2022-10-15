import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/navigation/movie/movie_navigation.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';

class MovieNavigationImpl extends MovieNavigation {
  @override
  Future<dynamic> goToDetailMovie<T>(
    BuildContext context,
    int movieId,
  ) async {
    return await Navigator.pushNamed(
      context,
      RouteApp.DETAIL_MOVIE_SCREEN,
      arguments: movieId,
    );
  }

  @override
  Future<dynamic> goToDiscoverMovie(BuildContext context) async {
    return await Navigator.pushNamed(
      context,
      RouteApp.DISCOVER_MOVIE_SCREEN,
    );
  }

  @override
  Future<dynamic> goToTrailerMovie(
    BuildContext context,
    int movieId,
  ) async {
    return await Navigator.pushNamed(
      context,
      RouteApp.TRAILER_MOVIE_SCREEN,
      arguments: movieId,
    );
  }

  @override
  Future<dynamic> goToTrendingMovie(BuildContext context) async {
    return await Navigator.pushNamed(context, RouteApp.TRENDING_MOVIE_SCREEN);
  }

  @override
  Future<dynamic> goToUpcomingMovie(BuildContext context) async {
    return await Navigator.pushNamed(context, RouteApp.UPCOMING_MOVIE_SCREEN);
  }
}
