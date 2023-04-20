import 'package:flutter/material.dart';
import 'dart:math';

import 'package:app01_frases_do_dia/widgets/logo.dart';
import 'package:app01_frases_do_dia/widgets/phrase.dart';
import 'package:app01_frases_do_dia/data/phrases.dart';


class DailyPhrases extends StatefulWidget {
  const DailyPhrases({super.key});

  @override
  State<DailyPhrases> createState() => _DailyPhrasesState();
}

class _DailyPhrasesState extends State<DailyPhrases> {

  String _generatedPhrase = 'Clique no botão para gerar uma frase';

  void generatePhrase() {
    int phraseIndex = Random().nextInt( phrases.length );

    setState(() {
      _generatedPhrase = phrases[phraseIndex];
    });
  }

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
              Phrase(_generatedPhrase),
              ElevatedButton(
                onPressed: generatePhrase,
                child: const Text('Nova Frase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
