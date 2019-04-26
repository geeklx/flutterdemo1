void main() {
  Stream.fromFutures([
    Future.delayed(new Duration(seconds: 1), () {
      return "hi yun1";
    }),
    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError("yun error1");
    }),
    Future.delayed(new Duration(seconds: 3), () {
      return "hi yun3";
    })
  ]).listen((data) {
    print(data);
  }, onError: (e) {
    print(e.toString());
  }, onDone: () {});
}
