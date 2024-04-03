import 'package:flutter/material.dart';
import 'package:flutter_dice/src/home/home_screen.dart';

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Dice',
      theme: ThemeData(
        colorSchemeSeed: Colors.greenAccent,
      ),
      home: const DiceHomeScreen(),
    );
  }
}
