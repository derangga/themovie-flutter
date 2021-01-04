import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/src/data/model/tv_show.dart';
import 'package:tv/src/data/remote/tv_show_remote_source.dart';
import 'package:tv/src/data/repository/tv_show_repository.dart';
import 'package:tv/src/data/repository/tv_show_repository_impl.dart';

import '../../utils/dio_adapter_mock.dart';

class MockTvShowRemoteSource extends Mock implements TvShowRemoteSource {}

void main() {
  final Dio dio = Dio(DioOptions());
  final Logger logger = Logger();
  DioAdapterMock dioAdapterMock;
  final MockTvShowRemoteSource mockTvShowRemoteSource =
      MockTvShowRemoteSource();
  TvShowRepository repository;

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    repository = TvShowRepositoryImpl(logger, mockTvShowRemoteSource);
  });

  group('test get discover tv show from repository', () {
    test('test get discover tv show from repository result success', () async {
      final tvShowResponse = PagingModel(data: [
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
      ], page: 1, totalPage: 1, totalResults: 1);
      when(mockTvShowRemoteSource.getDiscoverTvShow(1))
          .thenAnswer((_) async => Right(tvShowResponse));

      final result = await repository.getDiscoverTvShow(1);
      expect(result, Right(tvShowResponse));
      verify(mockTvShowRemoteSource.getDiscoverTvShow(1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });

    test('test get discover movie from repository result failure', () async {
      final failure = Failure();

      when(mockTvShowRemoteSource.getDiscoverTvShow(any))
          .thenAnswer((_) async => Left(failure));
      final result = await repository.getDiscoverTvShow(1);
      expect(result, Left(failure));
      verify(mockTvShowRemoteSource.getDiscoverTvShow(1)).called(1);
      verifyNoMoreInteractions(mockTvShowRemoteSource);
    });
  });
}
