import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});
  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _textEditingAlcoolController = TextEditingController();
  final _textEditingGaslController = TextEditingController();
  String _result = "";

  void _calculate() {
    final enteredAlcool = double.tryParse(_textEditingAlcoolController.text);
    final enteredGasoline = double.tryParse(_textEditingGaslController.text);

    if (enteredAlcool == null || enteredGasoline == null) {
      setState(() {
        _result = 'Valores Inválidos';
      });
      return;
    }

    if (enteredAlcool < enteredGasoline * 0.7) {
      setState(() {
        _result = 'Alcool é melhor';
      });
      return;
    }
    setState(() {
      _result = 'Gasolina é melhor';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(
            32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Animate(
                effects: const [
                  FadeEffect(),
                  ScaleEffect(duration: Duration(seconds: 1,),),
                  ShakeEffect(hz: 4),
                ],
                child: Image.asset(
                  './assets/images/logo.png',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: Text(
                  'Saiba qual a melhor opção para abastecimento do seu carro',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                // autofocus: true,
                decoration: const InputDecoration(
                  label: Text(
                    'Preço Alcool, ex 1.59',
                  ),
                ),
                controller: _textEditingAlcoolController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                // autofocus: true,
                decoration: const InputDecoration(
                  label: Text(
                    'Preço Gasolina, ex 3.15',
                  ),
                ),
                controller: _textEditingGaslController,
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                child: ElevatedButton(
                  onPressed: _calculate,
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(_result),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
