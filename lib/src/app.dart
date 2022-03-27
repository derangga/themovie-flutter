import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:themovie_flutter/src/feature/account/account_bloc.dart';
import 'package:themovie_flutter/src/feature/favorite/favorite_bloc.dart';
import 'package:themovie_flutter/src/feature/home/discover_movies/home_discover_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/home/discover_tv_show/home_discover_tv_show_bloc.dart';
import 'package:themovie_flutter/src/feature/home/home_bloc.dart';
import 'package:themovie_flutter/src/feature/home/trending_movie/home_trending_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/home/upcoming_movie/home_upcoming_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/movie/trailer/trailer_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/movie/trending/trending_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/movie/upcoming/upcoming_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/search/search_bloc.dart';
import 'package:themovie_flutter/src/feature/tv_show/trailer/trailer_tv_show_bloc.dart';
import 'feature/movie/detail/detail_movie_bloc.dart';
import 'feature/movie/discover/discover_movie_bloc.dart';
import 'feature/tv_show/detail/detail_tv_show_bloc.dart';
import 'feature/tv_show/discover/discover_tv_show_bloc.dart';
import 'navigation/navigation_app.dart';
import 'navigation/route_app.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeTrendingMovieBloc>(
            create: (ctx) => KiwiContainer().resolve<HomeTrendingMovieBloc>(),
          ),
          BlocProvider<HomeUpcomingMovieBloc>(
            create: (ctx) => KiwiContainer().resolve<HomeUpcomingMovieBloc>(),
          ),
          BlocProvider<HomeDiscoverTvShowBloc>(
            create: (ctx) => KiwiContainer().resolve<HomeDiscoverTvShowBloc>(),
          ),
          BlocProvider<HomeDiscoverMovieBloc>(
            create: (ctx) => KiwiContainer().resolve<HomeDiscoverMovieBloc>(),
          ),
          BlocProvider<HomeBloc>(
            create: (ctx) => KiwiContainer().resolve<HomeBloc>(),
          ),
          BlocProvider<SearchBloc>(
            create: (ctx) => SearchBloc(),
          ),
          BlocProvider<FavoriteBloc>(
            create: (ctx) => FavoriteBloc(),
          ),
          BlocProvider<AccountBloc>(
            create: (ctx) => AccountBloc(),
          ),
          BlocProvider<TrendingMovieBloc>(
            create: (ctx) => KiwiContainer().resolve<TrendingMovieBloc>(),
          ),
          BlocProvider<UpcomingMovieBloc>(
            create: (ctx) => KiwiContainer().resolve<UpcomingMovieBloc>(),
          ),
          BlocProvider<DiscoverMovieBloc>(
            create: (ctx) => KiwiContainer().resolve<DiscoverMovieBloc>(),
          ),
          BlocProvider<DiscoverTvShowBloc>(
            create: (ctx) => KiwiContainer().resolve<DiscoverTvShowBloc>(),
          ),
          BlocProvider<DetailTvShowBloc>(
            create: (ctx) => KiwiContainer().resolve<DetailTvShowBloc>(),
          ),
          BlocProvider<DetailMovieBloc>(
            create: (ctx) => KiwiContainer().resolve<DetailMovieBloc>(),
          ),
          BlocProvider<TrailerTvShowBloc>(
            create: (ctx) => KiwiContainer().resolve<TrailerTvShowBloc>(),
          ),
          BlocProvider<TrailerMovieBloc>(
            create: (ctx) => KiwiContainer().resolve<TrailerMovieBloc>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          onGenerateRoute: NavigationApp.generateRoute,
          initialRoute: RouteApp.HOME_SCREEN,
        ));
  }
}
