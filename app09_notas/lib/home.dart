import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:intl/intl.dart';

import 'helper/notes_helper.dart';
import 'model/note_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<Note> _notes = [];
  final _db = NoteHelper();

  _saveNote(note) async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String date = DateTime.now().toString();

    if (note == null) {
      Note note = Note(
        title,
        description,
        date,
      );
      await _db.saveNote(
        note,
      );
    } else {
      note.title = title;
      note.description = description;
      note.date = date;
      await _db.updateNotes(note);
    }

    _titleController.clear();
    _descriptionController.clear();
    _listNotes();
  }

  _listNotes() async {
    List notes = await _db.listNotes();
    List<Note> temp = [];
    for (Map item in notes) {
      final note = Note.fromMap(item);
      temp.add(note);
    }
    setState(() {
      _notes = temp;
    });
    temp = [];
  }

  _deleteNote(int id) async {
    await _db.deleteNotes(id);
    _listNotes();
  }

  @override
  void initState() {
    super.initState();
    _listNotes();
  }

  @override
  Widget build(BuildContext context) {
    _showModal(note) {
      String text = "";
      if (note == null) {
        //salvando
        _titleController.text = "";
        _descriptionController.text = "";
        text = "Salvar";
      } else {
        //atualizar
        _titleController.text = note.title;
        _descriptionController.text = note.description;
        text = "Atualizar";
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Adicionar nota"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: "Título",
                    hintText: "Digite o título",
                  ),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: "Descrição",
                    hintText: "Digite a descrição",
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  //salvar
                  _saveNote(note);
                  Navigator.pop(context);
                },
                child: Text(text),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas anotações"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                return Card(
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text('${DateFormat("dd/MM/yyyy").format(
                      DateTime.parse(note.date),
                    )} - ${note.description}'),
                    trailing: SizedBox(
                      width: 70,
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _showModal(note);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onLongPress: () {
                              _deleteNote(int.parse(note.id.toString()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          _showModal(null);
        },
      ),
    );
  }
}
