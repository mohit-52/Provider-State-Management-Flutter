import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Themes"), centerTitle:  true,),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(title: Text("Light Theme"), value: ThemeMode.light, groupValue: themeChanger.themeValue, onChanged: themeChanger.changeTheme),
          RadioListTile<ThemeMode>(title: Text("Dark Theme"), value: ThemeMode.dark, groupValue: themeChanger.themeValue, onChanged: themeChanger.changeTheme),
          RadioListTile<ThemeMode>(title: Text("System Theme"), value: ThemeMode.system, groupValue: themeChanger.themeValue, onChanged: themeChanger.changeTheme),
          Icon(Icons.heart_broken, color: Colors.blue,)
        ],
      ),
    );
  }
}
