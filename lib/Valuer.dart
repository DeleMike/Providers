class Valuer {
  int initialValue = 100;

  ///returns stream<int> values 
  Stream<int> get value async* {
    int i = initialValue;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield i += 100;
      if (i == 900) break;
    }
  }

  ///reset initial value
  void reset() {
    initialValue = 100;
  }
}
