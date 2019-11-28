import 'dart:core';
import 'dart:io';

import 'package:carbs_tracker_ex/models/food_Banks.dart';
import 'package:carbs_tracker_ex/models/user.dart';
import 'package:carbs_tracker_ex/models/usereatfoods.dart';
import 'package:carbs_tracker_ex/models/userenergy.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;
  //Table userTable
  final String tableUser = "userTable";
  final String columnId = "id";
  final String columnusername = "username";
  final String columnPassword = "password";

  //Table userenergy
  final String tableUserEnergy = "userenergy";
  final String columnBirthday = "birthday";
  final String columnHeight = "height";
  final String columnWeight = "weight";
  final String columnGender = "gender";
  final String columnMode = "mode";
  final String columnStatus = "status";
  final String columnMinCalo = "mincalo";
  final String columnBMI = "bmi";
  final String columnTotalCarb = "totalcarb";

  //Table userEatFoodTable
  final String tableUserEatFood = "userEatFoodTable";
  final String coleatDate = "eatDate";
  final String colidFood = "idFood";
  final String colnumberFood = "numberFood";
  //Table FoodBank
  final String tableFoodBank = "foodBank";
  final String colFoodName = "foodName";
  final String colFoodDvt = "foodDvt";
  final String colFoodCarb = "foodCarb";
  final String colFoodCalo = "foodCalo";
  final String colFoodGroup = "foodGroup";

  //

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'maindb.db');

    var ourDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDB;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableUser($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnusername TEXT, $columnPassword TEXT)");

    await db.execute(
        "CREATE TABLE $tableUserEnergy($columnusername TEXT, $columnBirthday INTEGER, $columnHeight INTEGER, $columnWeight INTEGER, $columnGender TEXT, $columnMode TEXT,$columnBMI TEXT, $columnMinCalo INTEGER,  $columnTotalCarb INTEGER,  $columnStatus INTEGER)");

    await db.execute(
        "CREATE TABLE $tableUserEatFood($columnId INTEGER PRIMARY KEY AUTOINCREMENT,$columnusername TEXT,$coleatDate TEXT, $colidFood INTEGER, $colnumberFood INTEGER)");

    await db.execute(
        "CREATE TABLE $tableFoodBank($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $colFoodName TEXT, $colFoodDvt TEXT, $colFoodCarb REAL, $colFoodCalo REAL, $colFoodGroup TEXT )");
  }

  //CRUD: CREATE, READ, UPDATE, DELETE

  //CRUD : 1-CREATE
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableUser", user.toMap());
    return res;
  }

  //Save in UserEnergy

  Future<int> saveUserEnergy(UserEnergy user) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableUserEnergy", user.toMap());
    return res;
  }

  // Save FoodBanks

  Future<int> saveFoodBanks(FoodBanker fb) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableFoodBank", fb.toMap());
    return res;
  }

  // Save idfood of user in table UserEatFood

  Future<int> saveUserEateFood(UserEatFoods userEatFoods) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableFoodBank", userEatFoods.toMap());
    return res;
  }

  //Count row in tableuserEnergy

  Future<int> getCountUserEnergy() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableUserEnergy"));
  }

  Future<int> getCountFoodBanks() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableFoodBank"));
  }

  //Count row in table : UserEatFood
  Future<int> getCountUserEatFood() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableUserEatFood"));
  }

  Future<int> getCountUser() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableUser"));
  }

  Future<int> checkExistUser(String email) async {
    var dbClient = await db;
    int result = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableUser WHERE $columnusername = '$email'"));

    return result;
  }

  //Check Email Exist in tableUserEnergy
  Future<int> checkExistUserEnergy(String email) async {
    var dbClient = await db;
    int result = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableUserEnergy WHERE $columnusername = '$email'"));
    print('Your Email : $email');

    return result;
  }

  Future<int> checkLogin(String email, String pass) async {
    var dbClient = await db;
    int result = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableUser WHERE $columnusername = '$email' AND $columnPassword = '$pass' "));

    return result;
  }

  //CRUD : 2-READ
  Future<List> getAllUsers() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableUser");
    return result.toList();
  }

  Future<List> getAllFoods() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableFoodBank");
    return result.toList();
  }

  Future<User> getUser(int id) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableUser WHERE $columnId = $id");
    if (result.length == 0) {
      return null;
    }
    return new User.fromMap(result.first);
  }

  Future<UserEnergy> getUserEnergy(String email) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableUserEnergy WHERE $columnusername = '$email'");
    if (result.length == 0) {
      return null;
    }
    return new UserEnergy.fromMap(result.first);
  }

  //CRUD : 4-DELETE

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete("$tableUser", where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
    var dbClient = await db;
    return await dbClient.update('$tableUser', user.toMap(),
        where: "$columnId = ?", whereArgs: [user.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
