import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecshop_git/floating/bottomNavigationBarContent.dart';
import 'package:tecshop_git/generalFunctions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// You can use index stack
      body: BottomNavigationBarContent.bottomScreens[screenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 50.0,
        items: BottomNavigationBarContent.bottomNavigationBarIcons,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.grey[100],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            screenIndex = index;
          });
        },
      ),
    );
  }
}
