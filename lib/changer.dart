class Changer {
  int _heightVal = 0;

  int get heightVal {
    return _heightVal != null ? _heightVal : 0;
  } 

  set heightVal(int val) {
    _heightVal = val;
  }
}