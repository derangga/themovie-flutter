import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/src/data/remote/tv_show_remote_source.dart';
import 'package:tv/src/data/remote/tv_show_remote_source_impl.dart';

import '../../../tv/test/fixture/fixture_reader.dart';
import '../../../tv/test/utils/dio_adapter_mock.dart';

void main() {
  final Dio dio = Dio(DioOptions());
  final Logger logger = Logger();
  DioAdapterMock dioAdapterMock;
  TvShowRemoteSource tvShowRemoteSource;

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    tvShowRemoteSource = TvShowRemoteSourceImpl(dio, logger);
  });

  group('test get discover tv show from remote source', () {
    test('test get discover tv show and result success', () async {
      final responseJson = readJsonFromFile('discover_tv_show.json');
      final httpResponse = ResponseBody.fromString(responseJson, 200, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tvShowRemoteSource.getDiscoverTvShow(1);
      expect(response.isRight(), true);
    });

    test('test get discover tv show and result failure', () async {
      final errorJson = jsonEncode({"message": "bad request"});

      final httpResponse = ResponseBody.fromString(errorJson, 400, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType]
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tvShowRemoteSource.getDiscoverTvShow(1);
      expect(response.isLeft(), true);
    });
  });

  group('test get detail tv show from remote source', () {
    test('test get detail tv show and result success', () async {
      final responseJson = readJsonFromFile('detail_tv_show.json');
      final httpResponse = ResponseBody.fromString(responseJson, 200, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tvShowRemoteSource.getDetailTvShow(1);
      expect(response.isRight(), true);
    });

    test('test get detail tv show and result failure', () async {
      final errorJson = jsonEncode({"message": "bad request"});
      final httpResponse = ResponseBody.fromString(errorJson, 400, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType]
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tvShowRemoteSource.getDetailTvShow(1);
      expect(response.isLeft(), true);
    });
  });

  group('test get cast and crew from remote source', () {
    test('test get cast and crew and result success', () async {
      final responseJson = readJsonFromFile('cast_and_crew.json');
      final httpResponse = ResponseBody.fromString(responseJson, 200, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tvShowRemoteSource.getCastAndCrew(1);
      expect(response.isRight(), true);
    });

    test('test get cast and crew and result failure', () async {
      final errorJson = jsonEncode({"message": "bad request"});

      final httpResponse = ResponseBody.fromString(errorJson, 400, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType]
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tvShowRemoteSource.getCastAndCrew(1);
      expect(response.isLeft(), true);
    });
  });

  group('test get similar tv show from remote source', () {
    test('test get similar tv show and result success', () async {
      final responseJson = readJsonFromFile('similar_tv_show.json');
      final httpResponse = ResponseBody.fromString(responseJson, 200, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tvShowRemoteSource.getSimilarTvShow(1, 1);
      expect(response.isRight(), true);
    });

    test('test get similar tv show and result failure', () async {
      final errorJson = jsonEncode({"message": "bad request"});

      final httpResponse = ResponseBody.fromString(errorJson, 400, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType]
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tvShowRemoteSource.getSimilarTvShow(1, 1);
      expect(response.isLeft(), true);
    });
  });
}
