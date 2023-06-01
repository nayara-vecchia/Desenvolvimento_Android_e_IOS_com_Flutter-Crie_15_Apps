import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Content extends StatelessWidget {
  const Content(
      {super.key, required this.bitcoinValue, required this.isLoading});
  final String bitcoinValue;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Animate(
        effects: const [FadeEffect()],
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: 300,
          child: isLoading
              ? CircularProgressIndicator(
                  color: Colors.amber.shade800,
                )
              : Text(
                  bitcoinValue,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey[800],
                  ),
                ),
        ),
      ),
    );
  }
}
