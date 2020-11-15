import 'package:flutter/foundation.dart';

class Changer with ChangeNotifier{
  double value = 5.0;

  void increment(val) {
    value += val;
    notifyListeners();
  }
}