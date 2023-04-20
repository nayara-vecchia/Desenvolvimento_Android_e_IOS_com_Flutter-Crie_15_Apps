import 'package:flutter/material.dart';

import 'package:app01_frases_do_dia/widgets/logo.dart';
import 'package:app01_frases_do_dia/widgets/phrase.dart';

class DailyPhrases extends StatefulWidget {
  const DailyPhrases({super.key});

  @override
  State<DailyPhrases> createState() => _DailyPhrasesState();
}

class _DailyPhrasesState extends State<DailyPhrases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases do Dia'),
        shadowColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Logo(),
              const Phrase(),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Nova Frase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
