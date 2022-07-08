import 'package:flutter/material.dart';
import 'package:auth_app/widgets/widgets.dart';
import '../utils/colors.dart';

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    welcomeField(),
                    const Spacer(
                      flex: 1,
                    ),
                    loginField(),
                    nameField(),
                    passwordField(),
                    confirmPasswordField(),
                    const Spacer(
                      flex: 1,
                    ),
                    signUpButton(),
                    signInText(context),
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
