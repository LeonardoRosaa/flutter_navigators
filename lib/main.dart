import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_navigator/app_router.dart';
import 'package:study_navigator/app_state_manager.dart';
import 'package:study_navigator/screens/home/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateManager()),
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
  late final AppRouter appRouter;

  @override
  initState() {
    super.initState();
    appRouter = AppRouter(
      appStateManager: Provider.of<AppStateManager>(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Router(
        routerDelegate: appRouter,
      ),
    );
  }
}
