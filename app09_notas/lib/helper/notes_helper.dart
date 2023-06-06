import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/note_model.dart';

class NoteHelper {

  static final String nomeTabela = "anotacao";

  static final NoteHelper _anotacaoHelper = NoteHelper._internal();
  late Database _db;

  factory NoteHelper(){
    return _anotacaoHelper;
  }

  NoteHelper._internal();

  get db async {

    if( _db != null ){
      return _db;
    }else{
      _db = await inicializarDB();
      return _db;
    }

  }

  _onCreate(Database db, int version) async {

    /*

    id titulo descricao data
    01 teste  teste     02/10/2020

    * */

    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "titulo VARCHAR, "
        "descricao TEXT, "
        "data DATETIME)";
    await db.execute(sql);

  }

  inicializarDB() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco_minhas_anotacoes.db");

    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate );
    return db;

  }

  Future<int> salvarAnotacao(Note anotacao) async {

    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, anotacao.toMap() );
    return resultado;

  }

  recuperarAnotacoes() async {

    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY data DESC ";
    List anotacoes = await bancoDados.rawQuery( sql );
    return anotacoes;

  }

  Future<int> atualizarAnotacao(Note anotacao) async {

    var bancoDados = await db;
    return await bancoDados.update(
      nomeTabela,
      anotacao.toMap(),
      where: "id = ?",
      whereArgs: [anotacao.id]
    );

  }

  Future<int> removerAnotacao( int id ) async {

    var bancoDados = await db;
    return await bancoDados.delete(
      nomeTabela,
      where: "id = ?",
      whereArgs: [id]
    );

  }
}

/*

class Normal {

  Normal(){

  }

}

class Singleton {

  static final Singleton _singleton = Singleton._internal();

  	factory Singleton(){
      print("Singleton");
      return _singleton;
    }

    Singleton._internal(){
    	print("_internal");
  	}

}

void main() {

  var i1 = Singleton();
  print("***");
  var i2 = Singleton();

  print( i1 == i2 );

}


* */