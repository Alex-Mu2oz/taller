import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'config_page.dart';
import 'info_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller Flutter Widgets',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/info': (context) => const InfoPage(),
        '/config': (context) => const ConfigPage(),
      },
    );
  }
}
