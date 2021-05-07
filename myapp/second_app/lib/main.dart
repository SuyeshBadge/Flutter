import 'package:flutter/material.dart';
import 'package:second_app/Screens/home.dart';
import 'package:second_app/Screens/login.dart';
import 'package:second_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      Myroutes.homeRoute: (context) => HomePage(),
      Myroutes.loginRoute: (context) => Login(),
    });
  }
}
