import 'dart:async';

import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({Key? key}) : super(key: key);

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}


class _WhyProviderState extends State<WhyProvider> {
  int x= 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      x++;
      // print(x);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Home Build"+x.toString());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Time: "+DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString()+":" + DateTime.now().second.toString(), style: TextStyle(fontSize: 40),),),
          // Center(child: Text(x.toString(), style: TextStyle(fontSize: 40),),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;
          // print(x);
          setState(() {
            print("CustomBuild");
          });
        },
        child: Icon(Icons.add),

      ),
    );
  }
}
