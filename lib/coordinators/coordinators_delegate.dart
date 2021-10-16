import 'package:flutter/material.dart';
import 'package:study_navigator/coordinators/routes.dart';

import 'coordinators.dart';


class CoordinatorsDelegate extends RouterDelegate<AppPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  CoordinatorsDelegate({
    required this.coordinators,
  }) : navigatorKey = GlobalKey<NavigatorState>();

  final Coordinators coordinators;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: coordinators.pages,
      onPopPage: _handlePopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey;

  @override
  AppPath? get currentConfiguration => coordinators.currentConfiguration;

  @override
  Future<void> setNewRoutePath(AppPath configuration) async => coordinators.setNewRoutePath(configuration);

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!coordinators.didPop(route, result)) {
      return false;
    }

    final routePage = route.settings;

    if (routePage is Page) {
      coordinators.popPage(routePage);
    }

    return true;
  }
}
