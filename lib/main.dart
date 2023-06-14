import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/auth_provider.dart';
import 'package:provider_state_management/provider/count_provider.dart';
import 'package:provider_state_management/provider/favourite_provider.dart';
import 'package:provider_state_management/provider/multi_provider.dart';
import 'package:provider_state_management/provider/theme_provider.dart';
import 'package:provider_state_management/screens/2_multi_provider.dart';
import 'package:provider_state_management/screens/favourite/3_favourite_screen.dart';
import 'package:provider_state_management/screens/count_example.dart';
import 'package:provider_state_management/screens/login_screen.dart';
import 'package:provider_state_management/screens/themes.dart';
import 'package:provider_state_management/screens/value_notify_listner.dart';
import 'package:provider_state_management/whyProvider.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Main Build");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => MultiProvider2()),
        ChangeNotifierProvider(create: (_)=> FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),

      ],

    child: Builder(builder: (BuildContext context){
      final themeChanger = Provider.of<ThemeProvider>(context);
      return  MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeChanger.themeValue,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
            appBarTheme: AppBarTheme(
            color: Colors.black,
              iconTheme: IconThemeData(
                color: Colors.black
              )
        )
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            color: Colors.teal
          ),
            iconTheme: IconThemeData(
                color: Colors.red
            )
        ),
        home: LoginScreen(),
      );
    }));
  }
}
