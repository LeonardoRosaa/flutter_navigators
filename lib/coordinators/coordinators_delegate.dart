import 'package:flutter/material.dart';
import 'package:study_navigator/coordinators/app_routes.dart';
import 'package:study_navigator/coordinators/routes_coordinators.dart';


class CoordinatorsDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  CoordinatorsDelegate({
    required this.routesCoordinators,
  }) : navigatorKey = GlobalKey<NavigatorState>();

  final RoutesCoordinators routesCoordinators;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: routesCoordinators.pages,
      onPopPage: _handlePopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey;

  @override
  AppRoutePath? get currentConfiguration => routesCoordinators.currentConfiguration;

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async => routesCoordinators.setNewRoutePath(configuration);

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!routesCoordinators.didPop(route, result)) {
      return false;
    }

    final routePage = route.settings;

    if (routePage is Page) {
      routesCoordinators.popPage(routePage);
    }

    return true;
  }
}
