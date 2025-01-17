import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:themovie_flutter/src/feature/video/video_player_bloc.dart';

import '../data/local/db/app_database.dart';
import '../data/local/db/movie_favorite_dao.dart';
import '../data/local/db/tv_show_favorite_dao.dart';
import '../data/local/movie_local_source.dart';
import '../data/local/movie_local_source_impl.dart';
import '../data/local/tv_show_local_source.dart';
import '../data/local/tv_show_local_source_impl.dart';
import '../data/remote/config/dio_module.dart';
import '../data/remote/config/loging_interceptor.dart';
import '../data/remote/service/http_request_service.dart';
import '../data/remote/source/movie_remote_source.dart';
import '../data/remote/source/movie_remote_source_impl.dart';
import '../data/remote/source/search_remote_source.dart';
import '../data/remote/source/search_remote_source_impl.dart';
import '../data/remote/source/trending_remote_source.dart';
import '../data/remote/source/trending_remote_source_impl.dart';
import '../data/remote/source/tv_show_remote_source.dart';
import '../data/remote/source/tv_show_remote_source_impl.dart';
import '../feature/favorite/favorite_bloc.dart';
import '../feature/home/discover_movies/home_discover_movie_bloc.dart';
import '../feature/home/discover_tv_show/home_discover_tv_show_bloc.dart';
import '../feature/home/home_bloc.dart';
import '../feature/home/trending_movie/home_trending_movie_bloc.dart';
import '../feature/home/upcoming_movie/home_upcoming_movie_bloc.dart';
import '../feature/movie/detail/detail_movie_bloc.dart';
import '../feature/movie/discover/discover_movie_bloc.dart';
import '../feature/movie/trailer/trailer_movie_bloc.dart';
import '../feature/movie/trending/trending_movie_bloc.dart';
import '../feature/movie/upcoming/upcoming_movie_bloc.dart';
import '../feature/search/search_bloc.dart';
import '../feature/search/search_suggestion_bloc.dart';
import '../feature/tv_show/detail/detail_tv_show_bloc.dart';
import '../feature/tv_show/discover/discover_tv_show_bloc.dart';
import '../feature/tv_show/trailer/trailer_tv_show_bloc.dart';
import '../navigation/movie/movie_navigation.dart';
import '../navigation/movie/movie_navigation_impl.dart';
import '../navigation/search/search_navigation.dart';
import '../navigation/search/search_navigation_impl.dart';
import '../navigation/tv_show/tv_show_navigation.dart';
import '../navigation/tv_show/tv_show_navigation_impl.dart';
import '../navigation/video/video_navigation.dart';
import '../navigation/video/video_navigation_impl.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  static void setup() {
    /// network setup
    getIt.registerSingleton<BaseOptions>(DioOptions());
    getIt.registerSingleton<Interceptor>(LoggingInterceptor());
    getIt.registerSingleton<HttpClientAdapter>(HttpClientAdapter());
    getIt.registerSingleton<Dio>(DioModule(
      getIt(),
      getIt(),
      getIt(),
    ));
    getIt.registerFactory<HttpRequestService>(
      () => HttpRequestService(getIt()),
    );

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
    getIt.registerFactory<SearchRemoteSource>(
      () => SearchRemoteSourceImpl(getIt()),
    );

    /// navigation
    getIt.registerFactory<MovieNavigation>(() => MovieNavigationImpl());
    getIt.registerFactory<TvShowNavigation>(() => TvShowNavigationImpl());
    getIt.registerFactory<VideoNavigation>(() => VideoNavigationImpl());
    getIt.registerFactory<SearchNavigation>(() => SearchNavigationImpl());

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
    getIt.registerFactory<FavoriteBloc>(
      () => FavoriteBloc(getIt(), getIt(), getIt(), getIt()),
    );
    getIt.registerFactory<SearchBloc>(
      () => SearchBloc(getIt(), getIt(), getIt(), getIt()),
    );
    getIt.registerFactory<SearchSuggestionBloc>(
      () => SearchSuggestionBloc(getIt()),
    );
    getIt.registerFactory<VideoPlayerBloc>(() => VideoPlayerBloc());
  }
}
