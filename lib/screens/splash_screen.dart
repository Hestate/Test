import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/authentication_functions.dart';
import '../auth/prerences.dart';
import '../utils/colors.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

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

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // If we don't get any value back then it will be considered false;
    isLoggedIn = await Preferences.getBool('Sign in', false);

    if (isLoggedIn) {
      String? login = await prefs.getString('login');

      List<String> person = await getPersonList(login!);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(
                    dataList: person.length == 0 ? [] : person,
                  )));
    } else
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
