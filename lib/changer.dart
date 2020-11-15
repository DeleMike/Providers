import 'package:flutter/foundation.dart';

class Changer with ChangeNotifier{
  double value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}