import 'package:app07_youtube_app/screens/folder.dart';
import 'package:app07_youtube_app/screens/home.dart';
import 'package:app07_youtube_app/screens/subscription.dart';
import 'package:app07_youtube_app/screens/whatshot.dart';
import 'package:app07_youtube_app/utils/custom_search.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _researchString = '';
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Home(
        search: _researchString,
      ),
      Whatshot(),
      Subscription(),
      Folder(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              String? res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              if (res != null) {
                setState(() {
                  _researchString = res;
                });
              }
              // print(res);
            },
            icon: Icon(Icons.search),
          ),
          /*
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          ),
          */
        ],
        title: Container(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/images/youtube.png',
            width: 100,
            height: 25,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: screens[_index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        fixedColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Início',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Em Alta',
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: 'Em Inscrições',
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: 'Biblioteca',
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
