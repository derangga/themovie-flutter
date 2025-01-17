import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioModule with DioMixin implements Dio {
  DioModule(
    BaseOptions setup,
    Interceptor interceptor,
    HttpClientAdapter adapter,
  ) {
    options = setup;
    interceptors.add(interceptor);
    httpClientAdapter = adapter;
  }
}

class DioOptions extends BaseOptions {
  DioOptions()
      : super(
          baseUrl: "${dotenv.get('API_GATWAY')}",
          contentType: Headers.jsonContentType,
          connectTimeout: Duration(milliseconds: 60000),
          sendTimeout: Duration(milliseconds: 60000),
          receiveTimeout: Duration(milliseconds: 60000),
        );
}
