import 'dart:io';

import 'package:doctor/screens/auth_screens/login_screen/login_screen.dart';
import 'package:doctor/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'consts/colors.dart';
import 'env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyB1e8ukdlfIDBT-mBBfILbqnB0ZyE1iDK4',
              appId: '1:57349243665:android:cde199ba69c9eaed57c2b0',
              messagingSenderId: '57349243665',
              projectId: 'docinzo-c5c51'))
      : await Firebase.initializeApp();
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
