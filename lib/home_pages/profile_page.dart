import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/fonts.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                Icon(Icons.person_outline, size: 200),
                SizedBox(height: 50),
                Text(
                  'Profile',
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
