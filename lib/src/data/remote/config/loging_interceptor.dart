import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class LoggingInterceptor extends Interceptor {
  final log = Logger('LoggingInterceptor');
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.severe(
      '<-- ${err.message} ${(err.response?.requestOptions != null ? (err.response?.requestOptions.path) : 'URL')}',
      err,
    );
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }
}
