import 'package:flutter/foundation.dart';
class MultiProvider2 with ChangeNotifier{
  double _value = 1.0;
  double get value => _value;

  void set value(double val){
    _value = val;
    notifyListeners();
  }
}