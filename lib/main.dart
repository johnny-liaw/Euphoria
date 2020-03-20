import 'package:euphoria/screens/HomeNavigator.dart';
import 'package:flutter/material.dart';
import 'screens/Landing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Euphoria',
      initialRoute: '/',
      routes: {
        '/': (context) => Landing(),
        '/payments': (context) => HomeNavigator()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


