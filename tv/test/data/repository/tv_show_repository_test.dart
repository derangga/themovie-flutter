import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/src/data/model/cast_and_crew.dart';
import 'package:tv/src/data/model/detail_tv_show.dart';
import 'package:tv/src/data/model/tv_show.dart';
import 'package:tv/src/data/repository/tv_show_repository.dart';
import 'package:tv/src/data/repository/tv_show_repository_impl.dart';

import '../../utils/dio_adapter_mock.dart';
import 'mock_tv_show_remote_source.dart';

void main() {
  final Dio dio = Dio(DioOptions());
  final Logger logger = Logger();
  DioAdapterMock dioAdapterMock;
  final MockTvShowRemoteSource mockTvShowRemoteSource =
      MockTvShowRemoteSource();
  TvShowRepository repository;

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
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    repository = TvShowRepositoryImpl(logger, mockTvShowRemoteSource);
  });

  group('test get discover tv show from repository', () {
    test('test get discover tv show from repository result success', () async {
      when(mockTvShowRemoteSource.getDiscoverTvShow(any))
          .thenAnswer((_) async => Right(tvShowResponse));

      final result = await repository.getDiscoverTvShow(1);
      expect(result.isRight(), true);
      expect(result.isLeft(), false);
      verify(mockTvShowRemoteSource.getDiscoverTvShow(1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });

    test('test get discover tv show from repository result failure', () async {
      when(mockTvShowRemoteSource.getDiscoverTvShow(any))
          .thenAnswer((_) async => Left(failure));
      final result = await repository.getDiscoverTvShow(1);
      expect(result.isRight(), false);
      expect(result.isLeft(), true);
      verify(mockTvShowRemoteSource.getDiscoverTvShow(1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });
  });

  group('test get detail tv show from repository', () {
    test('test get detail tv show from repository result success', () async {
      when(mockTvShowRemoteSource.getDetailTvShow(any))
          .thenAnswer((_) async => Right(detailTvShowResponse));

      final result = await repository.getDetailTvShow(1);
      expect(result.isRight(), true);
      expect(result.isLeft(), false);
      verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });

    test('test get discover tv show from repository result failure', () async {
      when(mockTvShowRemoteSource.getDetailTvShow(any))
          .thenAnswer((_) async => Left(failure));
      final result = await repository.getDetailTvShow(1);
      expect(result.isRight(), false);
      expect(result.isLeft(), true);
      verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });
  });

  group('test get cast and crew tv show from repository', () {
    test('test get cast and crew tv show from repository result success',
        () async {
      when(mockTvShowRemoteSource.getCastAndCrew(any))
          .thenAnswer((_) async => Right(castAndCrewResponse));

      final result = await repository.getCastAndCrew(1);
      expect(result.isRight(), true);
      expect(result.isLeft(), false);
      verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });

    test('test get cast and crew from repository result failure', () async {
      when(mockTvShowRemoteSource.getCastAndCrew(any))
          .thenAnswer((_) async => Left(failure));
      final result = await repository.getCastAndCrew(1);
      expect(result.isRight(), false);
      expect(result.isLeft(), true);
      verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });
  });

  group('test get similar tv show from repository', () {
    test('test get similar tv show from repository result success', () async {
      when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
          .thenAnswer((_) async => Right(tvShowResponse));

      final result = await repository.getSimilarTvShow(1, 1);
      expect(result.isRight(), true);
      expect(result.isLeft(), false);
      verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });

    test('test get similar tv show from repository result failure', () async {
      when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
          .thenAnswer((_) async => Left(failure));
      final result = await repository.getSimilarTvShow(1, 1);
      expect(result.isRight(), false);
      expect(result.isLeft(), true);
      verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });
  });

  group('test get detail tv show content from repository', () {
    test('test detail tv show content from repository result success',
        () async {
      when(mockTvShowRemoteSource.getDetailTvShow(any))
          .thenAnswer((_) async => Right(detailTvShowResponse));

      when(mockTvShowRemoteSource.getCastAndCrew(any))
          .thenAnswer((_) async => Right(castAndCrewResponse));

      when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
          .thenAnswer((_) async => Right(tvShowResponse));

      final result = await repository.getDetailTvShowContent(1);

      expect(result.isRight(), true);
      expect(result.isLeft(), false);
      result.fold((failure) {
        expect(failure, null);
      }, (success) {
        expect(success.detailTvShow, detailTvShowResponse);
        expect(success.castsTvShow, castAndCrewResponse);
        expect(success.similarTvShow, tvShowResponse);
      });

      verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
      verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
      verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });

    test(
        'test get detail tv show content from repository result detail tv show failure',
        () async {
      when(mockTvShowRemoteSource.getDetailTvShow(any))
          .thenAnswer((_) async => Left(failure));

      when(mockTvShowRemoteSource.getCastAndCrew(any))
          .thenAnswer((_) async => Right(castAndCrewResponse));

      when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
          .thenAnswer((_) async => Right(tvShowResponse));

      final result = await repository.getDetailTvShowContent(1);

      expect(result.isLeft(), true);

      result.fold((failure) {
        expect(failure.message, 'Failed get detail tv show');
      }, (success) {
        expect(success, null);
      });

      verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
      verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
      verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });

    test(
        'test get detail tv show content from repository result cast and crew tv show failure',
        () async {
      when(mockTvShowRemoteSource.getDetailTvShow(any))
          .thenAnswer((_) async => Right(detailTvShowResponse));

      when(mockTvShowRemoteSource.getCastAndCrew(any))
          .thenAnswer((_) async => Left(failure));

      when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
          .thenAnswer((_) async => Right(tvShowResponse));

      final result = await repository.getDetailTvShowContent(1);

      expect(result.isLeft(), true);

      result.fold((failure) {
        expect(failure.message, 'Failed get casts and crew tv show');
      }, (success) {
        expect(success, null);
      });

      verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
      verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
      verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });

    test(
        'test get detail tv show content from repository result similar tv show failure',
        () async {
      when(mockTvShowRemoteSource.getDetailTvShow(any))
          .thenAnswer((_) async => Right(detailTvShowResponse));

      when(mockTvShowRemoteSource.getCastAndCrew(any))
          .thenAnswer((_) async => Right(castAndCrewResponse));

      when(mockTvShowRemoteSource.getSimilarTvShow(any, any))
          .thenAnswer((_) async => Left(failure));

      final result = await repository.getDetailTvShowContent(1);

      expect(result.isLeft(), true);

      result.fold((failure) {
        expect(failure.message, 'Failed get similar tv show');
      }, (success) {
        expect(success, null);
      });

      verify(mockTvShowRemoteSource.getDetailTvShow(1)).called(1);
      verify(mockTvShowRemoteSource.getCastAndCrew(1)).called(1);
      verify(mockTvShowRemoteSource.getSimilarTvShow(1, 1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });
  });
}
