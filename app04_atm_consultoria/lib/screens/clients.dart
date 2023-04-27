import 'package:flutter/material.dart';

import '../widgets/client_element.dart';

class Clients extends StatelessWidget {
  const Clients({super.key});
  static const routeName = '/clients';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.green,
        title: Text(
          routeName.substring(1).replaceFirst(
                routeName[1],
                routeName[1].toUpperCase(),
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/detalhe_cliente.png',
                ),
                const Text(
                  'Sobre a Empresa',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  ClientElement(
                    'assets/images/cliente1.png',
                    'Empresa de Software',
                  ),
                  ClientElement(
                    'assets/images/cliente2.png',
                    'Empresa de Auditoria',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
