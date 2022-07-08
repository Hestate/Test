import 'package:flutter/material.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:auth_app/screens/registration_screen.dart';
import '../screens/login_screen.dart';
import '../utils/fonts.dart';

class WelcomeField extends StatelessWidget {
  const WelcomeField({
    Key? key,
  }) : super(key: key);

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
          'Sign in your account!',
          style: AppTypography.font20,
        ),
      ],
    );
  }
}

class LoginField extends StatelessWidget {
  const LoginField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey200,
                border: Border.all(color: AppColors.white),
                borderRadius: BorderRadius.circular(16),
              ),
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
        ],
      );
    });
  }
}

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey200,
              border: Border.all(color: AppColors.white),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey200,
              border: Border.all(color: AppColors.white),
              borderRadius: BorderRadius.circular(16),
            ),
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
      ],
    );
  }
}

class ConfirmPassField extends StatelessWidget {
  const ConfirmPassField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey200,
              border: Border.all(color: AppColors.white),
              borderRadius: BorderRadius.circular(16),
            ),
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
      ],
    );
  }
}

class ForgotPassField extends StatelessWidget {
  const ForgotPassField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                'Sign Up',
                style: AppTypography.font18wb,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpText extends StatelessWidget {
  const SignUpText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              'Sign In now!',
              style: AppTypography.font14bb,
            ),
          ),
        ],
      ),
    );
  }
}
