import 'package:app05_cara_ou_coroa/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATM Consultoria',
      theme: ThemeData(
          textTheme: ThemeData().textTheme.copyWith(
                bodySmall: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
                bodyMedium: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
          primaryColor: const Color(0xff61bd86)),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
