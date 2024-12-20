/*
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sopaki/src/core/preferences/app_user_preferences.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = AppUserPreferences().token();
    if (token != null) {
      log('Diotoken => $token');
      options.headers[HttpHeaders.authorizationHeader] = token;
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      //Todo implement the login redirection method
      //use the app_service to get the global context
    }
    super.onError(err, handler);
  }
}
*/
