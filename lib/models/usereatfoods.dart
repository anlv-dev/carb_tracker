class UserEatFoods {
  int _id;
  int _usrId;
  String _ngayanuong;
  int _idThucan;
  double _totalCarb;

  UserEatFoods(this._usrId, this._ngayanuong, this._idThucan, this._totalCarb);
  UserEatFoods.withoutCarb(this._usrId, this._ngayanuong, this._idThucan);

  UserEatFoods.map(dynamic obj) {
    this._id = obj["id"];
    this._usrId = obj["usrId"];
    this._ngayanuong = obj["ngayanuong"];
    this._idThucan = obj["idThucan"];
    this._totalCarb = obj["totalCarb"];
  }

  int get id => _id;
  int get usrId => _usrId;
  String get ngayanuong => _ngayanuong;
  int get idThucan => _idThucan;
  double get totalCarb => _totalCarb;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["usrId"] = _usrId;
    map["ngayanuong"] = _ngayanuong;
    map["idThucan"] = _idThucan;
    map["totalCarb"] = _totalCarb;

    return map;
  }

  UserEatFoods.fromMap(Map<String, dynamic> map) {
    this._id = map["id"];
    this._usrId = map["usrId"];
    this._ngayanuong = map["ngayanuong"];
    this._idThucan = map["idThucan"];
    this._totalCarb = map["totlCarb"];
  }
}
