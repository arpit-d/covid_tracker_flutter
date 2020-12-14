import 'package:flutter/cupertino.dart';

class StateChanger with ChangeNotifier {
  int index = 0;
  void changeState(int i) {
    index = i;
    notifyListeners();
  }
  int get state => index;
}