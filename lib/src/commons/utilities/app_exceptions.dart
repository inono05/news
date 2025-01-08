
import 'package:flutter/services.dart';
class AppExceptions{
  AppExceptions._();
  
  static String? message(dynamic exception){

    if (exception is PlatformException) {
      return exception.message ?? exception.toString();
    }
/*    if (exception is DioException) {
      if ((exception).response != null) {
        final exceptionValue = JSonResponse.fromJson((exception).response?.data);
        return exceptionValue.message.toString();
      }
      return exception.message.toString() ;
    }*/
    return exception.toString();
  }
}