import 'package:auth_app/models/user.dart';
import 'package:auth_app/screens/pages/home_page.dart';
import 'package:auth_app/screens/pages/profile_page.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

User loginUser = User(nickname: '', email: '', password: '', date: '');

class MainScreenState extends State<MainScreen> {
  int _page = 0;

  List<Widget> pages = [
    const HomePage(),
    ProfilePage(user: loginUser),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final screens = [
    const HomePage(),
    ProfilePage(user: loginUser),
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
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('Sign in', false);
            if (mounted) {
              await Navigator.pushNamed(context, '/LS');
            }
          },
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
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
