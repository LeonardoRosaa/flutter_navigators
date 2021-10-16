import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:study_navigator/models/game_model.dart';

class GamesRepository {
  Future<Game> findById(int id) async {
    final games = await findAll();

    return games.firstWhere((element) => element.id == id);
  }


  Future<List<Game>> findAll() async {
    final result = await rootBundle.loadString('database/games.json');

    final list = jsonDecode(result) as List;

    return list.map((e) => Game.fromMap(e)).toList();
  }

  
}