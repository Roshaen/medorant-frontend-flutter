import 'package:flutter/material.dart';
import 'package:medorant/utils/themes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Home Page',
                style: TextStyle(color: Theme.of(context).primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
