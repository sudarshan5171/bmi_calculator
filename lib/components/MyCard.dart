import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget cardChild;
  final VoidCallback onPress;
  final Color colour;

  const MyCard(this.cardChild, this.onPress, this.colour);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
