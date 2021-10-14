import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_navigator/coordinators/app_routes.dart';
import 'package:study_navigator/screens/home/home_screen.dart';
import 'package:study_navigator/screens/one/one_screen.dart';
import 'package:study_navigator/screens/two/two_screen.dart';

class RoutesCoordinators with ChangeNotifier {
  RoutesCoordinators()
      : _pages = [
          HomeScreen.createRoute(),
        ];

  final List<Page> _pages;
  List<Page> get pages => List.unmodifiable(_pages);

  AppRoutePath get currentConfiguration => parseRoute(pages.last.name ?? '');

  void setNewRoutePath(AppRoutePath path) {
    if (path is OnePath) {
      _addPage(const OneScreen(), OnePath.name);
    } else if (path is TwoPath) {
      _addPage(
        TwoScreen(
          username: path.username,
        ),
        path.formattedPath,
      );
    }
  }

  _addPage(Widget child, String name) {
    _pages.add(
      MaterialPage(child: child, key: ValueKey(name), name: name),
    );

    notifyListeners();
  }

  bool didPop(Route<dynamic> route, dynamic result) {
    if (pages.length == 1 || !route.didPop(result)) {
      return false;
    }

    return true;
  }

  popPage(Page page) {
    _pages.remove(page);

    notifyListeners();
  }

  void navigateOne() {
    setNewRoutePath(OnePath());
  }

  void navigateTwo(String username) {
    setNewRoutePath(TwoPath(username: username));
  }
}
