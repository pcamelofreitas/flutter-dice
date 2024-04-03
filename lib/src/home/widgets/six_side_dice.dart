import 'package:flutter/material.dart';

class SixSideDice extends StatelessWidget {
  const SixSideDice({
    super.key,
    required this.diceValue,
  });

  final int diceValue;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        height: 100,
        width: 100,
        decoration: ShapeDecoration(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            )),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            if (diceValue.isOdd && index == 4) {
              return const WhiteDot();
            } else if ((diceValue >= 2 && diceValue <= 6) &&
                (index == 0 || index == 8)) {
              return const WhiteDot();
            } else if ((diceValue >= 4 && diceValue <= 6) &&
                (index == 2 || index == 6)) {
              return const WhiteDot();
            } else if (diceValue == 6 && (index == 3 || index == 5)) {
              return const WhiteDot();
            } else {
              return const Icon(
                Icons.circle,
                color: Colors.black,
                size: 4,
              );
            }
          },
        ),
      ),
    );
  }
}

class WhiteDot extends StatelessWidget {
  const WhiteDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.circle,
      color: Colors.white,
      size: 20,
    );
  }
}
