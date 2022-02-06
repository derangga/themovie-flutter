import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_stateful.dart';
import 'package:themovie_flutter/src/feature/home/discover_movies/home_discover_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/home/discover_movies/home_discover_movie_section.dart';
import 'package:themovie_flutter/src/feature/home/discover_tv_show/home_discover_tv_show_bloc.dart';
import 'package:themovie_flutter/src/feature/home/discover_tv_show/home_discover_tv_show_section.dart';
import 'package:themovie_flutter/src/feature/home/home_bloc.dart';
import 'package:themovie_flutter/src/feature/home/trending_movie/trending_movie.dart';
import 'package:themovie_flutter/src/feature/home/upcoming_movie/upcoming_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/home/upcoming_movie/upcoming_movie_section.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/resources/drawable.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';
import 'package:themovie_flutter/src/widget/button/button_view.dart';
import 'package:themovie_flutter/src/widget/image/asset_image_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';
import 'home_event_state.dart';
import 'trending_movie/trending_movie_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseStateWidget<HomeBloc, HomeState, HomeScreen> {
  int errorSection = 0;
  late TrendingMovieBloc trendingMovieBloc;
  late UpcomingMovieBloc upcomingMovieBloc;
  late HomeDiscoverMovieBloc homeDiscoverMovieBloc;
  late HomeDiscoverTvShowBloc homeDiscoverTvShowBloc;

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

  // void initBloc() {
  //   trendingMovieBloc = BlocProvider.of<TrendingMovieBloc>(context);
  //   upcomingMovieBloc = BlocProvider.of<UpcomingMovieBloc>(context);
  //   homeDiscoverMovieBloc = BlocProvider.of<HomeDiscoverMovieBloc>(context);
  //   homeDiscoverTvShowBloc = BlocProvider.of<HomeDiscoverTvShowBloc>(context);
  // }

  // void fetchHomeContent() {
  //   trendingMovieBloc.add(GetTrendingMovieEvent());
  //   upcomingMovieBloc.add(GetUpcomingMovieEvent());
  //   homeDiscoverMovieBloc.add(GetDiscoverMovieEvent());
  //   homeDiscoverTvShowBloc.add(GetDiscoverTvShowEvent());
  // }

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
          TrendingMovieSection(
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetImageView(path: Drawable.NO_CONNECTION),
        SizedBox(height: 20.0),
        TextView(
          'There is some problem with your request',
          textSize: 16,
          bold: true,
        ),
        SizedBox(height: 12.0),
        ButtonView(
          width: 80.0,
          text: TextView(
            'Retry',
            bold: true,
          ),
          color: ColorTheme.light_brown,
          radius: 4.0,
          onPressed: () {
            errorSection = 0;
            bloc.add(InitialEvent());
          },
        ),
      ],
    );
  }

  void handleErrorView() {
    errorSection++;
    if (errorSection > 1) {
      bloc.add(ErrorHomeEvent());
    }
  }
}
