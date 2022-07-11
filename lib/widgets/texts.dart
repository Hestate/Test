import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../utils/fonts.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
          child: Text(
            'Welcome!',
            style: AppTypography.font56b,
          ),
        ),
        Text(
          'Sign up in your account!',
          style: AppTypography.font20,
        ),
      ],
    );
  }
}

class WelcomeBackText extends StatelessWidget {
  const WelcomeBackText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
          child: Text(
            'Welcome Back!',
            style: AppTypography.font56b,
          ),
        ),
        Text(
          'Sign in your account!',
          style: AppTypography.font20,
        ),
      ],
    );
  }
}

class ForgotPassField extends StatelessWidget {
  const ForgotPassField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            child: Text(
              'Forgot your Password?',
              style: AppTypography.font14bb,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Really?'),
                  content: const Text('Thats bad mate'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Okay'),
                      child: const Text('Okay'),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not a member? ',
            style: AppTypography.font14g,
          ),
          GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const RegScreen()),
                ),
              );
            }),
            child: Text(
              'Sign Up now!',
              style: AppTypography.font14bb,
            ),
          ),
        ],
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already registered? ',
            style: AppTypography.font14g,
          ),
          GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => LoginScreen()),
                ),
              );
            }),
            child: Text(
              'Sign In now!',
              style: AppTypography.font14bb,
            ),
          ),
        ],
      ),
    );
  }
}
