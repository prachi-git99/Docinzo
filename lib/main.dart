import 'dart:io';
import 'dart:ui';

import 'package:doctor/firebase/push_notification_service.dart';
import 'package:doctor/screens/auth_screens/login_screen/login_screen.dart';
import 'package:doctor/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
              storageBucket: 'docinzo-c5c51.appspot.com',
              projectId: 'docinzo-c5c51'))
      : await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  //FIREBASE MESSAGING
  await PushNotificationService().initialize();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final PushNotificationService _notification = PushNotificationService();

  @override
  Widget build(BuildContext context) {
    // _notification.initialize();
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
