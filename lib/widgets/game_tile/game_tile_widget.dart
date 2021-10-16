import 'package:flutter/material.dart';
import 'package:study_navigator/models/game_model.dart';

class GameTile extends StatelessWidget {
  final Game game;

  final VoidCallback onTap;

  const GameTile({
    Key? key,
    required this.game,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              game.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(game.price), 
          ],
        ),
      ),
    );
  }
}
