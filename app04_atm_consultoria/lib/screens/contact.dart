import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});
  static const routeName = '/contact';

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
                  'assets/images/detalhe_contato.png',
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
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("atendimento@atmconsultoria.com.br", style: Theme.of(context).textTheme.bodySmall,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Telefone: (00) 0000-0000", style: Theme.of(context).textTheme.bodySmall,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Celular: (00) 90000-0000", style: Theme.of(context).textTheme.bodySmall,),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
