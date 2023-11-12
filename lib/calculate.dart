import 'dart:math';

class Resultcalculate {
  Resultcalculate({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0.0;

  String CalcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String GetResults() {
    if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return "UnderWeight";
    }
  }

  String interpString() {
    if (_bmi > 25) {
      return 'Go hit the Gym,You fat ass bitch';
    } else if (_bmi > 18.5) {
      return 'Keep it up bruh';
    } else {
      return "Get some food";
    }
  }
}
