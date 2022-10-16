import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/feature/movie/trailer/trailer_movie_screen.dart';
import 'package:themovie_flutter/src/feature/movie/trending/trending_movie_screen.dart';
import 'package:themovie_flutter/src/feature/movie/upcoming/upcoming_movie_screen.dart';
import 'package:themovie_flutter/src/feature/tv_show/trailer/trailer_tv_show_screen.dart';
import 'package:themovie_flutter/src/feature/video/video_player_screen.dart';
import 'package:themovie_flutter/src/navigation/screen_args/video_player_arguments.dart';
import '../feature/movie/detail/detail_movie_screen.dart';
import '../feature/movie/discover/discover_movie_screen.dart';
import '../feature/search/search_suggestion_screen.dart';
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

      case RouteApp.TRAILER_TV_SHOW_SCREEN:
        final int tvShowId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => TrailerTvShowScreen(tvShowId),
        );

      case RouteApp.TRAILER_MOVIE_SCREEN:
        final int movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => TrailerMovieScreen(movieId),
        );

      case RouteApp.VIDEO_PLAYER_SCREEN:
        final VideoPlayerArguments videoKey =
            settings.arguments as VideoPlayerArguments;
        return MaterialPageRoute(
          builder: (_) => VideoPlayerScreen(videoKey),
        );
      case RouteApp.SEARCH_SUGGESTION:
        final searchType = settings.arguments as String;
        return MaterialPageRoute(
          builder: ((_) => SearchSuggestionScreen(searchType)),
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
