import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_navigator/coordinators/routes_coordinators.dart';
import 'package:study_navigator/widgets/button/button_widget.dart';

class TwoScreen extends StatefulWidget {
  final String username;

  const TwoScreen({required this.username, Key? key}) : super(key: key);

  @override
  State<TwoScreen> createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two'),
      ),
      body: Center(
        child: Text(widget.username),
      ),
      bottomNavigationBar: ButtonWidget(
        onPressed: () {
          Provider.of<RoutesCoordinators>(context, listen: false).navigateOne();
        },
        child: const Text(
          'Back to screen one',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
