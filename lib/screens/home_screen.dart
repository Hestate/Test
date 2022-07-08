import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.home_outlined, size: 200),
                const SizedBox(height: 50),
                Text(
                  'Home',
                  style: AppTypography.font56b,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
