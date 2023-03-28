import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static DBHelper dbHelper = DBHelper._();
  Database? database;

  Future<Database?> checkDB() async {
    if (database != null) {
      return await database;
    } else {
      return await creatDB();
    }
  }

  Future<Database?> creatDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "news.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE news (id INTEGER PRIMARY KEY AUTOINCREMENT,dis TEXT,image TEXT)";
        db.execute(query);
      },
    );
  }

  void insertDB({required String dis, required String image}) async {
    database = await checkDB();
    database!.insert("news", {"dis": dis,"image":image});
  }

  Future<List<Map>> readDB() async {
    database = await checkDB();
    String query = "SELECT * FROM news";

    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<void> Deletdata({required int id}) async {
    database = await checkDB();
    database!.delete("news", where: "id = ?", whereArgs: [id]);
  }

  Future<void> updatedata(
      {required int id, required String dis, required String image}) async {
    database = await checkDB();
    database!.update("news", {"dis": dis,"image":image});
  }
}
