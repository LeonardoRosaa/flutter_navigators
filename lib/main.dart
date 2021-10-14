import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_navigator/coordinators/coordinators_delegate.dart';
import 'package:study_navigator/coordinators/coordinators_information_parser.dart';
import 'package:study_navigator/coordinators/routes_coordinators.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RoutesCoordinators>(
            create: (_) => RoutesCoordinators()),
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
    final _coordinatorsDelegate = CoordinatorsDelegate(
        routesCoordinators: Provider.of<RoutesCoordinators>(context));
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _coordinatorsDelegate,
      routeInformationParser: coordinatorsParse,
    );
  }
}
