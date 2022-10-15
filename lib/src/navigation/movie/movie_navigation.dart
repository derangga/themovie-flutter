import 'package:flutter/material.dart';

abstract class MovieNavigation {
  Future<dynamic> goToUpcomingMovie(BuildContext context);
  Future<dynamic> goToDiscoverMovie(BuildContext context);
  Future<dynamic> goToDetailMovie<T>(BuildContext context, int movieId);
  Future<dynamic> goToTrailerMovie(BuildContext context, int movieId);
  Future<dynamic> goToTrendingMovie(BuildContext context);
}
