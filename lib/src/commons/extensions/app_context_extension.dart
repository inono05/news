import 'package:flutter/material.dart';

extension AppContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Brightness get brightness => Theme.of(this).brightness;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;


  //Colors
  Color get primary => colorScheme.primary;
  Color get onPrimary => colorScheme.onPrimary;
  Color get secondary => colorScheme.secondary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get tertiary => colorScheme.tertiary;
  Color get surface => colorScheme.surface;
  Color get error => colorScheme.error;


  //TextStyles
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;

}

extension MediaQueryX on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

