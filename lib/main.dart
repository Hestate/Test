import 'package:auth_app/models/user.dart';
import 'package:auth_app/repository/home_repository.dart';
import 'package:auth_app/screens/login_screen.dart';
import 'package:auth_app/screens/main_screen.dart';
import 'package:auth_app/screens/registration_screen.dart';
import 'package:auth_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return RepositoryProvider(
          create: (_) => QuotesRepository(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Test',
            initialRoute: '/SS',
            routes: {
              '/SS': (context) => const SplashScreen(),
              '/LS': (context) => const LoginScreen(),
              '/RS': (context) => const RegistrationScreen(),
              '/MS': (context) => const MainScreen(),
            },
          ),
        );
      },
    );
  }
}
