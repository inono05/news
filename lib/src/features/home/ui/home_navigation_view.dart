import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/src/features/home/ui/widgets/navigation_widget.dart';
class HomeNavigationView extends StatelessWidget {
  const HomeNavigationView({
    super.key,
    required this.navigationShell,
  });

  void onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return NavigationWidget(
      body: navigationShell,
      currentIndex: navigationShell.currentIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }
}
