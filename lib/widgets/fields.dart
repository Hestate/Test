import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../screens/registration_screen.dart';
import '../utils/decorations.dart';
import '../utils/fonts.dart';

class LoginField extends StatefulWidget {
  const LoginField({Key? key}) : super(key: key);

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  final loginTextController = TextEditingController();

  final passTextController = TextEditingController();

  String? errorText;

  void login() {
    final login = loginTextController.text;
    final password = passTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Wrong login/pass',
              textAlign: TextAlign.center,
              style: AppTypography.font18wb,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
          child: Text(
            'Welcome back!',
            style: AppTypography.font56b,
          ),
        ),
        Text(
          'Sign in your account!',
          style: AppTypography.font20,
        ),
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: loginTextController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Login',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: passTextController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
          ),
        ),
        Padding(
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
        ),
        const Spacer(flex: 1),
        GestureDetector(
          onTap: login,
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
        Padding(
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
        ),
      ],
    );
  }
}

class RegistrationField extends StatelessWidget {
  const RegistrationField({Key? key}) : super(key: key);

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
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
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
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                ),
                validator: (value) => null,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
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
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
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
        const Spacer(flex: 1),
        GestureDetector(
          onTap: (() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const LoginScreen()),
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
        Padding(
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
                      builder: ((context) => const LoginScreen()),
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
        ),
      ],
    );
  }
}
