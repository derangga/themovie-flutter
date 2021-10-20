import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';
import 'package:movie/src/data/remote/movie_remote_source.dart';

import '../../fixture/fixture_reader.dart';
import '../../utils/dio_adapter_mock.dart';

void main() {
  final Dio dio = Dio(DioOptions());
  final Logger logger = Logger();
  DioAdapterMock dioAdapterMock;
  MovieRemoteSource movieRemoteSource;
  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    movieRemoteSource = MovieRemoteSourceImpl(dio, logger);
  });
  group('test get genre movie from remote source', () {
    test('test get genre movie and result success', () async {
      final responseJson = readJsonFromFile('genre_movie.json');

      final httpResponse = ResponseBody.fromString(
        responseJson,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await movieRemoteSource.getGenreMovie();
      expect(response.isRight(), true);
    });

    test('test get genre movie and result failure', () async {
      final errorJson = jsonEncode({"message": "bad request"});

      final httpResponse = ResponseBody.fromString(
        errorJson,
        400,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await movieRemoteSource.getGenreMovie();
      expect(response.isLeft(), true);
    });
  });
}
