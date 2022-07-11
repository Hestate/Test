import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../utils/colors.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  MainScreenWidgetState createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends State<MainScreenWidget> {
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
