import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
   NotifyListenerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(title: Text("Value Notify Listner"), centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ValueListenableBuilder(valueListenable: toggle, builder: (context, value, child){
            return TextFormField(
              obscureText: toggle.value,
              decoration: InputDecoration(
                  hintText: "Password",
                  suffix: InkWell(
                      onTap: (){
                        toggle.value = !toggle.value;

                      },
                      child: toggle.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off))
              ),
            );
          }),
          ValueListenableBuilder(
              valueListenable: _counter,
              builder:(context, value, child){
                return Center(child: Text(_counter.value.toString(), style: TextStyle(fontSize: 40),),);
              } ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("Value Notify Build");
          _counter.value++;
          // print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
