import 'dart:math';

class BMIBrain {
  int hei; // CAN NANG
  int wei; //CHIEU CAO
  String gender; //GIOI TINH : NAM/NU
  int birthday; // NAM SINH
  int age; //TUOI
  String eatMode;  //BT: BINH THUONG, TC: TANG CAN, GC: GIAM CAN, TD: TIEU DUONG
  double _bmi;
  double _minCalo;
  double runningDistance;
  double _runCalories;

  double walkingDistance;
  double _walkCalories;

  double cyclingDistance;
  double _cycleCalories;

  int swimmingTime; //Minutes
  double _swimCalories;

  BMIBrain({this.hei, this.wei});

  String bmiResult() {
    _bmi = wei / pow(hei / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getEvaluationBMI() {
    String result;
    if (_bmi > 24.5) {
      result = 'Thừa cân';
    } else if (_bmi <= 24.5 && _bmi >= 18.5) {
      result = 'Bình thường';
    } else if (_bmi < 18.5) {
      result = 'Thiếu cân';
    }
    return result;
  }

  String getInterpretation() {
    String result;
    if (_bmi > 24.5) {
      result = 'You have a higher than normal body weight. Try to exersize mor';
    } else if (_bmi <= 24.5 && _bmi >= 18.5) {
      result = 'You have a normal weight. Good job';
    } else if (_bmi < 18.5) {
      result = 'You have a lower normal weight. Eat more';
    }
    return result;
  }

  double minimizeCalories(){
    int currentYear = DateTime.now().year;
    age = currentYear - birthday;
    if (gender == 'NAM') {
      _minCalo = (13.397 * wei) + (4.799 * hei)  - (5.677 * age) + 88.362;
    } else if(gender == 'NU')   {
        _minCalo = (9.247 * wei) + (3.098 * hei) - (4.33 * age) + 447.593;
    }
    return _minCalo;
  }

  double runningCalories(){
    if (runningDistance > 0){
    _runCalories = (runningDistance * 9.35 * 4.7) + ((wei - 60)*0.08);}
    return _runCalories;
  }

  double walkingCalories(){
    if (walkingDistance > 0){
      _walkCalories = (walkingDistance/0.833) * ((0.035 * wei) +(5*5/hei)*0.029*wei);}
    return _walkCalories;
  }

  double swimmingCalories(){
    if (swimmingTime > 0){
      _swimCalories = swimmingTime*(11 + (wei -56)*0.188);}
    return _swimCalories;
  }

  double cyclingCalories(){
    if (cyclingDistance > 0){
      _cycleCalories = cyclingDistance*(12 + (wei - 56)*2.9);}
    return _cycleCalories;
  }



  getRequireCarbByMode(String mode, int age, String gender) {
    if (gender == 'Nam') {
      if (mode == 'BT') {
        if (age >= 6 && age <= 18) {

        }
      }
    }
  }
}
