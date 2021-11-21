import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';
import '../../logger/app_logger.dart';
import '../config/failure.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

abstract class BaseRemote {
  final Dio _dio;
  final AppLogger _logger;
  final String? token = FlutterConfig.get('TMDB_SECRET_KEY');

  BaseRemote(this._dio, this._logger);

  void logDebug(String message) {
    _logger.d("$runtimeType : $message");
  }

  void logInfo(String message) {
    _logger.i("$runtimeType : $message");
  }

  void logError(String message) {
    _logger.e("$runtimeType : $message");
  }

  void logWarning(String message) {
    _logger.w("$runtimeType : $message");
  }

  Future<Either<Failure, T>> get<T>(String endpoint,
      {Map<String, String>? headers,
      required ResponseConverter<T> converter}) async {
    Options opsi = Options(headers: headers);
    var response = await _callApi(_dio.get(endpoint, options: opsi), converter);
    return response;
  }

  Future<Either<Failure, T>> post<T>(String endpoint,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? body,
      required ResponseConverter<T> converter}) async {
    Options opsi = Options(headers: headers);
    var response = await _callApi<T>(
        _dio.post(endpoint, data: body, options: opsi), converter);
    return response;
  }

  Future<Either<Failure, T>> put<T>(
    String endpoint, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    required ResponseConverter<T> converter,
  }) async {
    Options opsi = Options(headers: headers);
    var response = await _callApi(
        _dio.put(endpoint, data: body, options: opsi), converter);
    return response;
  }

  Future<Either<Failure, T>> delete<T>(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required ResponseConverter<T> converter,
  }) async {
    Options opsi = Options(headers: headers);
    var response = await _callApi(
        _dio.delete(endpoint, data: body, options: opsi), converter);
    return response;
  }

  Future<Either<Failure, T>> _callApi<T>(
      Future<Response<dynamic>> call, ResponseConverter<T> converter) async {
    try {
      var response = await call;
      var transform = converter(response.data);
      return Right(transform);
    } on DioError catch (e) {
      return Left(Failure(
          dioError: e.type,
          code: e.response?.statusCode,
          errorBody: e.response?.data));
    }
  }
}
