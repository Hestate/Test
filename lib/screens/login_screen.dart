import 'package:auth_app/widgets/fields.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.grey300,
      body: SafeArea(
        child: LoginField(),
      ),
    );
  }
}
