import 'package:flutter/material.dart';
import 'package:flutter_dice/src/home/widgets/six_side_dice.dart';

class DiceHomeScreen extends StatefulWidget {
  const DiceHomeScreen({super.key});

  @override
  State<DiceHomeScreen> createState() => _DiceHomeScreenState();
}

class _DiceHomeScreenState extends State<DiceHomeScreen> {
  late int _diceValue;
  bool isLoading = false;

  @override
  void initState() {
    _diceValue = 1;
    super.initState();
  }

  Future<void> _rollDice() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        _diceValue = 1 + (DateTime.now().millisecond % 6);
      });

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Dice'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _rollDice,
        tooltip: 'Roll',
        child: const Icon(Icons.casino),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      SixSideDice(diceValue: _diceValue),
                      const SizedBox(height: 20),
                      const Text(
                        'Roll the dice!',
                      ),
                      Text(
                        '$_diceValue',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
