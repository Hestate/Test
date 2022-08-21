import 'package:auth_app/auth/validation_functions.dart';
import 'package:auth_app/models/user.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:auth_app/utils/decorations.dart';
import 'package:auth_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  late String _email = '', _password = '';
  late Box box1;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  User loginUser = User(nickname: '', email: '', password: '', date: '');

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_setText);
    _passwordController.addListener(_setText);
  }

  void _setText() {
    setState(() {
      _email = _emailController.text;
      _password = _passwordController.text;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
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
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                  ),
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
                          padding: const EdgeInsets.only(left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  isChecked = !isChecked;
                                  setState(() {});
                                },
                              ),
                              const Text(
                                'Remember Me',
                                style: TextStyle(color: AppColors.grey),
                              ),
                            ],
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
                          onTap: () {
                            final form = _formKey.currentState;
                            if (form!.validate()) {
                              form.save();
                              signInButton();
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

  void signInButton() {
    print('Email: $_email and Password: $_password');
    login(email: _email, password: _password);
  }

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      final usersBox = await Hive.openBox('users');

      final users = usersBox.values
          .where((user) =>
              (user.email.contains(email) && user.password.contains(password)))
          .toList();

      for (final user in users) {
        loginUser = User(
          nickname: user.nickname.toString(),
          email: user.email.toString(),
          password: user.password.toString(),
          date: user.date.toString(),
        );
      }

      if (users.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('Sign in', true);
        return Navigator.pushNamed(context, '/MS');
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not found!'),
          ),
        );
      }
    } on Exception catch (error) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('something wrong! \n $error'),
        ),
      );
    }
  }
}
