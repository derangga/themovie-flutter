import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:movie/movie.dart';
import 'package:movie/src/data/remote/endpoint.dart';
import 'package:movie/src/data/remote/movie_remote_source.dart';

import '../../fixture/fixture_reader.dart';

void main() {
  final Dio dio = Dio(DioOptions());
  final dioAdapterMock = DioAdapter();
  final Logger logger = Logger();
  MovieRemoteSource movieRemoteSource;
  setUp(() {
    dio.httpClientAdapter = dioAdapterMock;
    movieRemoteSource = MovieRemoteSourceImpl(dio, logger);
  });
  group('Get method', () {
    String url =
        '${Endpoint.DISCOVER_MOVIE}?api_key=null&sort_by=popularity.desc&page=1';
    test('test get discover movie and result success', () async {
      final responseJson = json.decode(readJsonFromFile('discover_movie.json'));

      dioAdapterMock.onGet(url).reply(200, responseJson);

      final response = await movieRemoteSource.getDiscoverMovie(1);
      expect(response.isRight(), true);
      response.fold((l) => null, (r) {
        expect(r.page, 1);
        expect(r.results.length, 1);
      });
    });

    test('test get discover movie and result failure', () async {
      final errorJson = jsonEncode({"message": "bad request"});

      dioAdapterMock.onGet(url).reply(400, errorJson);

      final response = await movieRemoteSource.getDiscoverMovie(1);
      expect(response.isLeft(), true);
      response.fold((l) {
        expect(l.code, 400);
        expect(l.dioError, DioErrorType.RESPONSE);
      }, (r) => null);
    });
  });
}
