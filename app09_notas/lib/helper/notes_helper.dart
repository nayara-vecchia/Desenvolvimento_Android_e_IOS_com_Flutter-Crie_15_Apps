import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/note_model.dart';

class NoteHelper {
  static const String tableName = "notes";
  static final NoteHelper _notesHelper = NoteHelper._internal();
  Database? _db;

  factory NoteHelper() {
    return _notesHelper;
  }

  NoteHelper._internal();

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await databaseInit();
      return _db;
    }
  }

  databaseInit() async {
    final dbLocation = await getDatabasesPath();
    final dbPath = join(dbLocation, "notes.db");

    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );
    return database;
  }

  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $tableName ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "title VARCHAR, "
        "description TEXT, "
        "date DATETIME)";
    await db.execute(sql);
  }

  Future<int> saveNote(Note note) async {
    final database = await db;
    int result = await database.insert(
      tableName,
      note.toMap(),
    );
    return result;
  }

  listNotes() async {
    final database = await db;
    String sql = "SELECT * FROM $tableName ORDER BY date DESC";
    List notes = await database.rawQuery(sql);
    return notes;
  }

  Future<int> updateNotes(Note note) async {
    final database = await db;
    return await database.update(
      tableName,
      note.toMap(),
      where: "id = ?",
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNotes(int id) async {
    final database = await db;
    return await database.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
