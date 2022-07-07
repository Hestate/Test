import 'package:auth_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/fonts.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({Key? key}) : super(key: key);

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 100, 0, 5),
                            child: Text(
                              'Welcome back!',
                              style: AppTypography.font72b,
                            ),
                          ),
                          Text(
                            'Sign in your account!',
                            style: AppTypography.font20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.grey200,
                                border: Border.all(color: AppColors.white),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: TextField(
                                  decoration: InputDecoration(
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
                              decoration: BoxDecoration(
                                color: AppColors.grey200,
                                border: Border.all(color: AppColors.white),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
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
                          ),
                        ],
                      ),
                      Column(
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
                                        builder: ((context) =>
                                            const RegScreen()),
                                      ),
                                    );
                                  }),
                                  child: Text(
                                    'Sign up now!',
                                    style: AppTypography.font14bb,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
