import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/api.dart';
import '../interceptors/token_interceptor.dart';
import 'api_routes.dart';
import 'dio_initializer.dart';

part 'api_initializer.g.dart';

@Riverpod(keepAlive: true)
Api api(ApiRef ref) {
  return Api(
    baseUrl: ApiRoutes.url,
    DioInitializer().initialize(
      interceptors: [
        //TokenInterceptor(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        )
      ],
    ),
  );
}

