import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_stateful.dart';
import 'package:themovie_flutter/src/feature/home/discover_movies/home_discover_movie_section.dart';
import 'package:themovie_flutter/src/feature/home/discover_tv_show/home_discover_tv_show_section.dart';
import 'package:themovie_flutter/src/feature/home/home_bloc.dart';
import 'package:themovie_flutter/src/feature/home/trending_movie/home_trending_movie.dart';
import 'package:themovie_flutter/src/feature/home/upcoming_movie/home_upcoming_movie_section.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';
import 'package:themovie_flutter/src/widget/custom_widget/no_connection_view.dart';
import 'home_event_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseStateWidget<HomeBloc, HomeState, HomeScreen> {
  int errorSection = 0;

  @override
  Widget mapStateToWidget(HomeState state) {
    if (state is ShowHomeErrorState) {
      return createNoConnection();
    } else {
      return createHomeSection();
    }
  }

  @override
  void setupOnInitState() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => mapStateToWidget(state),
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
