import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';

import 'network_function.dart';
import 'failure.dart';

abstract class BaseRemote {
  final Dio _dio;
  final String token = FlutterConfig.get('TMDB_SECRET_KEY');

  BaseRemote(this._dio);

  Future<Either<Failure, T>> get<T>(String endpoint,
      {Map<String, String> headers,
      @required ResponseConverter<T> converter}) async {
    Options opsi = Options(headers: headers);
    var response = await callApi(_dio.get(endpoint, options: opsi), converter);
    return response;
  }

  Future<Either<Failure, T>> post<T>(String endpoint,
      {Map<String, dynamic> headers,
      Map<String, dynamic> body,
      ResponseConverter<T> converter}) async {
    Options opsi = Options(headers: headers);
    var response = await callApi<T>(
        _dio.post(endpoint, data: body, options: opsi), converter);
    return response;
  }

  Future<Either<Failure, T>> put<T>(
    String endpoint, {
    Map<String, dynamic> headers,
    Map<String, dynamic> body,
    ResponseConverter<T> converter,
  }) async {
    Options opsi = Options(headers: headers);
    var response =
        await callApi(_dio.put(endpoint, data: body, options: opsi), converter);
    return response;
  }

  Future<Either<Failure, T>> delete<T>(
    String endpoint, {
    Map<String, String> headers,
    Map<String, dynamic> body,
    ResponseConverter<T> converter,
  }) async {
    Options opsi = Options(headers: headers);
    var response = await callApi(
        _dio.delete(endpoint, data: body, options: opsi), converter);
    return response;
  }
}
