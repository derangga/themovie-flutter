// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injection extends Injection {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<LogFilter>((c) => DevelopmentFilter(),
          name: 'LogFilter')
      ..registerSingleton<LogOutput>((c) => ConsoleOutput(), name: 'LogOutput')
      ..registerSingleton<BaseOptions>((c) => DioOptions(), name: 'BaseOptions')
      ..registerSingleton<Interceptor>((c) => LoggingInterceptor(),
          name: 'Interceptor')
      ..registerSingleton((c) => DefaultHttpClientAdapter(),
          name: 'DefaultHttpClientAdapter')
      ..registerSingleton<Dio>(
          (c) => DioModule(
              c<BaseOptions>('BaseOptions'),
              c<Interceptor>('Interceptor'),
              c<DefaultHttpClientAdapter>('DefaultHttpClientAdapter')),
          name: 'Dio')
      ..registerFactory<MovieRemoteSource>(
          (c) => MovieRemoteSourceImpl(c<Dio>('Dio')),
          name: 'MovieRemoteSource')
      ..registerFactory<MovieRepository>(
          (c) => MovieRepositoryImpl(c<MovieRemoteSource>('MovieRemoteSource')),
          name: 'MovieRepository')
      ..registerFactory<TvShowRemoteSource>(
          (c) => TvShowRemoteSourceImpl(c<Dio>('Dio')),
          name: 'TvShowRemoteSource')
      ..registerFactory<TrendingRemoteSouce>(
          (c) => TrendingRemoteSourceImpl(c<Dio>('Dio')),
          name: 'TrendingRemoteSouce')
      ..registerFactory<TvShowRepository>(
          (c) =>
              TvShowRepositoryImpl(c<TvShowRemoteSource>('TvShowRemoteSource')),
          name: 'TvShowRepository')
      ..registerFactory(
          (c) => DiscoverMovieBloc(c<MovieRepository>('MovieRepository')))
      ..registerFactory(
          (c) => DetailMovieBloc(c<MovieRepository>('MovieRepository')))
      ..registerFactory(
          (c) => DiscoverTvShowBloc(c<TvShowRepository>('TvShowRepository')))
      ..registerFactory(
          (c) => DetailTvShowBloc(c<TvShowRepository>('TvShowRepository')))
      ..registerFactory((c) =>
          HomeTrendingMovieBloc(c<TrendingRemoteSouce>('TrendingRemoteSouce')))
      ..registerFactory(
          (c) => HomeUpcomingMovieBloc(c<MovieRepository>('MovieRepository')))
      ..registerFactory((c) =>
          HomeDiscoverTvShowBloc(c<TvShowRepository>('TvShowRepository')))
      ..registerFactory(
          (c) => HomeDiscoverMovieBloc(c<MovieRepository>('MovieRepository')))
      ..registerFactory((c) => HomeBloc())
      ..registerFactory(
          (c) => UpcomingMovieBloc(c<MovieRepository>('MovieRepository')))
      ..registerFactory((c) =>
          TrendingMovieBloc(c<TrendingRemoteSouce>('TrendingRemoteSouce')));
  }
}
