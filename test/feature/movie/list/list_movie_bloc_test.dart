import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';
import 'package:movie/src/data/model/genre.dart';
import 'package:movie/src/data/model/movie.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

class MockGenreMovieRepository extends Mock implements GenreRepository {}

void main() {
  MockMovieRepository movieRepository;
  MockGenreMovieRepository genreMovieRepository;
  final Logger logger = Logger();
  ListMovieBloc movieBloc;
  setUp(() {
    movieRepository = MockMovieRepository();
    genreMovieRepository = MockGenreMovieRepository();
    movieBloc = ListMovieBloc(logger, movieRepository, genreMovieRepository);
  });

  group('Test List Movie Bloc', () {
    test(
        'test get list movie from bloc should called movieRepository.ListMovieRemote',
        () async {
      // given
      final movieResponse =
          PagingModel(data: [Movie()], page: 1, totalPage: 1, totalResults: 1);

      // when
      when(movieRepository.getDiscoverMovieRemote(any))
          .thenAnswer((realInvocation) async => Right(movieResponse));

      movieBloc.add(GetListMovieEvent());
      await untilCalled(movieRepository.getDiscoverMovieRemote(1));

      // then
      verify(movieRepository.getDiscoverMovieRemote(1));
    });

    blocTest('test get list movie from bloc and emit success state',
        build: () {
          // given
          final movieResponse = PagingModel(
              data: [Movie()], page: 1, totalPage: 1, totalResults: 1);
          when(movieRepository.getDiscoverMovieRemote(any))
              .thenAnswer((realInvocation) async => Right(movieResponse));

          return movieBloc;
        },
        act: (bloc) => bloc.add(GetListMovieEvent()),
        wait: const Duration(milliseconds: 500),
        expect: [isA<GetListMoviesState>()],
        verify: (_) {
          verify(movieRepository.getDiscoverMovieRemote(1)).called(1);
        });

    blocTest(
      'test get list movie from bloc and emit error state',
      build: () {
        // given
        final failure = Failure();
        when(movieRepository.getDiscoverMovieRemote(any))
            .thenAnswer((realInvocation) async => Left(failure));

        return movieBloc;
      },
      act: (bloc) => bloc.add(GetListMovieEvent()),
      expect: [isA<ErrorGetListMovieState>()],
    );
  });

  group('Test Genre Movie Bloc', () {
    test(
        'test get genre movie from bloc should called movieRepository.GenreMovieRemote',
        () async {
      // given
      final movieResponse = ListGenre(data: [Genre()]);

      // when
      when(genreMovieRepository.getGenreMovieRemote())
          .thenAnswer((realInvocation) async => Right(movieResponse));

      movieBloc.add(GetGenreMovieEvent());
      await untilCalled(genreMovieRepository.getGenreMovieRemote());

      // then
      verify(genreMovieRepository.getGenreMovieRemote());
    });

    blocTest('test get genre movie from bloc and emit success state',
        build: () {
          // given
          final movieResponse = ListGenre(data: [Genre()]);
          when(genreMovieRepository.getGenreMovieRemote())
              .thenAnswer((realInvocation) async => Right(movieResponse));

          return movieBloc;
        },
        act: (bloc) => bloc.add(GetGenreMovieEvent()),
        wait: const Duration(milliseconds: 500),
        expect: [isA<SuccessGenreMovieState>()],
        verify: (_) {
          verify(genreMovieRepository.getGenreMovieRemote()).called(1);
        });

    blocTest('test get genre movie from bloc and emit error state',
        build: () {
          // given
          final failure = Failure();
          when(genreMovieRepository.getGenreMovieRemote())
              .thenAnswer((realInvocation) async => Left(failure));

          return movieBloc;
        },
        act: (bloc) => bloc.add(GetGenreMovieEvent()),
        wait: const Duration(milliseconds: 500),
        expect: [isA<ErrorGenreMovieState>()],
        verify: (_) {
          verify(genreMovieRepository.getGenreMovieRemote()).called(1);
        });
  });
}
