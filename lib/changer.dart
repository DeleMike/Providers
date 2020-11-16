import 'package:flutter/foundation.dart';

class Changer with ChangeNotifier {
  double value = 700.0;
  bool isVisible = false;
  String text;

  Changer() {
    text = isVisible ? 'Hide' : 'Show';
  }

  void increment(val) {
    value = val;
    notifyListeners();
  }

  void changeVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}