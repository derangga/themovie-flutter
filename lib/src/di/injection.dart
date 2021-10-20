import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kiwi/kiwi.dart';
import 'package:logger/logger.dart';
import 'package:themovie_flutter/src/data/config/dio_module.dart';
import 'package:themovie_flutter/src/data/config/loging_interceptor.dart';
import 'package:themovie_flutter/src/data/local/preferences/preferences.dart';
import 'package:themovie_flutter/src/data/remote/movie_remote_source.dart';
import 'package:themovie_flutter/src/data/remote/movie_remote_source_impl.dart';
import 'package:themovie_flutter/src/data/remote/tv_show_remote_source.dart';
import 'package:themovie_flutter/src/data/remote/tv_show_remote_source_impl.dart';
import 'package:themovie_flutter/src/domain/genre_repository.dart';
import 'package:themovie_flutter/src/domain/genre_repository_impl.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/domain/movie_repository_impl.dart';
import 'package:themovie_flutter/src/domain/tv_show_repository.dart';
import 'package:themovie_flutter/src/domain/tv_show_repository_impl.dart';
import 'package:themovie_flutter/src/feature/movie/detail/detail_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/movie/discover/discover_movie_bloc.dart';
import 'package:themovie_flutter/src/feature/tv_show/detail/detail_tv_show_bloc.dart';
import 'package:themovie_flutter/src/feature/tv_show/discover/discover_tv_show_bloc.dart';
import 'package:themovie_flutter/src/logger/default_prety_printer.dart';

part 'injection.g.dart';

abstract class Injection {
  @Register.singleton(Preferences, resolvers: {FlutterSecureStorage: null})
  @Register.singleton(LogFilter, from: DebugFilter)
  @Register.singleton(LogPrinter, from: DefaultLogPrinter)
  @Register.singleton(LogOutput, from: ConsoleOutput)
  @Register.singleton(Logger,
      resolvers: {LogFilter: null, LogPrinter: null, LogOutput: null})
  @Register.singleton(BaseOptions, from: DioOptions)
  @Register.singleton(Interceptor, from: LoggingInterceptor)
  @Register.singleton(DefaultHttpClientAdapter)
  @Register.singleton(Dio, from: DioModule, resolvers: {
    BaseOptions: null,
    Interceptor: null,
    DefaultHttpClientAdapter: null
  })
  @Register.singleton(MovieRemoteSource,
      from: MovieRemoteSourceImpl, resolvers: {Logger: null})
  @Register.singleton(MovieRepository,
      from: MovieRepositoryImpl, resolvers: {MovieRemoteSource: null})
  @Register.singleton(GenreRepository,
      from: GenreRepositoryImpl, resolvers: {MovieRemoteSource: null})
  @Register.singleton(TvShowRemoteSource, from: TvShowRemoteSourceImpl)
  @Register.singleton(TvShowRepository, from: TvShowRepositoryImpl)
  @Register.factory(DiscoverMovieBloc,
      resolvers: {MovieRepository: null, Logger: null})
  @Register.factory(DetailMovieBloc,
      resolvers: {MovieRepository: null, Logger: null})
  @Register.factory(DiscoverTvShowBloc,
      resolvers: {TvShowRepository: null, Logger: null})
  @Register.factory(DetailTvShowBloc,
      resolvers: {TvShowRepository: null, Logger: null})
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}
