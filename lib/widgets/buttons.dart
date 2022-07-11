import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../utils/decorations.dart';
import '../utils/fonts.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => MainScreen()),
              ),
            );
          }),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: AppButtonBoxDecoration.buttonDecoration,
              child: Center(
                child: Text(
                  'Sign In',
                  style: AppTypography.font18wb,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => LoginScreen()),
              ),
            );
          }),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: AppButtonBoxDecoration.buttonDecoration,
              child: Center(
                child: Text(
                  'Sign Up',
                  style: AppTypography.font18wb,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
