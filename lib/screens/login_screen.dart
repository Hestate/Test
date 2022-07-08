import 'package:flutter/material.dart';
import 'package:auth_app/widgets/widgets.dart';
import '../utils/colors.dart';

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
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    WelcomeField(),
                    Spacer(
                      flex: 1,
                    ),
                    LoginField(),
                    PasswordField(),
                    ForgotPassField(),
                    Spacer(
                      flex: 1,
                    ),
                    SignInButton(),
                    SignUpText(),
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
