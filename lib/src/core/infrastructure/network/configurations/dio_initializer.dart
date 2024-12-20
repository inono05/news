import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'api_routes.dart';
import 'package:flutter_animate/flutter_animate.dart';


class DioInitializer {
  Dio initialize({List<Interceptor> interceptors = const []}) {
    final dio = Dio()
      ..options.baseUrl = ApiRoutes.url
      ..options.connectTimeout = 5000.ms
      ..options.contentType = "application/json"
      ..options.receiveTimeout = 5000.ms
      ..options.headers[HttpHeaders.acceptHeader] = "application/json"
      ..options.headers[HttpHeaders.acceptCharsetHeader] = "charset=UTF-8"
      ..interceptors.addAll(interceptors);
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () => HttpClient()
      ..badCertificateCallback = (
          X509Certificate cert,
          host,
          port,
          ) =>
      true;

    return dio;
  }
}
