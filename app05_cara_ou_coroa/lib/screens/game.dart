import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  const Game({super.key, required this.result});
  final String result;
  static const routeName = '/game';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(result),
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(horizontal: 75),
              width: double.infinity,
              height: 75,
              child: ElevatedButton(
                onPressed: (() => Navigator.of(context).pop(context)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(Colors.white),
                    foregroundColor: MaterialStateProperty.all<Color?>(
                        Theme.of(context).primaryColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                    ),
                    Text(
                      'VOLTAR',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'ChunkFive',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
