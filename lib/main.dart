import 'package:doctor/screens/auth_screens/login_screen/login_screen.dart';
import 'package:doctor/screens/home.dart';
import 'package:flutter/material.dart';

import 'consts/colors.dart';
import 'env.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      routes: {
        "loginScreen": (context) => LoginScreen(),
        "home": (context) => const Home(),
      },
      home: const Home(),
    );
  }
}
