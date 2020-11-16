import 'package:flutter/foundation.dart';

class Changer with ChangeNotifier {
  double value = 700.0;
  bool isVisible = false;
  String text = 'Show';

  void increment(val) {
    value = val;
    notifyListeners();
  }

  void changeVisibility() {
    isVisible = !isVisible;
    text = isVisible ? 'Hide' : 'Show';
    notifyListeners();
  }
}