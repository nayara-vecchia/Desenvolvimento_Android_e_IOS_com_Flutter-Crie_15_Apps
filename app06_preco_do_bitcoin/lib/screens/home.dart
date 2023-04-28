import 'dart:convert';

import 'package:app06_preco_do_bitcoin/widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String bitcoinValue = '';
  bool _isLoading = false;

  void _updateBitcoinPrice() async {
    final url = Uri.https('blockchain.info', '/ticker');
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (response.statusCode >= 400) {
        setState(() {
          bitcoinValue = 'Failed';
        });
      }
      if (response.statusCode == 200) {
        setState(() {
          bitcoinValue = 'R\$ ${data['BRL']!['last'].toString()}';
        });
      }
      _isLoading = false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset('assets/images/bitcoin.png'),
              ),
              Content(bitcoinValue: bitcoinValue, isLoading: _isLoading),
              ElevatedButton(
                onPressed: _updateBitcoinPrice,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amber.shade800),
                    fixedSize: MaterialStateProperty.all(const Size(200, 60))),
                child: const Text(
                  'Atualizar',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
