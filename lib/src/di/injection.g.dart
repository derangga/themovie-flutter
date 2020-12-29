// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injection extends Injection {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<LogFilter>((c) => DebugFilter());
    container.registerSingleton<LogPrinter>((c) => DefaultLogPrinter());
    container.registerSingleton<LogOutput>((c) => ConsoleOutput());
    container.registerSingleton((c) => Logger(
        filter: c<LogFilter>(),
        printer: c<LogPrinter>(),
        output: c<LogOutput>()));
    container.registerSingleton<BaseOptions>((c) => DioOptions());
    container.registerSingleton<Interceptor>((c) => LoggingInterceptor());
    container.registerSingleton((c) => DefaultHttpClientAdapter());
    container.registerSingleton<Dio>((c) => DioModule(
        c<BaseOptions>(), c<Interceptor>(), c<DefaultHttpClientAdapter>()));
    container.registerSingleton<MovieRemoteSource>(
        (c) => MovieRemoteSourceImpl(c<Dio>()));
    container.registerSingleton<MovieRepository>(
        (c) => MovieRepositoryImpl(c<MovieRemoteSource>()));
    container.registerFactory((c) => DiscoverMovieBloc(c<MovieRepository>()));
    container.registerFactory((c) => DetailMovieBloc(c<MovieRepository>()));
  }
}
