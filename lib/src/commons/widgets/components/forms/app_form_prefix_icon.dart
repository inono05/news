import 'package:flutter/material.dart';
import '../../../../commons/extensions/app_widget_extension.dart';
import '../../../../commons/extensions/app_context_extension.dart';
import '../../../constants/app_sizes.dart';
import '../../components/app_title.dart';

class AppFormIcon extends StatelessWidget {
  const AppFormIcon({
    super.key,
    this.icon,
    this.isRight = true,
    this.countryCode,
  });

  final Widget? icon;
  final bool isRight;
  final String? countryCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: !isRight
              ? BorderSide(
                  width: .7,
                  color: context.secondary,
                )
              : BorderSide.none,
          right: isRight
              ? BorderSide(
                  width: .6,
                  color: context.secondary,
                )
              : BorderSide.none,
        ),
      ),
      child: (countryCode == null)
          ? icon?.paddingOnly(
              right: isRight ? AppSize.p10 : 0,
              left: !isRight ? AppSize.p10 : 0,
            )
          : AppTitle(title: "+$countryCode").paddingOnly(
              right: AppSize.p10,
            ),
    ).paddingSymmetric(
      horizontal: AppSize.p8,
      vertical: AppSize.p8,
    );
  }
}
