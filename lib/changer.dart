class Changer {
  double _heightVal = 0;

  double get heightVal {
    return _heightVal != null ? _heightVal : 0;
  } 

  set heightVal(double val) {
    _heightVal = val;
  }
}