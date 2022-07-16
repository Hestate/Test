import 'package:flutter/material.dart';

import '../auth/prerences.dart';
import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();

    wait();
  }

  Future wait() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn = await Preferences.getBool('Sign in', false);

    if (isLoggedIn) {
      Navigator.pushNamed(context, '/MS');
    } else {
      Navigator.pushNamed(context, '/LS');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.grey300,
      body: SafeArea(
        child: Center(
          child: Icon(
            Icons.recycling,
            size: 300,
          ),
        ),
      ),
    );
  }
}
