import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:carbs_tracker_ex/models/usereatfoods.dart';

class DatabaseHelperTest {
  static final DatabaseHelperTest _instance = new DatabaseHelperTest.internal();

  factory DatabaseHelperTest() => _instance;

  static Database _db;

  final String tableUserEatFood = "userTable";
  final String colId = "id";
  final String colusrId = "usrId";
  final String colngayanuong = "ngayanuong";
  final String colidThucan = "idThucan";
  final String coltotalCarb = "totalCarb";

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  DatabaseHelperTest.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'maindb.db');

    var ourDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDB;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableUserEatFood($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colusrId INTEGER, $colngayanuong TEXT,$colidThucan INTEGER,  $coltotalCarb REAL)");
  }

  //CRUD: CREATE, READ, UPDATE, DELETE

  //CRUD : 1-CREATE
  Future<int> saveUser(UserEatFoods user) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableUserEatFood", user.toMap());
    return res;
  }

  Future<int> getCountUser() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableUserEatFood"));
  }

  //CRUD : 2-READ
  Future<List> getAllUsers() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableUserEatFood");
    return result.toList();
  }

  Future<List> getFoodIdByDate(String ngay, int usrId) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableUserEatFood WHERE $colngayanuong = '$ngay' AND $colusrId = $usrId");
    return result.toList();
  }

  Future<UserEatFoods> getUser(int id) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableUserEatFood WHERE $colId = $id");
    if (result.length == 0) {
      return null;
    }
    return new UserEatFoods.fromMap(result.first);
  }

  //CRUD : 4-DELETE

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete("$tableUserEatFood", where: "$colId = ?", whereArgs: [id]);
  }

  Future<int> updateUser(UserEatFoods user) async {
    var dbClient = await db;
    return await dbClient.update('$tableUserEatFood', user.toMap(),
        where: "$colId = ?", whereArgs: [user.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
