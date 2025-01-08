import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news/src/commons/extensions/app_context_extension.dart';
import 'package:news/src/commons/extensions/app_widget_extension.dart';

import '../../../../commons/constants/app_sizes.dart';
import '../../domains/ui_data_home.dart';
class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  @override
  Widget build(BuildContext context) {
    List<UiDataHome> data = [
      UiDataHome(
        label: "News",
        icon: const Icon(Iconsax.home_2),
        selectedIcon: Icon(
          Iconsax.home_2,
          color: context.secondary,
        ),
      ),
      UiDataHome(
        label: 'Discover',
        icon: const Icon(Iconsax.discover),
        selectedIcon: Icon(
          Iconsax.discover,
          color: context.secondary,
        ),
      ),
      UiDataHome(
        label: "Favourites",
        icon: const Icon(Iconsax.document_favorite),
        selectedIcon: Icon(
          Iconsax.document_favorite,
          color: context.secondary,
        ),
      ),
      UiDataHome(
        label: "Profile",
        icon: const Icon(Iconsax.profile_2user),
        selectedIcon: Icon(
          Iconsax.profile_2user,
          color: context.secondary,
        ),
      ),
    ];
    return Scaffold(
      body: body.paddingOnly(top: AppSize.p8),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        backgroundColor: context.colorScheme.surface,
        elevation: 0.0,
        indicatorColor: Colors.transparent,
        indicatorShape: const CircleBorder(),
        destinations: [
          ...data.map(
            (e) => NavigationDestination(
              icon: e.icon!,
              label: e.label!,
              selectedIcon: e.selectedIcon,
              tooltip: e.label,
            ),
          )
        ],
      ),
    );
  }
}
