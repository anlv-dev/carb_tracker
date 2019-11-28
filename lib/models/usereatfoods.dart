class UserEatFoods {
  int _id;
  String _usrId;
  String _ngayanuong;
  int _idThucan;
  int _numberOfFood;

  UserEatFoods(
      this._usrId, this._ngayanuong, this._idThucan, this._numberOfFood);

  UserEatFoods.map(dynamic obj) {
    this._id = obj["id"];
    this._usrId = obj["usrId"];
    this._ngayanuong = obj["ngayanuong"];
    this._idThucan = obj["idThucan"];
    this._numberOfFood = obj["numberOfFood"];
  }

  int get id => _id;
  String get usrId => _usrId;
  String get ngayanuong => _ngayanuong;
  int get idThucan => _idThucan;
  int get numberOfFood => _numberOfFood;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["usrId"] = _usrId;
    map["ngayanuong"] = _ngayanuong;
    map["idThucan"] = _idThucan;
    map["numberOfFood"] = _numberOfFood;

    return map;
  }

  UserEatFoods.fromMap(Map<String, dynamic> map) {
    this._id = map["id"];
    this._usrId = map["usrId"];
    this._ngayanuong = map["ngayanuong"];
    this._idThucan = map["idThucan"];
    this._numberOfFood = map["numberOfFood"];
  }
}
