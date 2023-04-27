import 'package:flutter/material.dart';
import 'dart:math';
import 'package:app05_cara_ou_coroa/screens/game.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Future _letsPlay(context) {
    List<String> itens = [
      'assets/images/moeda_cara.png',
      'assets/images/moeda_coroa.png',
    ];
    int resultIndex = Random().nextInt(itens.length);

    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) {
          return Game(
            result: itens[resultIndex],
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(horizontal: 75),
              width: double.infinity,
              height: 75,
              child: ElevatedButton(
                onPressed: (() => _letsPlay(context)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(Colors.white),
                    foregroundColor: MaterialStateProperty.all<Color?>(
                        Theme.of(context).primaryColor)),
                child: const Text(
                  'JOGAR',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'ChunkFive',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
