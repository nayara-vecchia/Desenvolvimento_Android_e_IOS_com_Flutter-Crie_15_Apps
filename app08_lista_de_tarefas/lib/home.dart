import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _taskList = [];
  final TextEditingController _controller = TextEditingController();

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/todoListData.json");
  }

  Future<String> _readTaskList() async {
    try {
      final file = await _getLocalFile();
      return file.readAsString();
    } catch (e) {
      rethrow;
    }
  }

  _saveTask() async {
    Map<String, dynamic> newTask = {};
    newTask["title"] = _controller.text;
    newTask["status"] = false;
    setState(() {
      _taskList.add(newTask);
    });
    _saveTaskFile();
    _controller.text = '';
  }

  _saveTaskFile() async {
    final file = await _getLocalFile();
    String data = json.encode(_taskList);
    file.writeAsString(data);
  }

  _deleteTask(int index, DismissDirection direction) async {
    final Map<String, dynamic> deletedItem = _taskList[index];

    //Removes the task from the list and save the file
    setState(() {
      _taskList.removeAt(index);
    });
    _saveTaskFile();

    //Shows snackbar so if the user want to revert the removal, its possible while the 5s duration
    final snackBar = SnackBar(
      content: const Text('Do you want to cancel?'),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
          label: 'Yes!',
          textColor: Colors.amber,
          onPressed: () {
            setState(() {
              _taskList.insert(index, deletedItem);
            });
            _saveTaskFile();
          }),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    _readTaskList().then((value) {
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
                return Dismissible(
                  key: ValueKey<String>(
                      DateTime.now().microsecondsSinceEpoch.toString()),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    _deleteTask(index, direction);
                  },
                  // direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.red.shade600,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: CheckboxListTile(
                    title: Text(_taskList[index]['title']),
                    value: _taskList[index]['status'],
                    onChanged: (newValue) {
                      setState(() {
                        _taskList[index]['status'] = newValue;
                      });
                      _saveTaskFile();
                    },
                  ),
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
                  controller: _controller,
                  decoration: const InputDecoration(
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
                    onPressed: _saveTask,
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
