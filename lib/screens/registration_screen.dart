import 'package:auth_app/widgets/fields.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.grey300,
      body: RegistrationField(),
    );
  }
}
