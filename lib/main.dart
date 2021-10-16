import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_navigator/coordinators/coordinators_delegate.dart';
import 'package:study_navigator/coordinators/coordinators_information_parser.dart';
import 'package:study_navigator/coordinators/coordinators.dart';
import 'package:study_navigator/repositories/games_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<GamesRepository>(
          create: (_) => GamesRepository(),
        ),
        ChangeNotifierProvider<Coordinators>(
          create: (_) => Coordinators(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final coordinatorsParse = CoordinatorsInformationParser();

  @override
  Widget build(BuildContext context) {
    final coordinatorsDelegate = CoordinatorsDelegate(
      coordinators: Provider.of<Coordinators>(context, listen: true),
    );
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: coordinatorsDelegate,
      routeInformationParser: coordinatorsParse,
    );
  }
}
