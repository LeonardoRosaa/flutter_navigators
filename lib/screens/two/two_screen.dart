import 'package:flutter/material.dart';

class TwoScreen extends StatefulWidget {
  const TwoScreen({Key? key}) : super(key: key);

  static Route createRoute({Key? key}) {
    return MaterialPageRoute(builder: (_) => const TwoScreen());
  }

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
    );
  }
}
