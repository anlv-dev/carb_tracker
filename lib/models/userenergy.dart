class UserEnergy {
  int _birthday;
  String _username;

  int _height;
  int _weight;
  String _gender;
  String _mode;
  int _bmi;
  int _minCalo;
  int _totalCarb;
  bool _status;

  UserEnergy(
      this._username,
      this._birthday,
      this._height,
      this._weight,
      this._gender,
      this._mode,
      this._bmi,
      this._minCalo,
      this._totalCarb,
      this._status);

  UserEnergy.map(dynamic obj) {
    this._username = obj["username"];
    this._birthday = obj["birthday"];
    this._height = obj["height"];
    this._weight = obj["weight"];
    this._gender = obj["gender"];
    this._mode = obj["mode"];
    this._bmi = obj["bmi"];
    this._minCalo = obj["mincalo"];
    this._totalCarb = obj["totalcarb"];
    this._status = obj["status"];
  }

  String get username => _username;
  int get birthday => _birthday;
  int get height => _height;
  int get weight => _weight;
  String get gt => _gender;
  String get mode => _mode;
  int get bmi => _bmi;
  int get mincalo => _minCalo;
  int get totalcarb => _totalCarb;
  bool get status => _status;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["birthday"] = _birthday;
    map["height"] = _height;
    map["weight"] = _weight;
    map["gender"] = _gender;
    map["mode"] = _mode;
    map["bmi"] = _bmi;
    map["mincalo"] = _minCalo;
    map["totalcarb"] = _totalCarb;
    map["status"] = _status;

    return map;
  }

  UserEnergy.fromMap(Map<String, dynamic> map) {
    this._username = map["username"];
    this._birthday = map["birthday"];
    this._height = map["height"];
    this._weight = map["weight"];
    this._gender = map["gender"];
    this._mode = map["mode"];
    this._bmi = map["bmi"];
    this._minCalo = map["mincalo"];
    this._totalCarb = map["totalcarb"];
    this._status = map["status"];
  }
}