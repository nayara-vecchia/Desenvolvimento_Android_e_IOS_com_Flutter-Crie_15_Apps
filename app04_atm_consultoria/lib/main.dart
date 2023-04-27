import 'package:flutter/material.dart';
import 'package:app04_atm_consultoria/screens/clients.dart';
import 'package:app04_atm_consultoria/screens/contact.dart';
import 'package:app04_atm_consultoria/screens/services.dart';
import 'package:app04_atm_consultoria/screens/company.dart';
import 'package:app04_atm_consultoria/screens/home.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ATM Consultoria'),
      routes: {
        Company.routeName: (context) => Company(),
        Services.routeName: (context) => Services(),
        Clients.routeName: (context) => Clients(),
        Contact.routeName: (context) => Contact(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
