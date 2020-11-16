class Valuer {
  Valuer({this.initialValue});

  final int initialValue;

  ///returns stream<int> values
  Stream<int> get value async* {
    var i = initialValue;
    while (i < 900) {
      await Future.delayed(Duration(milliseconds: 700), () {
        i += 100;
      });
      yield i;
    }
  }
}
