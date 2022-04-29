import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medorant/pages/reward_screen.dart';
import 'package:medorant/pages/favourite_screen.dart';
import 'package:medorant/pages/profile_screen.dart';
import 'package:medorant/pages/search_screen.dart';

import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int _index = 2;
  final _items = <Widget>[
    const Icon(
      Icons.home,
      size: 30,
    ),
    const Icon(
      Icons.lock_clock,
      size: 30,
    ),
    const Icon(
      Icons.search,
      size: 30,
    ),
    const Icon(
      Icons.favorite_outline,
      size: 30,
    ),
    const Icon(
      Icons.face,
      size: 30,
    )
  ];
  final screens = [
    const RewardScreen(),
    const SearchScreen(),
    const Home(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[_index],
        bottomNavigationBar: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.grey,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: const Color.fromARGB(255, 112, 111, 229),
            items: _items,
            index: _index,
            height: 60,
            animationCurve: Curves.linearToEaseOut,
            animationDuration: const Duration(milliseconds: 30),
            onTap: (index) => setState(() => _index = index)),
      ),
    );
  }
}
