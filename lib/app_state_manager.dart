import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _started = false;
  bool _one = false;

  bool get isStarted => _started;

  bool get isOne => _one;

  void one() {
    _one = true;

    notifyListeners();
  }
}
