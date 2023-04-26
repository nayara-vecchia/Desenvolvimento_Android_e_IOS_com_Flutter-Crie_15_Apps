import 'package:flutter/material.dart';
import 'package:app04_atm_consultoria/screens/clients.dart';
import 'package:app04_atm_consultoria/screens/company.dart';
import 'package:app04_atm_consultoria/screens/contact.dart';
import 'package:app04_atm_consultoria/screens/services.dart';
import 'package:app04_atm_consultoria/widgets/home_option.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.green,
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset('assets/images/logo.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeOption('assets/images/menu_empresa.png', Company.routeName),
                  HomeOption('assets/images/menu_servico.png', Services.routeName),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeOption('assets/images/menu_cliente.png', Clients.routeName),
                  HomeOption('assets/images/menu_contato.png', Contact.routeName),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
