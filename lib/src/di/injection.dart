import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:logger/logger.dart';
import 'package:themovie_flutter/src/data/config/dio_module.dart';
import 'package:themovie_flutter/src/data/config/loging_interceptor.dart';
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
import 'package:themovie_flutter/src/logger/app_logger.dart';
import 'package:themovie_flutter/src/logger/default_prety_printer.dart';

part 'injection.g.dart';

abstract class Injection {
  @Register.singleton(LogFilter, from: DevelopmentFilter, name: 'LogFilter')
  @Register.singleton(LogPrinter, from: DefaultLogPrinter, name: 'LogPrinter')
  @Register.singleton(LogOutput, from: ConsoleOutput, name: 'LogOutput')
  @Register.singleton(AppLogger, name: 'AppLogger', resolvers: {
    LogFilter: 'LogFilter',
    LogPrinter: 'LogPrinter',
    LogOutput: 'LogOutput'
  })
  @Register.singleton(BaseOptions, from: DioOptions, name: 'BaseOptions')
  @Register.singleton(Interceptor,
      from: LoggingInterceptor, name: 'Interceptor')
  @Register.singleton(DefaultHttpClientAdapter,
      name: 'DefaultHttpClientAdapter')
  @Register.singleton(Dio, from: DioModule, resolvers: {
    BaseOptions: 'BaseOptions',
    Interceptor: 'Interceptor',
    DefaultHttpClientAdapter: 'DefaultHttpClientAdapter'
  })
  @Register.singleton(MovieRemoteSource,
      from: MovieRemoteSourceImpl,
      resolvers: {AppLogger: 'AppLogger'},
      name: 'MovieRemoteSource')
  @Register.singleton(MovieRepository,
      from: MovieRepositoryImpl,
      resolvers: {
        MovieRemoteSource: 'MovieRemoteSource',
        AppLogger: 'AppLogger'
      },
      name: 'MovieRepository')
  @Register.singleton(GenreRepository,
      from: GenreRepositoryImpl,
      resolvers: {
        MovieRemoteSource: 'MovieRemoteSource',
        AppLogger: 'AppLogger'
      },
      name: 'GenreRepository')
  @Register.singleton(TvShowRemoteSource,
      from: TvShowRemoteSourceImpl,
      resolvers: {Dio: 'Dio', AppLogger: 'AppLogger'},
      name: 'TvShowRemoteSource')
  @Register.singleton(TvShowRepository,
      from: TvShowRepositoryImpl,
      resolvers: {
        AppLogger: 'AppLogger',
        TvShowRemoteSource: 'TvShowRemoteSource'
      },
      name: 'TvShowRepository')
  @Register.factory(DiscoverMovieBloc,
      resolvers: {MovieRepository: 'MovieRepository', AppLogger: 'AppLogger'})
  @Register.factory(DetailMovieBloc,
      resolvers: {MovieRepository: 'MovieRepository', AppLogger: 'AppLogger'})
  @Register.factory(DiscoverTvShowBloc,
      resolvers: {TvShowRepository: 'TvShowRepository', AppLogger: 'AppLogger'})
  @Register.factory(DetailTvShowBloc,
      resolvers: {TvShowRepository: 'TvShowRepository', AppLogger: 'AppLogger'})
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}
