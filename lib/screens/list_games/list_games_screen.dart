import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_navigator/coordinators/coordinators.dart';
import 'package:study_navigator/models/game_model.dart';
import 'package:study_navigator/repositories/games_repository.dart';
import 'package:study_navigator/widgets/game_tile/game_tile_widget.dart';

class ListGamesScreen extends StatefulWidget {
  const ListGamesScreen({Key? key}) : super(key: key);

  @override
  State<ListGamesScreen> createState() => _ListGamesScreenState();
}

class _ListGamesScreenState extends State<ListGamesScreen> {
  late final GamesRepository gamesRepository;
  
  late final Coordinators coordinators;

  List<Game>? games = [];

  @override
  void initState() {
    super.initState();
    gamesRepository = Provider.of<GamesRepository>(context, listen: false);
    coordinators = Provider.of<Coordinators>(context, listen: false);

    findAllGames();
  }

  Future<void> findAllGames() async {
    final result = await gamesRepository.findAll();

    setState(() {
      games = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Games List'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: games?.length ?? 0,
        itemBuilder: (context, index) {
          final game = games![index];

          void onTap() {
            coordinators.navigateGameDetails(game.id);
          }

          return GameTile(
            onTap: onTap,
            game: game,
            key: Key(game.name),
          );
        },
      ),
    );
  }
}
