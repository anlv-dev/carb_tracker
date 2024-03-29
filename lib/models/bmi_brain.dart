import 'dart:math';

class BMIBrain {
  int hei; // CAN NANG
  int wei; //CHIEU CAO
  String gender; //GIOI TINH : NAM/NU
  int birthday; // NAM SINH
  int age; //TUOI
  String eatMode; //BT: BINH THUONG, TC: TANG CAN, GC: GIAM CAN, TD: TIEU DUONG
  double _bmi;
  double _minCalo;
  double runningDistance = 0;
  double _runCalories;

  double walkingDistance = 0;
  double _walkCalories;

  double cyclingDistance = 0;
  double _cycleCalories;

  int swimmingTime = 0; //Minutes
  double _swimCalories;

  BMIBrain({this.hei, this.wei, this.birthday, this.eatMode, this.gender});

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

  double minimizeCalories() {
    int currentYear = DateTime.now().year;
    double result;
    age = currentYear - birthday;

    if (gender == 'NAM') {
      _minCalo = (13.397 * wei) + (4.799 * hei) - (5.677 * age) + 88.362;
      result = _minCalo.roundToDouble();
    } else if (gender == 'NU') {
      _minCalo = (9.247 * wei) + (3.098 * hei) - (4.33 * age) + 447.593;
      result = _minCalo.roundToDouble();
    }
    return result;
  }

  int runningCalories() {
    if (runningDistance > 0) {
      _runCalories = (runningDistance * 9.35 * 4.7) + ((wei - 60) * 0.08);
      return _runCalories.round();
    } else {
      return 0;
    }
  }

  int walkingCalories() {
    if (walkingDistance > 0) {
      _walkCalories = (walkingDistance / 0.833) *
          ((0.035 * wei) + (5 * 5 / hei) * 0.029 * wei);
      return _walkCalories.round();
    } else {
      return 0;
    }
  }

  int swimmingCalories() {
    if (swimmingTime > 0) {
      _swimCalories = swimmingTime * (11 + (wei - 56) * 0.188);
      return _swimCalories.round();
    } else {
      return 0;
    }
  }

  int cyclingCalories() {
    if (cyclingDistance > 0) {
      _cycleCalories = cyclingDistance * (12 + (wei - 56) * 2.9);
      return _cycleCalories.round();
    } else {
      return 0;
    }
  }

  double totalPower() {
    return minimizeCalories() +
        walkingCalories() +
        runningCalories() +
        swimmingCalories() +
        cyclingCalories();
  }

  double getRequireCarbByMode() {
    double result;
    if (gender == 'NAM') {
      if (eatMode == 'BT') {
        if (age >= 6 && age <= 18) {
          result = (totalPower() * 0.65) / 4;
        } else if (age >= 19 && age <= 40) {
          result = (totalPower() * 0.64) / 4;
        } else if (age >= 41 && age <= 60) {
          result = (totalPower() * 0.63) / 4;
        } else if (age >= 61) {
          result = (totalPower() * 0.62) / 4;
        }
      } else if (eatMode == 'GC') {
        //print(eatMode);
        if (age >= 6 && age <= 18) {
          result = (totalPower() * 0.63) / 4;
        } else if (age >= 19 && age <= 40) {
          result = (totalPower() * 0.62) / 4;
        } else if (age >= 41 && age <= 60) {
          result = (totalPower() * 0.61) / 4;
        } else if (age >= 61) {
          result = (totalPower() * 0.60) / 4;
        }
      } else if (eatMode == 'TC') {
        if (age >= 6 && age <= 18) {
          result = (totalPower() * 0.65) / 4;
        } else if (age >= 19 && age <= 40) {
          result = (totalPower() * 0.65) / 4;
        } else if (age >= 41 && age <= 60) {
          result = (totalPower() * 0.64) / 4;
        } else if (age >= 61) {
          result = (totalPower() * 0.63) / 4;
        }
      } else if (eatMode == 'TD') {
        if (age >= 6 && age <= 18) {
          result = (totalPower() * 0.60) / 4;
        } else if (age >= 19 && age <= 40) {
          result = (totalPower() * 0.59) / 4;
        } else if (age >= 41 && age <= 60) {
          result = (totalPower() * 0.58) / 4;
        } else if (age >= 61) {
          result = (totalPower() * 0.57) / 4;
        }
      }
    } else {
      if (eatMode == 'BT') {
        if (age >= 6 && age <= 18) {
          result = (totalPower() * 0.64) / 4;
        } else if (age >= 19 && age <= 40) {
          result = (totalPower() * 0.63) / 4;
        } else if (age >= 41 && age <= 60) {
          result = (totalPower() * 0.62) / 4;
        } else if (age >= 61) {
          result = (totalPower() * 0.61) / 4;
        }
      } else if (eatMode == 'GC') {
        print(eatMode);
        if (age >= 6 && age <= 18) {
          result = (totalPower() * 0.63) / 4;
        } else if (age >= 19 && age <= 40) {
          result = (totalPower() * 0.62) / 4;
        } else if (age >= 41 && age <= 60) {
          result = (totalPower() * 0.61) / 4;
        } else if (age >= 61) {
          result = (totalPower() * 0.60) / 4;
        }
      } else if (eatMode == 'TC') {
        if (age >= 6 && age <= 18) {
          result = (totalPower() * 0.65) / 4;
        } else if (age >= 19 && age <= 40) {
          result = (totalPower() * 0.65) / 4;
        } else if (age >= 41 && age <= 60) {
          result = (totalPower() * 0.64) / 4;
        } else if (age >= 61) {
          result = (totalPower() * 0.63) / 4;
        }
      } else if (eatMode == 'TD') {
        if (age >= 6 && age <= 18) {
          result = (totalPower() * 0.60) / 4;
        } else if (age >= 19 && age <= 40) {
          result = (totalPower() * 0.59) / 4;
        } else if (age >= 41 && age <= 60) {
          result = (totalPower() * 0.58) / 4;
        } else if (age >= 61) {
          result = (totalPower() * 0.57) / 4;
        }
      }
    }
    return result.roundToDouble();
  }
}
