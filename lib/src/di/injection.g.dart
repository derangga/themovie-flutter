// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injection extends Injection {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => Preferences(c<FlutterSecureStorage>()));
    container.registerSingleton<LogFilter>((c) => DebugFilter());
    container.registerSingleton<LogPrinter>((c) => DefaultLogPrinter());
    container.registerSingleton<LogOutput>((c) => ConsoleOutput());
    container.registerSingleton((c) => Logger(
        filter: c<LogFilter>(),
        printer: c<LogPrinter>(),
        output: c<LogOutput>()));
    container.registerSingleton((c) => MovieDb());
    container.registerSingleton((c) => MovieDao(c<MovieDb>()));
    container.registerSingleton<BaseOptions>((c) => DioOptions());
    container.registerSingleton<Interceptor>((c) => LoggingInterceptor());
    container.registerSingleton((c) => DefaultHttpClientAdapter());
    container.registerSingleton<Dio>((c) => DioModule(
        c<BaseOptions>(), c<Interceptor>(), c<DefaultHttpClientAdapter>()));
    container.registerSingleton<MovieLocalSource>(
        (c) => MovieLocalSourceImpl(c<Logger>(), c<MovieDao>()));
    container.registerSingleton<MovieRemoteSource>(
        (c) => MovieRemoteSourceImpl(c<Dio>(), c<Logger>()));
    container.registerSingleton<TvShowRemoteSource>(
        (c) => TvShowRemoteSourceImpl(c<Dio>(), c<Logger>()));
    container.registerSingleton<TvShowRepository>(
        (c) => TvShowRepositoryImpl(c<Logger>(), c<TvShowRemoteSource>()));
    container.registerSingleton<MovieRepository>((c) => MovieRepositoryImpl(
        c<Logger>(), c<MovieRemoteSource>(), c<MovieLocalSource>()));
    container.registerFactory(
        (c) => DiscoverMovieBloc(c<Logger>(), c<MovieRepository>()));
    container.registerFactory(
        (c) => DetailMovieBloc(c<Logger>(), c<MovieRepository>()));
    container.registerFactory(
        (c) => DiscoverTvShowBloc(c<Logger>(), c<TvShowRepository>()));
  }
}
