import 'package:flutter/material.dart';

//todo 1
class Babies with ChangeNotifier {
  final int age;

  Babies({
    required this.age,
  });

  //todo 2 (next main.dart)
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
}
