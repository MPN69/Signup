import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper {
  static Database? _db;

  static const String DB_Name = "test.db";
  static const String Table_User = "user";
  static const int Version = 1;

  static const String C_user = "user_id";
  static const String C_name = "user_name";
  static const String C_password = "password";
  static const String C_estado = "estado";
  static const String C_habilidades = "habilidades";

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDb();

    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intversion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_user TEXT, "
        " $C_name TEXT, "
        " $C_password TEXT, "
        " $C_estado TEXT, "
        " $C_habilidades TEXT, "
        " PRIMARY KEY ($C_user)"
        ")");
  }
}
