import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _taskList = [];
  // List<Map<String, dynamic>> _taskList = [];

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/todoListData.json');
  }

  Future<File> writeTaskList() async {
    final file = await _localFile;
    Map<String, dynamic> newTask = Map();
    newTask['title'] = 'text 01';
    newTask['status'] = false;
    _taskList.add(newTask);
    String data = jsonEncode(_taskList);
    print(data);
    print(newTask);
    return file.writeAsString('$data');
  }

  Future<String> readTaskList() async {
    try {
      final file = await _localFile;
      // Read the file
      final contents = await file.readAsString();

      return file.readAsString();
    } catch (e) {
      // If encountering an error, return 0
      return 'Não foi possivel ler o arquivo';
    }
  }

  @override
  void initState() {
    super.initState();
    readTaskList().then((value) {
      setState(() {
        _taskList = jsonDecode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: _taskList.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(_taskList[index]['title']),
                  value: _taskList[index]['status'],
                  onChanged: (newValue) {},
                );
              },
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.purple,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add task'),
                content: TextField(
                  decoration: InputDecoration(
                    labelText: 'Add your task',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
