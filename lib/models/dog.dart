import 'package:flutter/material.dart';

class Dog with ChangeNotifier { //todo 1
  final String name;
  final String breed;
  int age;

  Dog({
    required this.name,
    required this.breed,
    this.age = 1,
  });

  void grow() {
    age++;
    notifyListeners(); //todo 2 (next main.dart)
    print('age : $age');
  }
}
