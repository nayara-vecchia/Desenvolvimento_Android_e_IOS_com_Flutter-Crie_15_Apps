import 'package:flutter/material.dart';

import 'package:app07_youtube_app/homepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube',
      home: const MyHomePage(title: 'Youtube'),
    );
  }
}
