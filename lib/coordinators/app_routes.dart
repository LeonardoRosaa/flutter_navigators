AppRoutePath parseRoute(String path) {

  final pathUri = Uri.parse(path);

  final firstSubPath = pathUri.pathSegments[0];

  if (firstSubPath == OnePath.name) {
    return OnePath();
  } else if (firstSubPath == TwoPath.name) {
    print(pathUri.pathSegments);
    final username = pathUri.pathSegments[1];
    return TwoPath(username: username);
  }

  return HomePath();
}

abstract class AppRoutePath {
  const AppRoutePath();

  String get formattedPath;
}

class HomePath extends AppRoutePath {
  static const name = 'home';

  @override
  String get formattedPath => '/$name';
}

class OnePath extends AppRoutePath {
  static const name = 'one';

  @override
  String get formattedPath => '/$name';
}

class TwoPath extends AppRoutePath {
  final String username;

  const TwoPath({ required this.username });

  static const name = 'two';

  @override
  String get formattedPath => '/$name/$username';
}