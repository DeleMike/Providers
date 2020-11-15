import 'package:flutter/foundation.dart';

class Changer with ChangeNotifier{
  double value = 700.0;
  bool isVisible = false;

  void increment(val) {
    value = val ;
    notifyListeners();
  }

  void changeVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}