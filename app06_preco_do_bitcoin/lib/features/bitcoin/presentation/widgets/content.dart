import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.bitcoinValue,
  });
  final String bitcoinValue;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 300,
        child: Text(
          'R\$ $bitcoinValue',
          style: TextStyle(
            fontSize: 40,
            color: Colors.grey[800],
          ),
        ),
      ),
    );
  }
}
