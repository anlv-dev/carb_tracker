class UserEatFoods {
  int _id;
  String _username;
  String _eatDate;
  int _idFood;
  int _numberFood;
//"CREATE TABLE $tableUserEatFood($columnId INTEGER PRIMARY KEY AUTOINCREMENT,
// $columnusername TEXT,$coleatDate TEXT, $colidFood INTEGER, $colnumberFood INTEGER)");
  UserEatFoods(this._username, this._eatDate, this._idFood, this._numberFood);

  UserEatFoods.map(dynamic obj) {
    this._id = obj["id"];
    this._username = obj["username"];
    this._eatDate = obj["eatDate"];
    this._idFood = obj["idFood"];
    this._numberFood = obj["numberFood"];
  }

  int get id => _id;
  String get username => _username;
  String get eatDate => _eatDate;
  int get idFood => _idFood;
  int get numberFood => _numberFood;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["username"] = _username;
    map["eatDate"] = _eatDate;
    map["idFood"] = _idFood;
    map["numberFood"] = _numberFood;

    return map;
  }

  UserEatFoods.fromMap(Map<String, dynamic> map) {
    this._id = map["id"];
    this._username = map["username"];
    this._eatDate = map["eatDate"];
    this._idFood = map["idFood"];
    this._numberFood = map["numberFood"];
  }
}
