class FoodBanker {
  int _id;
  String _foodName;
  String _foodDvt;
  double _foodCarb;
  double _foodCalo;
  String _foodGroup;

  FoodBanker(this._foodName, this._foodDvt, this._foodCarb, this._foodCalo,
      this._foodGroup);

  FoodBanker.map(dynamic obj) {
    this._id = obj["id"];
    this._foodName = obj["foodName"];
    this._foodDvt = obj["foodDvt"];
    this._foodCarb = obj["foodCarb"];
    this._foodCalo = obj["foodCalo"];
    this._foodGroup = obj["foodGroup"];
  }

  String get foodName => _foodName;
  String get foodDvt => _foodDvt;
  double get foodCarb => _foodCarb;
  double get foodCalo => _foodCalo;
  String get foodGroup => _foodGroup;
  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["foodName"] = _foodName;
    map["foodDvt"] = _foodDvt;
    map["foodCarb"] = _foodCarb;
    map["foodCalo"] = _foodCalo;
    map["foodGroup"] = _foodGroup;

    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  FoodBanker.fromMap(Map<String, dynamic> map) {
    this._foodName = map["foodName"];
    this._foodDvt = map["foodDvt"];
    this._foodCarb = map["foodCarb"];
    this._foodCalo = map["foodCalo"];
    this._foodGroup = map["foodGroup"];

    this._id = map["id"];
  }
}
