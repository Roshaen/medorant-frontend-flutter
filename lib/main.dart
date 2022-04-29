import 'package:flutter/material.dart';
import 'package:medorant/utils/themes.dart';
import './utils/routes.dart';

import 'pages/home.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medorant',
      theme: AppTheme.lightTheme(context),
      home: const Home(),

      //routes
      routes: {
        AllRoutes.homeRoute: (context) => const Home(),
        AllRoutes.loginRoute: (context) => const Login(),
      },
    );
  }
}
