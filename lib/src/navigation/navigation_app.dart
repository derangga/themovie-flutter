import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/feature/movie/trending/trending_movie_screen.dart';
import 'package:themovie_flutter/src/feature/movie/upcoming/upcoming_movie_screen.dart';
import '../feature/movie/detail/detail_movie_screen.dart';
import '../feature/movie/discover/discover_movie_screen.dart';
import '../feature/tv_show/detail/detail_tv_show_screen.dart';
import '../feature/tv_show/discover/discover_tv_show_screen.dart';
import '../navigation/route_app.dart';
import '../ui/main_screen.dart';
import '../widget/undefined_view.dart';

class NavigationApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteApp.HOME_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
        );

      case RouteApp.TRENDING_MOVIE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => TrendingMovieScreen(),
        );

      case RouteApp.UPCOMING_MOVIE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => UpcomingMovieScreen(),
        );

      case RouteApp.DISCOVER_MOVIE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DiscoverMovieScreen(),
        );

      case RouteApp.DETAIL_MOVIE_SCREEN:
        final int movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => DetailMovieScreen(movieId),
        );

      case RouteApp.DISCOVER_TV_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DiscoverTvShowScreen(),
        );

      case RouteApp.DETAIL_TV_SCREEN:
        final int tvShowId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => DetailTvShowScreen(tvShowId),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => UndefinedView(
            routeName: settings.name,
          ),
        );
    }
  }
}
