import 'package:flutter/material.dart';
import './screens/calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      theme: ThemeData(
        textTheme: ThemeData().textTheme.copyWith(
              bodyMedium: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(title: 'Alcool ou Gasolina'),
      debugShowCheckedModeBanner: false,
    );
  }
}
