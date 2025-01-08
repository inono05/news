import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news/src/commons/constants/app_sizes.dart';
import 'package:news/src/commons/constants/app_strings.dart';
import 'package:news/src/commons/extensions/app_context_extension.dart';
import 'package:news/src/commons/extensions/app_widget_extension.dart';
import 'package:news/src/commons/widgets/components/app_title.dart';

import '../../../../generated/assets.gen.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: AppSize.p16,
        children: [
          AppSize.p32.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                elevation: 1,
                color: context.surface,
                shape: CircleBorder(),
                child: Icon(Iconsax.menu_1).paddingAll(AppSize.p10),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.p24),
                  color: context.onPrimary.withValues(alpha: .005),
                ),
                child: Row(
                  spacing: AppSize.p8,
                  children: [
                    Material(
                      elevation: 1,
                      color: context.surface,
                      shape: CircleBorder(),
                      child:
                          Icon(Iconsax.search_normal).paddingAll(AppSize.p10),
                    ),
                    Material(
                      elevation: 1,
                      color: context.surface,
                      shape: CircleBorder(),
                      child: Icon(Iconsax.notification).paddingAll(AppSize.p10),
                    ),
                  ],
                ).paddingAll(AppSize.p4),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTitle.h2(title: "Breaking News"),
              AppTitle.h4(title: "Show More"),
            ],
          ),
          Material(
            borderRadius: BorderRadius.circular(AppSize.p14),
            elevation: 5.5,
            shadowColor: Colors.black87,
            child: Container(
              height: AppSize.p200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.p14),
                color: Colors.black87,
                image: DecorationImage(
                  image: AssetImage(Assets.images.news.path),
                  fit: BoxFit.cover,
                  opacity: .4,
                  filterQuality: FilterQuality.high,
                ),
              ),
              child: Column(
                spacing: AppSize.p14,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: AppSize.p100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.p24),
                      color: context.surface,
                    ),
                    child: Row(
                      children: [
                        Icon(Iconsax.search_normal).paddingAll(AppSize.p8),
                        AppTitle(title: "World"),
                      ],
                    ).paddingSymmetric(horizontal: AppSize.p4),
                  ).alignAtTopRight(),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTitle(
                          title: "CNN Indenosia",
                          color: context.surface,
                          fontWeight: FontWeight.w600,
                        ),
                        AppTitle(
                          title: AppStrings.breakingNewsHint,
                          color: context.surface,
                          maxLines: 3,
                          fontWeight: FontWeight.w900,
                        )
                      ],
                    ),
                  )
                ],
              ).paddingSymmetric(
                horizontal: AppSize.p8,
                vertical: AppSize.p4,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTitle.h2(title: AppStrings.news4U),
              AppTitle.h4(title: "Show More"),
            ],
          ),
          Hero(
            tag: "hero1",
            child: Material(
              child: Container(
                height: AppSize.p120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.p14),
                  color: context.surface,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.p14),
                      child: Assets.images.news.image(scale: 12),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppTitle(
                            title: "CNN Indenosia",
                            fontWeight: FontWeight.w600,
                          ),
                          AppTitle(
                            title: AppStrings.breakingNewsHint,
                            maxLines: 3,
                            fontWeight: FontWeight.w900,
                          )
                        ],
                      ),
                    ).paddingSymmetric(horizontal: AppSize.p20).expanded()
                  ],
                ),
              ),
            ),
          )
        ],
      ).paddingSymmetric(horizontal: AppSize.p8),
    );
  }
}
