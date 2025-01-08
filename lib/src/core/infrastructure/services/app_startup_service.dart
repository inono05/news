import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../preferences/app_locale_preferences.dart';
import '../../preferences/app_theme_preferences.dart';
import '../../preferences/app_user_preferences.dart';

part 'app_startup_service.g.dart';


@Riverpod(keepAlive: true)
Future<void> appStartupService(AppStartupServiceRef ref) async {
  ref.onDispose(() {
    // ensure dependent providers are disposed as well
    //ref.invalidate(apiProvider);
  });
  // await for all initialization code to be complete before returning
  await AppUserPreferences.ensureInitialized();
  await AppLocalePreferences.ensureInitialized();
  await AppThemePreferences.ensureInitialized();
}
