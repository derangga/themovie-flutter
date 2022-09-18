import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/base/base_bloc_widget.dart';
import '../../di/injection.dart';
import '../../widget/app_scaffold.dart';
import '../../widget/custom_widget/no_connection_view.dart';
import 'discover_movies/home_discover_movie_bloc.dart';
import 'discover_movies/home_discover_movie_section.dart';
import 'discover_tv_show/home_discover_tv_show_bloc.dart';
import 'discover_tv_show/home_discover_tv_show_section.dart';
import 'home_bloc.dart';
import 'home_event_state.dart';
import 'trending_movie/home_trending_movie.dart';
import 'trending_movie/home_trending_movie_bloc.dart';
import 'upcoming_movie/home_upcoming_movie_bloc.dart';
import 'upcoming_movie/home_upcoming_movie_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseBlocWidget<HomeBloc, HomeState, HomeScreen> {
  int errorSection = 0;

  @override
  Widget mapStateHandler(HomeState state) {
    if (state is ShowHomeErrorState) {
      return createNoConnection();
    } else {
      return createHomeSection();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeTrendingMovieBloc>(
          create: (ctx) => getIt.get<HomeTrendingMovieBloc>(),
        ),
        BlocProvider<HomeUpcomingMovieBloc>(
          create: (ctx) => getIt.get<HomeUpcomingMovieBloc>(),
        ),
        BlocProvider<HomeDiscoverTvShowBloc>(
          create: (ctx) => getIt.get<HomeDiscoverTvShowBloc>(),
        ),
        BlocProvider<HomeDiscoverMovieBloc>(
          create: (ctx) => getIt.get<HomeDiscoverMovieBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (ctx) => getIt.get<HomeBloc>(),
        ),
      ],
      child: AppScaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => mapStateHandler(state),
        ),
      ),
    );
  }

  Widget createHomeSection() {
    return Builder(
      builder: (context) => ListView(
        children: [
          HomeTrendingMovieSection(
            onTrendingSectionError: handleErrorView,
          ),
          UpcomingMovieSection(
            onUpcomingSectionError: handleErrorView,
          ),
          HomeDiscoverMovieSection(
            onDiscoverMovieSectionError: handleErrorView,
          ),
          HomeDiscoverTvShowSection(
            onDiscoverTvShowSectionError: handleErrorView,
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }

  Widget createNoConnection() {
    return NoConnectionView(
      errorText: 'There is some problem with your request',
      onPressed: () {
        errorSection = 0;
        bloc.add(InitialEvent());
      },
    );
  }

  void handleErrorView() {
    errorSection++;
    if (errorSection > 1) {
      bloc.add(ErrorHomeEvent());
    }
  }
}
