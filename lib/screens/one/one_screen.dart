import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_navigator/coordinators/routes_coordinators.dart';
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
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: usernameController,
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<TextEditingValue>(
        valueListenable: usernameController,
        builder: (_, value, __) {
          return ButtonWidget(
            onPressed: value.text.isEmpty ? null : () {
              Provider.of<RoutesCoordinators>(context, listen: false)
                  .navigateTwo(value.text);
            },
            child: const Text(
              'Go to screen two',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
