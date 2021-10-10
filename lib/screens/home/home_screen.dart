import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_navigator/app_state_manager.dart';
import 'package:study_navigator/screens/one/one_screen.dart';
import 'package:study_navigator/widgets/button/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page createRoute({Key? key}) {
    return const MaterialPage(
      name: 'home',
      key: ValueKey('home'),
      child: HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomNavigationBar: ButtonWidget(
        onPressed: () {
          Provider.of<AppStateManager>(context, listen: false).one();
        },
        child: const Text(
          'Go to screen one',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
