// import 'package:core/core.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:movie/movie.dart';
// import 'package:movie/src/data/model/genre.dart';
// import 'package:movie/src/data/model/movie.dart';

// import '../../utils/dio_adapter_mock.dart';

// class MockMovieRemoteSource extends Mock implements MovieRemoteSource {}

// class MockGenreMovieLocalSource extends Mock implements GenreMovieLocalSource {}

// void main() {
//   final Dio dio = Dio(DioOptions());
//   final MockMovieRemoteSource mockRemoteSource = MockMovieRemoteSource();
//   final MockGenreMovieLocalSource mockLocalSource = MockGenreMovieLocalSource();
//   final Logger logger = Logger();
//   DioAdapterMock dioAdapterMock;
//   GenreRepository movieRepository;

//   setUp(() {
//     dioAdapterMock = DioAdapterMock();
//     dio.httpClientAdapter = dioAdapterMock;
//     movieRepository =
//         GenreRepositoryImpl(logger, mockRemoteSource, mockLocalSource);
//   });

//   group('test get genre movie from repository', () {
//     test('test get genre movie from repository result success', () async {
//       final movieResponse =
//       ListGenre(data: [Genre()]);

//       when(mockRemoteSource.getGenreMovie())
//           .thenAnswer((realInvocation) async => Right(movieResponse));

//       final result = await movieRepository.getGenreMovieRemote();
//       expect(result, Right(movieResponse));
//       verify(mockRemoteSource.getGenreMovie());
//       verifyNoMoreInteractions(mockRemoteSource);
//     });

//     test('test get genre movie from respository result failure', () async {
//       final failure = Failure();

//       when(mockRemoteSource.getGenreMovie())
//           .thenAnswer((realInvocation) async => Left(failure));

//       final result = await movieRepository.getGenreMovieRemote();
//       expect(result, Left(failure));
//       verify(mockRemoteSource.getGenreMovie());
//       verifyNoMoreInteractions(mockRemoteSource);
//     });
//   });
// }
