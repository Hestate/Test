import 'package:auth_app/auth/authentication_functions.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:auth_app/utils/decorations.dart';
import 'package:auth_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.dataList}) : super(key: key);
  final List<String> dataList;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

@override
void initState() {
  wait();
}

Future wait() async {
  final prefs = await SharedPreferences.getInstance();

  final login = prefs.getString('login');

  final dataList = await getPersonList(login.toString());
}

class _ProfilePageState extends State<ProfilePage> {
  String? login;
  String? email;
  String? password;
  String? date;

  @override
  void initState() {
    super.initState();

    login = widget.dataList.isEmpty ? 'login' : widget.dataList[0];
    email = widget.dataList.isEmpty ? 'email' : widget.dataList[1];
    password = widget.dataList.isEmpty ? 'password' : widget.dataList[2];
    date = widget.dataList.isEmpty ? 'date' : widget.dataList[3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
                child: Text(
                  'Hello',
                  style: AppTypography.font56b,
                ),
              ),
              Text(
                'Username',
                style: AppTypography.font28,
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Container(
                  decoration: AppFieldBoxDecoration.fieldDecoration,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(readOnly: true),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Container(
                  decoration: AppFieldBoxDecoration.fieldDecoration,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(readOnly: true),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Container(
                  decoration: AppFieldBoxDecoration.fieldDecoration,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(readOnly: true),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
