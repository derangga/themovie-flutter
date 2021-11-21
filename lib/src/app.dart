import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
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
          BlocProvider<DiscoverMovieBloc>(
              create: (ctx) => KiwiContainer().resolve<DiscoverMovieBloc>()),
          BlocProvider<DiscoverTvShowBloc>(
              create: (ctx) => KiwiContainer().resolve<DiscoverTvShowBloc>()),
          BlocProvider<DetailTvShowBloc>(
              create: (ctx) => KiwiContainer().resolve<DetailTvShowBloc>()),
          BlocProvider<DetailMovieBloc>(
              create: (ctx) => KiwiContainer().resolve<DetailMovieBloc>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          onGenerateRoute: NavigationApp.generateRoute,
          initialRoute: RouteApp.HOME_SCREEN,
        ));
  }
}
