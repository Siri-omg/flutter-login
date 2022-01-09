import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:learn_something_new/screens/home%20screen/home_screen.dart';
import 'package:learn_something_new/screens/home%20screen/profile_screen.dart';

import 'add_screen.dart';
class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final List<Widget> _tabItems = [
    HomeScreen(),
    AddScreen(),
    ProfileScreen()
  ];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50,
        items: [
        Icon(Icons.home_filled,
        size: 30,
        color: (_page == 0) ? Colors.black : Colors.white),
        Icon(Icons.add_box,
        size: 30,
        color: (_page == 1) ? Colors.black : Colors.white),
    Icon(Icons.account_circle,
    size: 30,
    color: (_page == 2) ? Colors.black : Colors.white),
    ],
    color: Color.fromRGBO(10, 10, 10, 0.9921568627450981),
    buttonBackgroundColor: Colors.grey[50],
    backgroundColor: Color.fromRGBO(0, 0, 0, 0.9803921568627451),
    animationDuration: Duration(milliseconds: 500),
    onTap: (index) {
    setState(() {
    _page = index;
    });
    },
    letIndexChange: (index) => true,
    ),
    body: _tabItems[_page],
    );
  }
}
