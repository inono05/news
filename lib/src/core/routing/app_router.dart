import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/src/features/discoveries/ui/discoveries_view.dart';
import 'package:news/src/features/favourites/ui/favourites_view.dart';
import 'package:news/src/features/news/ui/news_view.dart';
import 'package:news/src/features/profile/ui/profile_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/home/ui/home_navigation_view.dart';
import '../../features/splash/ui/splash_view.dart';

part 'app_router.g.dart';
//privates navigators keys
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _newsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "news");
final _discoveriesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'discoveries');
final _favouritesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'favourites');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

enum AppRoutes {
  splash,
  onboarding,
  authenticate,
  emailVerify,
  home,
  news,
  discoveries,
  favourites,

  profile,
}

@riverpod
GoRouter appRouter(AppRouterRef ref){
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    /*redirect: (context, state) {
      final isOnboardingCompleted = onboarding.isOnboardingComplete();
      final path = state.uri.path;
      log("isOnBoarding ===> $isOnboardingCompleted");
      log("path ===> $path");
      if (!isOnboardingCompleted) {
        if (path != '/onboarding') {
          return '/onboarding';
        }
      }
      return null;
    },*/
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.splash.name,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: const SplashView());
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (
            context,
            state,
            navigationShell,
            ) {
          return HomeNavigationView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _newsNavigatorKey,
            routes: [
              GoRoute(
                path: '/news',
                name: AppRoutes.news.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: NewsView());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _discoveriesNavigatorKey,
            routes: [
              GoRoute(
                path: '/discoveries',
                name: AppRoutes.discoveries.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: DiscoveriesView());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _favouritesNavigatorKey,
            routes: [
              GoRoute(
                path: '/favourites',
                name: AppRoutes.favourites.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: FavouritesView());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRoutes.profile.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: ProfileView());
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
