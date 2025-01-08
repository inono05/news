import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:news/src/core/routing/app_router.dart';
import '../commons/themes/app_theme.dart';
import '../commons/utilities/app_status_bar.dart';

class Application extends ConsumerWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final themeMode = ref.watch(appThemeStateProvider);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    ref.watch(appStatusBar).setColor(ref: ref);
    final router  =  ref.watch(appRouterProvider);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      //themeMode: themeMode,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
