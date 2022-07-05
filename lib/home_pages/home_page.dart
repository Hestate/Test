import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.home_outlined, size: 200),
                SizedBox(height: 50),
                Text(
                  'Home',
                  style: AppTypography.font36b,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
