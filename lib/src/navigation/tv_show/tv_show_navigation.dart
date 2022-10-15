import 'package:flutter/material.dart';

abstract class TvShowNavigation {
  Future<dynamic> goToDiscoverTvShow(BuildContext context);
  Future<dynamic> goToDetailTvShow<T>(BuildContext context, int tvShowId);
  Future<dynamic> goToTrailerTvShow(BuildContext context, int tvShowId);
}
