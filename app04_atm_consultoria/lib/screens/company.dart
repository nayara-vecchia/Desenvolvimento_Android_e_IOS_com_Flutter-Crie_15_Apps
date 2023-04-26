import 'package:flutter/material.dart';
import 'package:app04_atm_consultoria/data/company_description.dart';

class Company extends StatelessWidget {
  const Company({super.key});
  static const routeName = '/company';

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
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/detalhe_empresa.png',
                ),
                const Text(
                  'Sobre a Empresa',
                  style: TextStyle(
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                companyDescription,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
