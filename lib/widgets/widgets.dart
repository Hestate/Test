import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../utils/colors.dart';
import 'buttons.dart';
import 'fields.dart';
import 'texts.dart';

class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  WelcomeBackText(),
                  Spacer(flex: 1),
                  LoginField(),
                  ForgotPassField(),
                  Spacer(flex: 1),
                  SignInButton(),
                  SignUpText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationScreenWidget extends StatelessWidget {
  const RegistrationScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  WelcomeText(),
                  Spacer(flex: 1),
                  RegField(),
                  Spacer(flex: 1),
                  SignUpButton(),
                  SignInText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
