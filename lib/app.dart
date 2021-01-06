import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/constant.dart';
import 'package:keretaapp/data/service/PushNotificationService.dart';

import 'package:keretaapp/ui/app_theme.dart';
import 'package:keretaapp/ui/auth/sign_in_page.dart';
import 'package:keretaapp/ui/auth/sign_up_page.dart';
import 'package:keretaapp/ui/home/home_page.dart';
import 'package:keretaapp/ui/profile/profile_page.dart';
import 'package:keretaapp/ui/request/new_request_page.dart';

class App extends HookWidget {
  static final FirebaseMessaging _messaging = FirebaseMessaging();

  const App(
      this.notificationAppLaunchDetails, this.flutterLocalNotificationsPlugin,
      {Key key})
      : super(key: key);

  final NotificationAppLaunchDetails notificationAppLaunchDetails;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  bool get didNotificationLaunchApp =>
      notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read(appThemeNotifierProvider);
    final setting =
        useProvider(appThemeNotifierProvider.select((value) => value.setting));

    useFuture(useMemoized(appTheme.themeMode, [setting]));

    // initialize service
    final pushNotificationService =
        PushNotificationService(_messaging, flutterLocalNotificationsPlugin);
    pushNotificationService.initialise();

    // local notification

    // initial widget
    return GetMaterialApp(
      title: 'Workshop',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: setting ?? ThemeMode.light,
      home: SignInPage(),
      routes: {
        Constants.pageSignIn: (context) => SignInPage(),
        Constants.pageSignUp: (context) => SignUpPage(),
        Constants.pageHome: (context) => HomePage(),
        Constants.pageNewRequest: (context) => NewRequestPage(),
        Constants.pageProfile: (context) => ProfilePage()
      },
    );
  }
}
