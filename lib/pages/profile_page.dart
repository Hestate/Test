import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/decorations.dart';
import '../utils/fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
              child: Text(
                'Hello',
                style: AppTypography.font56b,
              ),
            ),
            Text(
              'Username',
              style: AppTypography.font20,
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: Container(
                decoration: AppFieldBoxDecoration.fieldDecoration,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(readOnly: true),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: Container(
                decoration: AppFieldBoxDecoration.fieldDecoration,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(readOnly: true),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: Container(
                decoration: AppFieldBoxDecoration.fieldDecoration,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(readOnly: true),
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        )),
      ),
    );
  }
}
