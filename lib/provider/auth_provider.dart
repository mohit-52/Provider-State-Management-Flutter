import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  
  void login(String email, String password) async{
    setLoading(true);
    try{
      http.Response response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {
            "email" : email ,
            "password" : password,
          });

      if(response.statusCode == 200){
        setLoading(false);
        print("Successful");
      }else{
        setLoading(false);
      print("Failed");
      }

    }catch(e){
      setLoading(false);
      print(e.toString());
    }
    }
}