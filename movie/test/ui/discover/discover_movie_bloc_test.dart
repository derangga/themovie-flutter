import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';
import 'package:movie/src/data/model/movie.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  MockMovieRepository movieRepository;
  final Logger logger = Logger();
  DiscoverMovieBloc movieBloc;
  setUp(() {
    movieRepository = MockMovieRepository();
    movieBloc = DiscoverMovieBloc(logger, movieRepository);
  });

  group('Test Discover Movie Bloc', () {
    test(
        'test get discover movie from bloc should called movieRepository.getDiscoverMovieRemote',
        () async {
      // given
      final movieResponse = Movies();

      // when
      when(movieRepository.getDiscoverMovieRemote(any))
          .thenAnswer((realInvocation) async => Right(movieResponse));

      movieBloc.add(GetDiscoverMovieEvent());
      await untilCalled(movieRepository.getDiscoverMovieRemote(1));

      // then
      verify(movieRepository.getDiscoverMovieRemote(1));
    });

    blocTest(
      'test get discover movie from bloc and emit success state',
      build: () {
        // given
        final movieResponse = Movies(results: [Movie()]);
        when(movieRepository.getDiscoverMovieRemote(any))
            .thenAnswer((realInvocation) async => Right(movieResponse));

        return movieBloc;
      },
      act: (bloc) => bloc.add(GetDiscoverMovieEvent()),
      expect: [isA<SuccessGetDiscoverMovieState>()],
    );

    blocTest(
      'test get discover movie from bloc and emit error state',
      build: () {
        // given
        final failure = Failure();
        when(movieRepository.getDiscoverMovieRemote(any))
            .thenAnswer((realInvocation) async => Left(failure));

        return movieBloc;
      },
      act: (bloc) => bloc.add(GetDiscoverMovieEvent()),
      expect: [isA<ErrorGetDiscoverMovieState>()],
    );
  });
}
