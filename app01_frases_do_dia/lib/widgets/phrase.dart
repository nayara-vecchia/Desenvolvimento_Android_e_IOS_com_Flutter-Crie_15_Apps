import 'package:flutter/material.dart';

class Phrase extends StatelessWidget {
  const Phrase({super.key});

  final String phrase =
      'Gratidão não é pagamento, mas um reconhecimento que se demonstra no dia a dia';

  @override
  Widget build(BuildContext context) {
    return Text(phrase, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.justify,);
  }
}
