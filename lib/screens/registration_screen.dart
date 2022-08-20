import 'package:auth_app/auth/validation_functions.dart';
import 'package:auth_app/models/user.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:auth_app/utils/decorations.dart';
import 'package:auth_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  late String _nickname = '', _email = '', _password = '';
  late User _currentUser;
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(_setText);
    _emailController.addListener(_setText);
    _passwordController.addListener(_setText);
  }

  void _setText() {
    setState(() {
      _nickname = _nicknameController.text;
      _email = _emailController.text;
      _password = _passwordController.text;
    });
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
                                controller: _nicknameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Nickname',
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
                                controller: _emailController,
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
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  errorMaxLines: 3,
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
                                controller: _confirmPasswordController,
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
                                  hintText: 'Confirm Password',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is required.';
                                  }
                                  if (value != _passwordController.value.text) {
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
                          onTap: () {
                            final form = _formKey.currentState;
                            if (form!.validate()) {
                              form.save();
                              signUpButton();
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

  void signUpButton() {
    final now = DateTime.now();
    final convertedDateTime = '${now.hour}:${now.minute}';
    print(
        'Nickname: $_nickname, Email: $_email, Password $_password and Date: $convertedDateTime');
    add(
      nickname: _nickname,
      email: _email,
      password: _password,
      date: convertedDateTime,
    );
  }

  Future<Object> add({
    required String nickname,
    required String email,
    required String password,
    required String date,
  }) async {
    try {
      final usersBox = await Hive.openBox('users');
      final user = User(
        nickname: nickname,
        email: email,
        password: password,
        date: date,
      );

      final userExist = usersBox.values
          .where((user) => (user.email.contains(email)))
          .toList();

      if (userExist.isEmpty) {
        await usersBox.add(user);
        _currentUser = user;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("You're sucsefully registered!"),
          ),
        );
        return Navigator.pushNamed(context, '/LS');
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User "$email" already exists.'),
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
