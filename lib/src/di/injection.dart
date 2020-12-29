import 'package:core/core.dart';
import 'package:kiwi/kiwi.dart';
import 'package:logger/logger.dart';
import 'package:movie/movie.dart';

part 'injection.g.dart';

abstract class Injection {
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
  @Register.singleton(MovieService, from: MovieServiceImpl)
  @Register.singleton(MovieRepository,
      from: MovieRepositoryImpl, resolvers: {MovieService: null})
  @Register.factory(DiscoverMovieBloc, resolvers: {MovieRepository: null})
  @Register.factory(DetailMovieBloc, resolvers: {MovieRepository: null})
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}
