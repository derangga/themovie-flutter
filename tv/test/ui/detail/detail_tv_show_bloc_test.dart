import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/src/data/model/cast_and_crew.dart';
import 'package:tv/src/data/model/detail_tv_show.dart';
import 'package:tv/src/data/model/tv_show.dart';
import 'package:tv/src/data/repository/tv_show_repository.dart';
import 'package:tv/src/data/repository/tv_show_repository_impl.dart';
import 'package:tv/src/ui/detail/detail_tv_show_bloc.dart';

import '../../data/repository/mock_tv_show_remote_source.dart';

void main() {
  MockTvShowRemoteSource mockTvShowRemoteSource = MockTvShowRemoteSource();
  TvShowRepository tvShowRepository;
  final Logger logger = Logger();
  DetailTvShowBloc detailBloc;

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

  final detailTvShowResponse = DetailTvShow(
      backdropPath: "",
      firstAirDate: "",
      genres: [],
      homepage: "",
      id: 0,
      inProduction: false,
      lastAirDate: "",
      name: "",
      numberOfEpisodes: 0,
      numberOfSeasons: 0,
      originalLanguage: "",
      originalName: "",
      overview: "",
      popularity: 0,
      posterPath: "",
      seasons: [],
      status: "",
      tagline: "",
      type: "",
      voteAverage: "",
      voteCount: 0);

  final castAndCrewResponse = [
    Cast(
      character: "",
      creditId: "",
      id: 0,
      name: "",
      originalName: "",
      popularity: 0,
      profilePath: "",
    )
  ];

  final failure = Failure();

  setUp(() {
    tvShowRepository = TvShowRepositoryImpl(logger, mockTvShowRemoteSource);
    detailBloc = DetailTvShowBloc(logger, tvShowRepository);
  });

  group('test get detail tv show from bloc', () {
    blocTest('test get detail tv show and emit SuccessGetDetailTvShowState',
        build: () {
          when(mockTvShowRemoteSource.getDetailTvShow(any))
              .thenAnswer((_) async => Right(detailTvShowResponse));

          when(mockTvShowRemoteSource.getCastAndCrew(any))
              .thenAnswer((_) async => Right(castAndCrewResponse));

          when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
              .thenAnswer((_) async => Right(tvShowResponse));

          return detailBloc;
        },
        act: (bloc) => bloc.add(GetDetailTvShowEvent(1)),
        expect: [isA<LoadingState>(), isA<SuccessGetDetailTvShowState>()],
        verify: (_) {
          verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
          verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
          verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
        });

    blocTest('test get detail tv show and error get DetailTvShow',
        build: () {
          when(mockTvShowRemoteSource.getDetailTvShow(any))
              .thenAnswer((_) async => Left(failure));

          when(mockTvShowRemoteSource.getCastAndCrew(any))
              .thenAnswer((_) async => Right(castAndCrewResponse));

          when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
              .thenAnswer((_) async => Right(tvShowResponse));

          return detailBloc;
        },
        act: (bloc) => bloc.add(GetDetailTvShowEvent(1)),
        expect: [isA<LoadingState>(), isA<ErrorGetDetailTvShowState>()],
        verify: (_) {
          verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
          verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
          verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
        });

    blocTest('test get detail tv show and error get Cast and Crew',
        build: () {
          when(mockTvShowRemoteSource.getDetailTvShow(any))
              .thenAnswer((_) async => Right(detailTvShowResponse));

          when(mockTvShowRemoteSource.getCastAndCrew(any))
              .thenAnswer((_) async => Left(failure));

          when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
              .thenAnswer((_) async => Right(tvShowResponse));

          return detailBloc;
        },
        act: (bloc) => bloc.add(GetDetailTvShowEvent(1)),
        expect: [isA<LoadingState>(), isA<ErrorGetDetailTvShowState>()],
        verify: (_) {
          verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
          verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
          verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
        });

    blocTest('test get detail tv show and error get Similar Tv Show',
        build: () {
          when(mockTvShowRemoteSource.getDetailTvShow(any))
              .thenAnswer((_) async => Right(detailTvShowResponse));

          when(mockTvShowRemoteSource.getCastAndCrew(any))
              .thenAnswer((_) async => Right(castAndCrewResponse));

          when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
              .thenAnswer((_) async => Left(failure));

          return detailBloc;
        },
        act: (bloc) => bloc.add(GetDetailTvShowEvent(1)),
        expect: [isA<LoadingState>(), isA<ErrorGetDetailTvShowState>()],
        verify: (_) {
          verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
          verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
          verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
        });
  });
}
