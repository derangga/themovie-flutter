import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie/movie.dart';
import 'package:tv/tv.dart';

import 'navigation/navigation_app.dart';

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
              create: (ctx) => KiwiContainer().resolve<DetailTvShowBloc>())
        ],
        child: MaterialApp(
          title: 'Flutter Clean Arch Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: NavigationApp.generateRoute,
          initialRoute: RouteApp.HOME_SCREEN,
        ));
  }
}
