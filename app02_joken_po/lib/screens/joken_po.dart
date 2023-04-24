import 'package:flutter/material.dart';
import 'dart:math';
import '../widgets/choise.dart';

class JokenPo extends StatefulWidget {
  const JokenPo({super.key, required this.title});
  final String title;

  @override
  State<JokenPo> createState() => _JokenPoState();
}

class _JokenPoState extends State<JokenPo> {
  String appChoise = 'assets/images/padrao.png';
  String message = "Escolha uma opção abaixo";

  List<String> choises = [
    "assets/images/pedra.png",
    "assets/images/papel.png",
    "assets/images/tesoura.png"
  ];

  void _select(String userChoise) {
    setState(() {
      appChoise = choises[Random().nextInt(3)];
    });

    if ((userChoise == "assets/images/pedra.png" &&
            appChoise == "assets/images/tesoura.png") ||
        (userChoise == "assets/images/tesoura.png" &&
            appChoise == "assets/images/papel.png") ||
        (userChoise == "assets/images/papel.png" &&
            appChoise == "assets/images/pedra.png")) {
      setState(() {
        message = "Parabéns!!! Você ganhou :)";
      });
      //App Ganhador
    } else if ((appChoise == "assets/images/pedra.png" &&
            userChoise == "assets/images/tesoura.png") ||
        (appChoise == "assets/images/tesoura.png" &&
            userChoise == "assets/images/papel.png") ||
        (appChoise == "assets/images/papel.png" &&
            userChoise == "assets/images/pedra.png")) {
      setState(() {
        message = "Você perdeu :(";
      });
    } else {
      setState(() {
        message = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 16),
            child: Text('Escolha do App'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Choise(appChoise, 150, () {}),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 16),
            child: Text(message),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final value in choises) Choise(value, 100, _select),
            ],
          )
        ],
      )),
    );
  }
}
