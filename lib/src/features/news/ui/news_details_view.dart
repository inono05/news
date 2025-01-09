import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news/src/commons/extensions/app_context_extension.dart';
import 'package:news/src/commons/extensions/app_widget_extension.dart';

import '../../../../generated/assets.gen.dart';
import '../../../commons/constants/app_sizes.dart';
import '../../../commons/constants/app_strings.dart';
import '../../../commons/widgets/components/app_title.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppSize.p32.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                elevation: 1,
                color: context.surface,
                shape: CircleBorder(),
                child: Icon(Iconsax.arrow_left)
                    .paddingAll(AppSize.p10)
                    .onTap(() => context.pop()),
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
          ListView(
            children: [
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
              ),
              AppSize.p14.heightBox,
              Hero(
                tag: "hero2",
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
              ),
              AppSize.p14.heightBox,
              Hero(
                tag: "hero3",
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
              ),
            ],
          ).expanded(),
        ],
      ).paddingSymmetric(horizontal: AppSize.p14),
    );
  }
}
