import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../utils/colors.dart';
import 'login_screen.dart';

class MainScreen extends StatefulWidget {
  final List<String> dataList;
  MainScreen({required this.dataList});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _page = 0;

  List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = [
    const HomePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      appBar: AppBar(
        backgroundColor: AppColors.deepPurple,
        title: const Text('Home Page'),
          leading: InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('Sign in', false);
                prefs.setString('login', "");

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Icon(
                Icons.logout,
                color: Colors.white,
              )),
      ),
      body: pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 75.0,
        items: const <Widget>[
          Icon(
            Icons.home_outlined,
            size: 30,
            color: AppColors.grey300,
          ),
          Icon(
            Icons.person_outlined,
            size: 30,
            color: AppColors.grey300,
          ),
        ],
        color: AppColors.deepPurple,
        buttonBackgroundColor: AppColors.deepPurple,
        backgroundColor: AppColors.grey300,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
