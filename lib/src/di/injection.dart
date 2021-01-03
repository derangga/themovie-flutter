import 'package:core/core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie/movie.dart';

part 'injection.g.dart';

abstract class Injection {
  @Register.singleton(Preferences, resolvers: {FlutterSecureStorage:null})
  @Register.singleton(LogFilter, from: DebugFilter)
  @Register.singleton(LogPrinter, from: DefaultLogPrinter)
  @Register.singleton(LogOutput, from: ConsoleOutput)
  @Register.singleton(Logger,
      resolvers: {LogFilter: null, LogPrinter: null, LogOutput: null})
  @Register.singleton(MovieDb)
  @Register.singleton(MovieDao, resolvers: {MovieDb: null})
  @Register.singleton(BaseOptions, from: DioOptions)
  @Register.singleton(Interceptor, from: LoggingInterceptor)
  @Register.singleton(DefaultHttpClientAdapter)
  @Register.singleton(Dio, from: DioModule, resolvers: {
    BaseOptions: null,
    Interceptor: null,
    DefaultHttpClientAdapter: null
  })
  @Register.singleton(MovieLocalSource,
      from: MovieLocalSourceImpl, resolvers: {MovieDao: null})
  @Register.singleton(MovieRemoteSource,
      from: MovieRemoteSourceImpl, resolvers: {Logger: null})
  @Register.singleton(MovieRepository, from: MovieRepositoryImpl, resolvers: {
    MovieRemoteSource: null,
    MovieLocalSource: null
  })
  @Register.factory(DiscoverMovieBloc,
      resolvers: {MovieRepository: null, Logger: null})
  @Register.factory(DetailMovieBloc,
      resolvers: {MovieRepository: null, Logger: null})
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}
