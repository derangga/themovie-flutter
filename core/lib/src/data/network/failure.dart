import 'package:core/core.dart';
import 'package:dio/dio.dart';

class Failure {
  final dynamic errorBody;
  final int code;
  final DioErrorType dioError;
  String message;

  Failure({this.errorBody, this.code, this.dioError});
}

class SingleSourceFailure<T> {
  final T data;
  final String message;

  SingleSourceFailure({this.data, this.message});
}
