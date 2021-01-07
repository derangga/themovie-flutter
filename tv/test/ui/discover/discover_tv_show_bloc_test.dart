import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/src/data/model/tv_show.dart';
import 'package:tv/src/data/repository/tv_show_repository.dart';
import 'package:tv/src/ui/discover/discover_tv_show_bloc.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() {
  MockTvShowRepository tvShowRepository;
  final Logger logger = Logger();
  DiscoverTvShowBloc tvBloc;
  final tvShowResponse = [
    TvShow(
        id: 0,
        name: '',
        originalName: '',
        originalLanguage: '',
        backdropPath: '',
        posterPath: '',
        firstAirDate: '',
        overview: '',
        popularity: 0,
        voteAverage: '',
        voteCount: 0)
  ];

  setUp(() {
    tvShowRepository = MockTvShowRepository();
    tvBloc = DiscoverTvShowBloc(logger, tvShowRepository);
  });

  group('test get discover tv show from bloc', () {
    test(
        'test get discover tv show from bloc should called tvShowRepository.getDiscoverTvShow',
        () async {
      when(tvShowRepository.getDiscoverTvShow(any))
          .thenAnswer((_) async => Right(tvShowResponse));

      tvBloc.add(GetFirstPageTvShowEvent());
      await untilCalled(tvShowRepository.getDiscoverTvShow(1));

      verify(tvShowRepository.getDiscoverTvShow(1)).called(1);
    });
    blocTest('test get discover tv show from bloc and emit success state',
        build: () {
          when(tvShowRepository.getDiscoverTvShow(any))
              .thenAnswer((_) async => Right(tvShowResponse));

          return tvBloc;
        },
        act: (bloc) => bloc.add(GetFirstPageTvShowEvent()),
        wait: const Duration(milliseconds: 500),
        expect: [
          isA<LoadingFirstPageState>(),
          isA<SuccessGetDiscoverTvShowState>()
        ],
        verify: (_) {
          verify(tvShowRepository.getDiscoverTvShow(1)).called(1);
        });

    blocTest('test get discover tv show from bloc and emit error state',
        build: () {
          when(tvShowRepository.getDiscoverTvShow(any))
              .thenAnswer((_) async => Left(Failure()));

          return tvBloc;
        },
        act: (bloc) => bloc.add(GetFirstPageTvShowEvent()),
        wait: const Duration(milliseconds: 500),
        expect: [
          isA<LoadingFirstPageState>(),
          isA<ErrorGetFirstPageTvShowState>()
        ],
        verify: (_) {
          verify(tvShowRepository.getDiscoverTvShow(1)).called(1);
        });
  });
}
