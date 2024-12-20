import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import '../../../commons/extensions/app_widget_extension.dart';
import '../../constants/app_sizes.dart';
import '../components/app_title.dart';
enum _AppAlertType { success, error, info }

class AppAlertDialog extends StatelessWidget {
  final String message;
  final _AppAlertType _appAlertType;
  final VoidCallback? onPressed;

  const AppAlertDialog({
    super.key,
    required this.message,
    this.onPressed,
  }) : _appAlertType = _AppAlertType.info;

  const AppAlertDialog.error({
    super.key,
    required this.message,
    this.onPressed,
  }) : _appAlertType = _AppAlertType.error;

  const AppAlertDialog.success({
    super.key,
    required this.message,
    this.onPressed,
  }) : _appAlertType = _AppAlertType.success;

  @override
  Widget build(BuildContext context) {
    late Widget alertIcon;
    //late String title;
    late String description;
    switch (_appAlertType) {
      case _AppAlertType.success:
        alertIcon = Icon(Iconsax.copy_success1);
        //title = "Success";
        description = message;
        break;
      case _AppAlertType.error:
        alertIcon = Icon(Iconsax.close_circle);
        //title = "Error";
        description = message;
        break;
      case _AppAlertType.info:
        alertIcon = Icon(IconlyLight.info_circle);
        //title = "Information";
        description = message;
        break;
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.p10),
      ),
      elevation: 15.0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          alertIcon.paddingAll(AppSize.p8),
          AppSize.p4.heightBox,
          AppTitle.h4(
            title: description,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ).paddingAll(AppSize.p8),
    );
  }
}
