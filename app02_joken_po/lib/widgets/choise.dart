import 'package:flutter/material.dart';

class Choise extends StatelessWidget {
  final String choiseName;
  final double choiseHeight;
  Function select;

  Choise(this.choiseName, this.choiseHeight, this.select, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        select(choiseName);
      },
      child: Image.asset(
        choiseName,
        height: choiseHeight,
      ),
    );
  }
}
