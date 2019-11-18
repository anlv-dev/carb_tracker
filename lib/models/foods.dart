class Foods {
  int id;
  String foodName;
  String dv;
  double carbs;
  String group;

  Foods(this.id, this.foodName, this.dv, this.carbs, this.group);

  List<Foods> lstFoods = [
    Foods(1, 'Cơm trắng', 'BAT', 44.2, 'X'),
    Foods(2, 'Bún nước', 'BAT', 65.0, 'X'),
    Foods(3, 'Bún thịt nướng/ nem rán', 'TÔ', 67.0, 'X'),
    Foods(4, 'Cơm chiên', 'ĐĨA', 92.2, 'X'),
    Foods(5, 'Cơm tấm', 'BAT', 87, 'X'),
    Foods(6, 'Xôi bắp', 'BAT', 51.3, 'X'),
    Foods(7, 'Xôi đậu', 'BAT', 91.7, 'X'),
    Foods(8, 'Phở', 'BAT', 59.3, 'X'),
    Foods(9, 'Miến nước', 'BAT', 100.2, 'X'),
    Foods(10, 'Mì nước', 'BAT', 66.4, 'X'),
    Foods(11, 'Mì xào', 'BAT', 51.6, 'X'),
  ];
}
