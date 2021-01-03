import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';
import 'package:movie/src/data/model/movie.dart';

import '../../utils/dio_adapter_mock.dart';

class MockMovieRemoteSource extends Mock implements MovieRemoteSource {}

class MockMovieLocalSource extends Mock implements MovieLocalSource {}

void main() {
  final Dio dio = Dio(DioOptions());
  final MockMovieRemoteSource mockRemoteSource = MockMovieRemoteSource();
  final MockMovieLocalSource mockLocalSource = MockMovieLocalSource();
  final Logger logger = Logger();
  DioAdapterMock dioAdapterMock;
  MovieRepository movieRepository;

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    movieRepository =
        MovieRepositoryImpl(logger, mockRemoteSource, mockLocalSource);
  });

  group('test get discover movie from repository', () {
    test('test get discover movie from repository result success', () async {
      final movieResponse = Movies();

      when(mockRemoteSource.getDiscoverMovie(any))
          .thenAnswer((realInvocation) async => Right(movieResponse));

      final result = await movieRepository.getDiscoverMovieRemote(1);
      expect(result, Right(movieResponse));
      verify(mockRemoteSource.getDiscoverMovie(1));
      verifyNoMoreInteractions(mockRemoteSource);
    });

    test('test get discover movie from respository result failure', () async {
      final failure = Failure();

      when(mockRemoteSource.getDiscoverMovie(any))
          .thenAnswer((realInvocation) async => Left(failure));

      final result = await movieRepository.getDiscoverMovieRemote(1);
      expect(result, Left(failure));
      verify(mockRemoteSource.getDiscoverMovie(1));
      verifyNoMoreInteractions(mockRemoteSource);
    });
  });
}
