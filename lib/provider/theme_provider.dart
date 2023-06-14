import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{

  var _themeValue = ThemeMode.system;
  ThemeMode get themeValue => _themeValue;

  void changeTheme(themeValue){
    _themeValue = themeValue;
    notifyListeners();
  }


}