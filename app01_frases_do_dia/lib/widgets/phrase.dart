import 'package:flutter/material.dart';

class Phrase extends StatelessWidget {
  final String phrase;

  const Phrase(this.phrase, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.12,
        child: Center(
          child: Text(
            phrase,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
        ));
  }
}
