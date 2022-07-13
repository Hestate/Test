import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/authentication_functions.dart';
import '../auth/validation_functions.dart';
import '../screens/registration_screen.dart';
import '../utils/colors.dart';
import '../utils/decorations.dart';
import '../utils/fonts.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      backgroundColor: AppColors.grey300,
      body: SafeArea(
        child: Column(
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
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: Container(
                  decoration: AppFieldBoxDecoration.fieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: loginController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Login',
                      ),
                      validator: (value) {
                        return validateLogin(value!);
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.nextFocus(),
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      return validatePassword(value!);
                    },
                    onEditingComplete: () => node.unfocus(),
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
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  bool credentialExists = await checkCredentials(
                      loginController.text.toString(),
                      passwordController.text.toString());
                  if (credentialExists) {
                    List<String> person =
                        await getPersonList(loginController.text.toString());
                    print(person);
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("User not found. Please sign up."),
                      ),
                    );
                  }
                }
              },
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
                          builder: ((context) => const RegistrationScreen()),
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
        ),
      ),
    );
  }
}
