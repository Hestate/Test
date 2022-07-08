import 'package:flutter/material.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:auth_app/screens/registration_screen.dart';
import '../utils/fonts.dart';

Widget welcomeField() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 5),
        child: Text(
          'Welcome back!',
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

Widget loginField() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey200,
            border: Border.all(color: AppColors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Login',
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget nameField() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey200,
            border: Border.all(color: AppColors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Login',
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget passwordField() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey200,
            border: Border.all(color: AppColors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget confirmPasswordField() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey200,
            border: Border.all(color: AppColors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Confirm Password',
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget forgotPass(BuildContext context) {
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
              builder: (_) => const AlertDialog(
                title: Text('Really?'),
                content: Text(
                  'Thats bad mate',
                ),
              ),
            );
          },
        )
      ],
    ),
  );
}

Widget signInButton() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.deepPurple,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              'Sign In',
              style: AppTypography.font18wb,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget signUpButton() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.deepPurple,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              'Sign Up',
              style: AppTypography.font18wb,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget signUpText(BuildContext context) {
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

Widget signInText(BuildContext context) {
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
            'Sign In now!',
            style: AppTypography.font14bb,
          ),
        ),
      ],
    ),
  );
}
