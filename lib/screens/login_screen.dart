import 'package:auth_app/auth/authentication_functions.dart';
import 'package:auth_app/auth/validation_functions.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:auth_app/utils/decorations.dart';
import 'package:auth_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
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
                          style: AppTypography.font28,
                        ),
                        const Spacer(),
                        Padding(
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
                                onEditingComplete: node.nextFocus,
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
                                onEditingComplete: node.unfocus,
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
                                  style: AppTypography.font18bb,
                                ),
                                onTap: () {
                                  showDialog<dynamic>(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text('Really?'),
                                      content: const Text('Thats bad mate'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Okay'),
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
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              final credentialExists = await checkCredentials(
                                loginController.text,
                                passwordController.text,
                              );
                              if (credentialExists) {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setBool('Sign in', true);
                                if (mounted) {
                                  await Navigator.pushNamed(context, '/MS');
                                }
                              } else {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('User not found. Please sign up.'),
                                  ),
                                );
                                }
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration:
                                  AppButtonBoxDecoration.buttonDecoration,
                              child: Center(
                                child: Text(
                                  'Sign in',
                                  style: AppTypography.font22wb,
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
                                style: AppTypography.font18g,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/RS');
                                },
                                child: Text(
                                  'Sign Up now!',
                                  style: AppTypography.font18bb,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
