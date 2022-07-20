import 'package:auth_app/auth/prerences.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:flutter/material.dart';

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
    await Future<dynamic>.delayed(const Duration(seconds: 2));
    isLoggedIn = await Preferences.getBool('Sign in', false);

    if (isLoggedIn) {
      if(mounted) {
        await Navigator.pushNamed(context, '/MS');
      }
    } else {
      if(mounted) {
        await Navigator.pushNamed(context, '/LS');
      }
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
