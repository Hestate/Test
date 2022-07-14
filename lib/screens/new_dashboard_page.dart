import 'package:auth_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  final String data;
  final List<String> dataList;

  const DashboardPage({Key? key, required this.data, required this.dataList})
      : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('Sign in', false);
              prefs.setString('login', "");

              Navigator.pushNamed(context, '/LS');
            },
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: AppColors.grey300,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            "Welcome! ${widget.data}",
            style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dataList.toString(),
            style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
