import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'failure.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

Future<Either<Failure, S>> callApi<S>(
    Future<Response<dynamic>> call, ResponseConverter<S> converter) async {
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
