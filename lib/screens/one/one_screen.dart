import 'package:flutter/material.dart';
import 'package:study_navigator/screens/two/two_screen.dart';
import 'package:study_navigator/widgets/button/button_widget.dart';

class OneScreen extends StatefulWidget {
  static const route = 'one';

  const OneScreen({Key? key}) : super(key: key);

  static Page createRoute({Key? key}) {
    return const MaterialPage(
      key: ValueKey(route),
      name: route,
      child: OneScreen(),
    );
  }

  @override
  State<OneScreen> createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One'),
      ),
      bottomNavigationBar: ButtonWidget(
        onPressed: () {
          Navigator.push(context, TwoScreen.createRoute());
        },
        child: const Text(
          'Go to screen two',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
