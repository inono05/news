import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../commons/extensions/app_widget_extension.dart';
import '../../../../commons/extensions/app_context_extension.dart';
import '../../../constants/app_sizes.dart';

enum _ButtonType {
  primary,
  secondary,
}

class AppButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool? isLoading;
  final VoidCallback? onPressed;
  final _ButtonType _buttonType;

  const AppButton({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.isLoading = false,
  }) : _buttonType = _ButtonType.primary;

  const AppButton.secondary({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.isLoading = false,
  }) : _buttonType = _ButtonType.secondary;

  @override
  Widget build(BuildContext context) {
    late Color bgColor;
    late Color fgColor;

    switch (_buttonType) {
      case _ButtonType.primary:
        bgColor = context.primary;
        fgColor = context.onPrimary;
        break;
      case _ButtonType.secondary:
        bgColor = context.secondary;
        fgColor = context.onSecondary;
        break;
    }

    return SizedBox(
      height: AppSize.p55,
      width: context.screenSize.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.p12),
            side: const BorderSide(
              width: 0.0,
              color: Colors.transparent,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon!, color: context.surface,),
              Expanded(
                child: (isLoading == true)
                    ? SpinKitRipple(
                        color: context.surface,
                        size: AppSize.p14,
                      )
                    : Text(
                        title,
                        textAlign: TextAlign.center,
                        style: context.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.surface,
                        ),
                      ),
              ),
            ] else
              (isLoading == true)
                  ? SpinKitRipple(
                      color: context.primary,
                      size: AppSize.p14,
                    )
                  : Text(
                      title,
                      textAlign: TextAlign.center,
                      style: context.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.surface,
                      ),
                    ),
          ],
        ),
      ),
    )
        .paddingSymmetric(horizontal: AppSize.p8)
        .animate()
        .fadeIn(duration: 500.ms)
        .slide();
  }
}
