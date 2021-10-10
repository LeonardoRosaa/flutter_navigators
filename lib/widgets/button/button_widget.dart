import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Widget child;

  final VoidCallback? onPressed;

  final double width;

  final double height;

  const ButtonWidget({
    required this.child,
    required this.onPressed,
    this.width = double.maxFinite,
    this.height = 50,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      child: TextButton(
        child: child,
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
