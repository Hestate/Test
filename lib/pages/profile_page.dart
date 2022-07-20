import 'package:auth_app/utils/colors.dart';
import 'package:auth_app/utils/decorations.dart';
import 'package:auth_app/utils/fonts.dart';
import 'package:flutter/material.dart';

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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
                child: Text(
                  'Hello',
                  style: AppTypography.font56b,
                ),
              ),
              Text(
                'Username',
                style: AppTypography.font28,
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
          ),
        ),
      ),
    );
  }
}
