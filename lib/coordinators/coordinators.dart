import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_navigator/coordinators/routes.dart';
import 'package:study_navigator/screens/game_details/game_details_screen.dart';
import 'package:study_navigator/screens/list_games/list_games_screen.dart';

class Coordinators with ChangeNotifier {
  Coordinators()
      : _pages = [
          const MaterialPage(
            child: ListGamesScreen(),
            key: ValueKey(ListGamesPath.name),
            name: ListGamesPath.name,
          ),
        ];

  final List<Page> _pages;
  List<Page> get pages => List.unmodifiable(_pages);

  AppPath get currentConfiguration => parseRoute(pages.last.name ?? '');

  void setNewRoutePath(AppPath path) {
    if (path is GameDetailPath) {
      _addPage(GameDetailsScreen(id: path.id), path.formattedPath);
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

  void navigateGameDetails(int id) {
    setNewRoutePath(GameDetailPath(id: id));
  }
}
