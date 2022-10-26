import 'package:flutter/material.dart';

//todo 1 (next main.dart)
class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}
