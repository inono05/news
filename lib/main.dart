import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/src/commons/constants/app_colors_scheme.dart';
import 'package:news/src/commons/constants/app_sizes.dart';
import 'package:news/src/commons/extensions/app_widget_extension.dart';
import 'package:news/src/commons/widgets/app_startup_widget.dart';
import 'package:news/src/commons/widgets/components/app_alert_dialog.dart';
import 'package:news/src/core/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerErrorHandlers();
  runApp(
    ProviderScope(
      child: AppStartupWidget(
        onLoaded: (context) => const Application(),
      ),
    ),
  );
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    final appColors = AppColorsScheme.lightColorScheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColors.surface,
        body: Material(
          elevation: 25.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.p14,
            ),
          ),
          child: AppAlertDialog.error(
            message: (details.exception.toString().contains("timeout"))
                ? "Oops! check your internet connexion and reload"
                : details.exceptionAsString(),
          ),
        ).paddingSymmetric(horizontal: AppSize.p12),
      ),
    );
  };
}