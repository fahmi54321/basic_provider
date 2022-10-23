import 'package:flutter/material.dart';

class Babies with ChangeNotifier {
  final int age;

  Babies({
    required this.age,
  });

  Future<int> getBabies() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    if (age > 1 && age < 5) {
      return 4;
    } else if (age < 1) {
      return 0;
    } else {
      return 2;
    }
  }

  //todo 1 (next main.dart)
  Stream<String> bark() async* {
    for (var i = 1; i < age; i++) {
      await Future.delayed(
        const Duration(seconds: 2),
      );

      yield 'Bark $i times';
    }
  }
}
