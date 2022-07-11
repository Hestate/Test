import 'package:flutter/material.dart';

import '../screens/main_screen.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final loginTextController = TextEditingController();
  final passTextController = TextEditingController();
  String? errorText;

  void auth() {
    final login = loginTextController.text;
    final password = passTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      errorText = 'Wrong login/pass';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
