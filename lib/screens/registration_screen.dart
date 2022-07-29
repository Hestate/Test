import 'package:auth_app/auth/person_database_helper.dart';
import 'package:auth_app/auth/validation_functions.dart';
import 'package:auth_app/models/person_model.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:auth_app/utils/decorations.dart';
import 'package:auth_app/utils/fonts.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

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
                            'Welcome here!',
                            style: AppTypography.font56b,
                          ),
                        ),
                        Text(
                          'Sign up your account!',
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
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                ),
                                validator: (value) {
                                  return validateEmail(value!);
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
                                controller: passController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  errorMaxLines: 3,
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                ),
                                validator: (value) {
                                  return validatePassword(value!);
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
                                controller: confirmPassController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Confirm Password',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is required.';
                                  }
                                  if (value != passController.value.text) {
                                    return 'Password do not match.';
                                  }
                                  return null;
                                },
                                onEditingComplete: node.unfocus,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              debugPrint('Details are validated!!');
                              debugPrint('Login: ${loginController.text}');
                              debugPrint('Email: ${emailController.text}');
                              debugPrint('Password: ${passController.text}');
                              final personObject = Person(
                                loginController.text,
                                emailController.text,
                                passController.text,
                              );
                              final person =
                                  PersonDatabaseHelper();
                              await person.initializeDatabase();
                              await person.insertPerson(personObject);
                              if(mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("You're sucsefully registered!"),
                                ),
                              );
                              }
                              if (mounted) {
                                await Navigator.pushNamed(context, '/LS');
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
                                  'Sign Up',
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
                                'Already registered? ',
                                style: AppTypography.font18g,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/LS');
                                },
                                child: Text(
                                  'Sign In now!',
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
