import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utilities/app_exceptions.dart';
import '../utilities/app_helpers.dart';
import '../widgets/components/app_alert_dialog.dart';


extension AsyncValueUI on AsyncValue {
  void showAlertOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final message = AppExceptions.message(error);
      //final errorJSon = ErrorJSonResponse.fromRawJson(message!);
      log(error.toString());
      AppHelpers.showAlert(
        context: context,
        child: AppAlertDialog.error(
          message: message!,
        ),
      );
    }
  }
}
