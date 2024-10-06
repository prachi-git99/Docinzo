import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../consts/firebase_const.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  storeNotificationsInFirebase(
      message.notification?.title, message.notification?.body);
}

Future storeNotificationsInFirebase(notificationTitle, notificationBody) async {
  DocumentReference store = await firestore
      .collection(usersCollection)
      .doc(currentUser!.uid)
      .collection(notificationCollection)
      .doc();

  store.set({
    "id": currentUser!.uid,
    "title": notificationTitle,
    "body": notificationBody,
    "time": DateTime.now()
  }, SetOptions(merge: true));
}

class PushNotificationService {
  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future initialize() async {
    await _fcm.requestPermission();
    final FCMToken = await _fcm.getToken();
    print('Push notification Token: $FCMToken');
    FirebaseMessaging.onBackgroundMessage((handleBackgroundMessage));
    initPushNotifications();
  }
}
