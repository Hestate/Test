import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.grey300,
      body: MainScreenWidget(),
    );
  }
}
