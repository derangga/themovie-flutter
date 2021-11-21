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
      ..registerSingleton<LogPrinter>((c) => DefaultLogPrinter(),
          name: 'LogPrinter')
      ..registerSingleton<LogOutput>((c) => ConsoleOutput(), name: 'LogOutput')
      ..registerSingleton(
          (c) => AppLogger(c<LogFilter>('LogFilter'),
              c<LogPrinter>('LogPrinter'), c<LogOutput>('LogOutput')),
          name: 'AppLogger')
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
      ..registerSingleton<MovieRemoteSource>(
          (c) => MovieRemoteSourceImpl(c<Dio>('Dio')),
          name: 'MovieRemoteSource')
      ..registerSingleton<MovieRepository>(
          (c) => MovieRepositoryImpl(c<MovieRemoteSource>('MovieRemoteSource')),
          name: 'MovieRepository')
      ..registerSingleton<GenreRepository>(
          (c) => GenreRepositoryImpl(c<MovieRemoteSource>('MovieRemoteSource')),
          name: 'GenreRepository')
      ..registerSingleton<TvShowRemoteSource>(
          (c) => TvShowRemoteSourceImpl(c<Dio>('Dio')),
          name: 'TvShowRemoteSource')
      ..registerSingleton<TvShowRepository>(
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
          (c) => DetailTvShowBloc(c<TvShowRepository>('TvShowRepository')));
  }
}
