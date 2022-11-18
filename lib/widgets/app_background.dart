import 'package:flutter/material.dart';

// Define a custom Form widget.
class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/gym.jpg"), fit: BoxFit.fill),
      ),
    ));
  }
}
