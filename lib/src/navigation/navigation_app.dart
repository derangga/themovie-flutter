import 'package:flutter/material.dart';

import 'package:core/core.dart';
import 'package:movie/movie.dart';
import 'package:themovie_flutter/src/ui/home_screen.dart';

class NavigationApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteApp.HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case RouteApp.DISCOVER_MOVIE_SCREEN:
        return MaterialPageRoute(builder: (_) => DiscoverMovieScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => UndefinedView(
                  routeName: settings.name,
                ));
    }
  }
}
