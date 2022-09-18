import 'package:flutter/material.dart';

abstract class MovieNavigation {
  void goToUpcomingMovie(BuildContext context);
  void goToDiscoverMovie(BuildContext context);
  void goToDetailMovie<T>(BuildContext context, int movieId);
  void goToTrailerMovie(BuildContext context, int movieId);
  void goToTrendingMovie(BuildContext context);
}
