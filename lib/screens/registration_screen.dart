import 'package:auth_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/fonts.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      body: SafeArea(
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
                        Column(children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(25, 100, 25, 5),
                            child: Text(
                              'Welcome!',
                              style: AppTypography.font72b,
                            ),
                          ),
                          Text(
                            'Create your account!',
                            style: AppTypography.font20,
                          ),
                        ]),
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
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Name',
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
                                  hintText: 'Confirm Password',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(children: [
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
                                    builder: ((context) => const LogScreen()),
                                  ),
                                );
                              }),
                              child: Text(
                                'Sign in now!',
                                style: AppTypography.font14bb,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
