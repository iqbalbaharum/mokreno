import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:keretaapp/app.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationAppLaunchDetails notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');

  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  });

  Function originalOnError = FlutterError.onError;
  FlutterError.onError = (errorDetails) async {};

  runZonedGuarded(() {
    runApp(ProviderScope(
        child: App(
            notificationAppLaunchDetails, flutterLocalNotificationsPlugin)));
  }, (error, stackTrace) {});
}
