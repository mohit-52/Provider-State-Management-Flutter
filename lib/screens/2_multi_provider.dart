import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/multi_provider.dart';

class MultiProviderScreen extends StatefulWidget {
  const MultiProviderScreen({Key? key}) : super(key: key);

  @override
  State<MultiProviderScreen> createState() => _MultiProviderScreenState();
}

class _MultiProviderScreenState extends State<MultiProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MultiProvider2>(context, listen: false);
    print("Build");
    return Scaffold(
      appBar: AppBar(title: Text("Multi Provider"),centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<MultiProvider2>(builder: (context, value, child){
            return Slider(
                min: 0,
                max: 1,
                value: value.value, onChanged: (val){
              value.value = val;
            });
          }),
          Consumer<MultiProvider2>(builder: (context, value, child){
            return  Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)
                    ),
                    child: Center(child: Text("Container 1"),),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(value.value)
                    ),
                    child: Center(child: Text("Container 2"),),
                  ),
                ),
              ],
            );
          }),

        ],
      ),
    );
  }
}
