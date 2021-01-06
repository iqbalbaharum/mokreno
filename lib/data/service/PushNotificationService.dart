import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keretaapp/constant.dart';
import 'package:keretaapp/data/models/PushNotificationMessage.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  PushNotificationService(this._fcm, this.flutterLocalNotificationsPlugin);

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    String token = await _fcm.getToken();
    print("FirebaseMessaging token: $token");

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");

        PushNotificationMessage notification;

        if (Platform.isAndroid) {
          notification = PushNotificationMessage(
              title: message['notification']['title'],
              body: message['notification']['body']);
        }

        _showNotification(notification);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  Future<void> _showNotification(PushNotificationMessage msg) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(Constants.notiChannelId,
            Constants.notifChannelName, Constants.notiChannelDescription,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, msg.title, msg.body, platformChannelSpecifics);
  }
}
