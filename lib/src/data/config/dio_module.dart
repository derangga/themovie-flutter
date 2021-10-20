import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';

class DioModule with DioMixin implements Dio {
  DioModule(BaseOptions setup, Interceptor interceptor,
      DefaultHttpClientAdapter adapter)
      : assert(setup != null),
        assert(interceptor != null),
        assert(adapter != null) {
    options = setup;
    interceptors.add(interceptor);
    httpClientAdapter = adapter;
  }
}

class DioOptions extends BaseOptions {
  DioOptions()
      : super(
            baseUrl: "${FlutterConfig.get('API_GATWAY')}",
            contentType: Headers.jsonContentType,
            connectTimeout: 60000,
            sendTimeout: 60000,
            receiveTimeout: 60000);
}
