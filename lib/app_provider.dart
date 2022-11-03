import 'package:flutter/material.dart';

enum AppState {
  initial,
  loading,
  success,
  error,
}

class AppProvider with ChangeNotifier {
  //todo 1
  AppState _state = AppState.initial;
  AppState get state => _state;

  //todo 2 (next main)
  Future<void> getResult(String searchItem) async {
    _state = AppState.loading;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    try {
      if (searchItem == 'fail') {
        throw 'Something went wrong';
      }

      _state = AppState.success;
      notifyListeners();
    } catch (e) {
      _state = AppState.error;
      notifyListeners();
    }
  }
}
