import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});
  static const routeName = '/services';

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
          children: [
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/detalhe_servico.png',
                ),
                const Text(
                  'Nossos Serviços',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Cosultoria',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Preços',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Acompanhamentos de Projetos',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
