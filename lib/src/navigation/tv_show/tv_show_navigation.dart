import 'package:flutter/material.dart';

abstract class TvShowNavigation {
  void goToDiscoverTvShow(BuildContext context);
  void goToDetailTvShow<T>(BuildContext context, int tvShowId);
  void goToTrailerTvShow(BuildContext context, int tvShowId);
}
