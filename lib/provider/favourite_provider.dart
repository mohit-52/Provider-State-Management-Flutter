import 'package:flutter/material.dart';

class FavouriteItemProvider with ChangeNotifier{

  List<int> _selected = [];
  List<int> get selected => _selected;

  void addItem(int index){
   if(_selected.contains(index)){
     _selected.remove(index);
   }else{
     _selected.add(index);
   }
    notifyListeners();
  }

}