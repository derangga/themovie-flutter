import 'package:core/core.dart';
import 'package:dio/dio.dart';

class Failure extends Equatable {
  final dynamic errorBody;
  final int code;
  final DioErrorType dioError;

  Failure({this.errorBody, this.code, this.dioError});

  @override
  List<Object> get props => [errorBody, code, dioError];
}

class SingleSourceFailure<T> {
  final T data;
  final String message;

  SingleSourceFailure({this.data, this.message});
}
