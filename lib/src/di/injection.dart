import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:themovie_flutter/src/data/config/dio_module.dart';
import 'package:themovie_flutter/src/data/config/loging_interceptor.dart';
import 'package:themovie_flutter/src/data/local/db/tv_show_favorite_dao.dart';
import 'package:themovie_flutter/src/data/local/tv_show_local_source.dart';
import 'package:themovie_flutter/src/data/local/tv_show_local_source_impl.dart';
import 'package:themovie_flutter/src/data/remote/movie_remote_source.dart';
import 'package:themovie_flutter/src/data/remote/movie_remote_source_impl.dart';
import 'package:themovie_flutter/src/data/remote/trending_remote_source.dart';
import 'package:themovie_flutter/src/data/remote/trending_remote_source_impl.dart';
import 'package:themovie_flutter/src/data/remote/tv_show_remote_source.dart';
import 'package:themovie_flutter/src/data/remote/tv_show_remote_source_impl.dart';
import 'package:themovie_flutter/src/feature/home/discover_movies/home_discover_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/movie/detail/detail_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/movie/discover/discover_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/tv_show/discover/discover_tv_show_bloc.dart';
import 'package:themovie_flutter/src/navigation/movie/movie_navigation.dart';
import 'package:themovie_flutter/src/navigation/movie/movie_navigation_impl.dart';
import 'package:themovie_flutter/src/navigation/tv_show/tv_show_navigation.dart';
import 'package:themovie_flutter/src/navigation/tv_show/tv_show_navigation_impl.dart';

import '../data/local/db/app_database.dart';
import '../data/local/db/movie_favorite_dao.dart';
import '../data/local/movie_local_source.dart';
import '../data/local/movie_local_source_impl.dart';
import '../feature/home/discover_tv_show/home_discover_tv_show_bloc.dart';
import '../feature/home/home_bloc.dart';
import '../feature/home/trending_movie/home_trending_movie_bloc.dart';
import '../feature/home/upcoming_movie/home_upcoming_movie_bloc.dart';
import '../feature/movie/trailer/trailer_movie_bloc.dart';
import '../feature/movie/trending/trending_movie_bloc.dart';
import '../feature/movie/upcoming/upcoming_movie_bloc.dart';
import '../feature/tv_show/detail/detail_tv_show_bloc.dart';
import '../feature/tv_show/trailer/trailer_tv_show_bloc.dart';
import '../navigation/video/video_navigation.dart';
import '../navigation/video/video_navigation_impl.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  static void setup() {
    /// network setup
    getIt.registerSingleton<BaseOptions>(DioOptions());
    getIt.registerSingleton<Interceptor>(LoggingInterceptor());
    getIt.registerSingleton<DefaultHttpClientAdapter>(
        DefaultHttpClientAdapter());
    getIt.registerSingleton<Dio>(DioModule(
      getIt(),
      getIt(),
      getIt(),
    ));

    getIt.registerSingleton<AppDatabase>(AppDatabase());
    getIt.registerSingleton<MovieFavoriteDao>(MovieFavoriteDao(getIt()));
    getIt.registerSingleton<TvShowFavoriteDao>(TvShowFavoriteDao(getIt()));
    getIt.registerFactory<MovieLocalSource>(
      () => MovieLocalSourceImpl(getIt()),
    );
    getIt.registerFactory<TvShowLocalSource>(
      () => TvShowLocalSourceImpl(getIt()),
    );

    /// network source
    getIt.registerFactory<MovieRemoteSource>(
      () => MovieRemoteSourceImpl(getIt()),
    );
    getIt.registerFactory<TvShowRemoteSource>(
      () => TvShowRemoteSourceImpl(getIt()),
    );
    getIt.registerFactory<TrendingRemoteSource>(
      () => TrendingRemoteSourceImpl(getIt()),
    );

    /// navigation
    getIt.registerFactory<MovieNavigation>(() => MovieNavigationImpl());
    getIt.registerFactory<TvShowNavigation>(() => TvShowNavigationImpl());
    getIt.registerFactory<VideoNavigation>(() => VideoNavigationImpl());

    /// bloc
    getIt.registerFactory<DiscoverMovieBloc>(
      () => DiscoverMovieBloc(getIt(), getIt()),
    );
    getIt.registerFactory<DetailMovieBloc>(
      () => DetailMovieBloc(
        getIt(),
        getIt(),
        getIt(),
      ),
    );
    getIt.registerFactory<DiscoverTvShowBloc>(
      () => DiscoverTvShowBloc(getIt(), getIt()),
    );
    getIt.registerFactory<DetailTvShowBloc>(
      () => DetailTvShowBloc(
        getIt(),
        getIt(),
        getIt(),
      ),
    );
    getIt.registerFactory(
      () => UpcomingMovieBloc(getIt(), getIt()),
    );
    getIt.registerFactory<TrendingMovieBloc>(
      (() => TrendingMovieBloc(getIt(), getIt())),
    );
    getIt.registerFactory<TrailerMovieBloc>(
      () => TrailerMovieBloc(getIt(), getIt()),
    );
    getIt.registerFactory<TrailerTvShowBloc>(
      () => TrailerTvShowBloc(getIt(), getIt()),
    );
    getIt.registerFactory<HomeDiscoverMovieBloc>(
      () => HomeDiscoverMovieBloc(getIt(), getIt()),
    );
    getIt.registerFactory<HomeTrendingMovieBloc>(
      () => HomeTrendingMovieBloc(getIt(), getIt()),
    );
    getIt.registerFactory<HomeUpcomingMovieBloc>(
      () => HomeUpcomingMovieBloc(getIt(), getIt()),
    );
    getIt.registerFactory<HomeDiscoverTvShowBloc>(
      () => HomeDiscoverTvShowBloc(getIt(), getIt()),
    );
    getIt.registerFactory<HomeBloc>(
      () => HomeBloc(),
    );
  }
}
