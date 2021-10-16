import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_navigator/models/game_model.dart';
import 'package:study_navigator/repositories/games_repository.dart';

class GameDetailsScreen extends StatefulWidget {
  final int id;

  const GameDetailsScreen({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  late final GamesRepository gamesRepository;

  @override
  void initState() {
    gamesRepository = Provider.of<GamesRepository>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game ${widget.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: FutureBuilder<Game>(
            future: gamesRepository.findById(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data!.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      snapshot.data!.price,
                      style: TextStyle(
                        fontSize: 52,
                        color: Colors.black.withOpacity(0.5)
                      ),
                    ),
                  ],
                );
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
