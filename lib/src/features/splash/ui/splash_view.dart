import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/src/commons/constants/app_sizes.dart';
import 'package:news/src/commons/constants/app_strings.dart';
import 'package:news/src/commons/extensions/app_widget_extension.dart';
import 'package:news/src/commons/widgets/components/app_title.dart';
import 'package:news/src/commons/widgets/components/buttons/app_button.dart';
import 'package:news/src/core/routing/app_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    //final image = Assets.images.news;
    return Scaffold(
      body: Column(
        spacing: AppSize.p14,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          AppTitle.h2(
            title: "Stay Informed from Day One".toUpperCase(),
            fontWeight: FontWeight.bold,
          ),
          AppTitle(
            title: AppStrings.splashSubtitle,
            maxLines: 3,
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: AppSize.p8),

          AppButton(
            title: "Getting Started",
            onPressed: () => context.goNamed(AppRoutes.news.name),
          ),
          AppSize.p32.heightBox,
        ],
      ),
    );
  }
}
