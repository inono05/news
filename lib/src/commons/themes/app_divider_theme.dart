import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class AppDividerTheme {
  AppDividerTheme._();
  static dividerTheme({required ColorScheme colorScheme}) => DividerThemeData(
        space: 1,
        color: colorScheme.secondaryContainer,
        indent: AppSize.p10,
        endIndent: AppSize.p10,
        thickness: 1,
      );
}
