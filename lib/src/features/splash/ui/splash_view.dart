import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/src/commons/constants/app_sizes.dart';
import 'package:news/src/commons/constants/app_strings.dart';
import 'package:news/src/commons/extensions/app_context_extension.dart';
import 'package:news/src/commons/extensions/app_widget_extension.dart';
import 'package:news/src/commons/widgets/components/app_title.dart';
import 'package:news/src/commons/widgets/components/buttons/app_button.dart';
import 'package:news/src/core/routing/app_router.dart';

import '../../../../generated/assets.gen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    //final image = Assets.images.news;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 1),
          image: DecorationImage(
            image: AssetImage(Assets.images.news.path),
            fit: BoxFit.cover,
            opacity: .5,
          ),
        ),
        child: Column(
          spacing: AppSize.p14,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            AppTitle.h2(
              title: "Stay Informed from Day One".toUpperCase(),
              fontWeight: FontWeight.bold,
              color: context.surface,
            ),
            AppTitle(
              title: AppStrings.splashSubtitle,
              maxLines: 3,
              textAlign: TextAlign.center,
              color: context.surface,
            ).paddingSymmetric(horizontal: AppSize.p8),
            AppButton.secondary(
              title: "Getting Started",
              onPressed: () => context.goNamed(AppRoutes.news.name),
            ),
            AppSize.p32.heightBox,
          ],
        ),
      ),
    );
  }
}
