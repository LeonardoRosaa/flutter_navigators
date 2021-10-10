import 'package:flutter/material.dart';
import 'package:study_navigator/app_state_manager.dart';
import 'package:study_navigator/screens/home/home_screen.dart';
import 'package:study_navigator/screens/one/one_screen.dart';

class AppRouter extends RouterDelegate<AppRouter>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        HomeScreen.createRoute(),
        if (appStateManager.isOne) OneScreen.createRoute()
      ],
      onPopPage: _handlePopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async => null;

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }
}
