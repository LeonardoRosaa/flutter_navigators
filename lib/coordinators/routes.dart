AppPath parseRoute(String path) {

  final pathUri = Uri.parse(path);

  final firstSubPath = pathUri.pathSegments.isEmpty ? null : pathUri.pathSegments[0];

  if (firstSubPath == GameDetailPath.name) {
    final id = pathUri.pathSegments[1];
    return GameDetailPath(id: int.tryParse(id) ?? 0);
  }

  return ListGamesPath();
}

abstract class AppPath {
  const AppPath();

  String get formattedPath;
}

class ListGamesPath extends AppPath {
  static const name = 'listGames';

  @override
  String get formattedPath => '/$name';
}

class GameDetailPath extends AppPath {
  final int id;

  const GameDetailPath({ required this.id });

  static const name = 'gameDetail';

  @override
  String get formattedPath => '/$name/$id';
}