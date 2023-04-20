import 'package:flutter/material.dart';

import 'package:app01_frases_do_dia/screens/daily_phrases_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases do Dia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 106, 193, 98),
          primary: Colors.green.shade400,
          background: Colors.green.shade700,
          brightness: Brightness.light,
        ).copyWith(
            secondary: Colors.green.shade900, tertiary: Colors.grey.shade500),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(
                fontSize: 16,
              ),
              bodyMedium: const TextStyle(
                color: Color.fromARGB(255, 96, 96, 96),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 22,
              ),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const DailyPhrases(title: "Frases do Dia"),
    );
  }
}
