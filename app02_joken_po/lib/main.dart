import 'package:app02_joken_po/screens/joken_po.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joken Po',
      theme: ThemeData(
        textTheme: ThemeData().textTheme.copyWith(
              bodyMedium: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
        primarySwatch: Colors.blue,
      ),
      home: const JokenPo(title: 'Joken Po'),
      debugShowCheckedModeBanner: false,
    );
  }
}
