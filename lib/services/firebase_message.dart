import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_hub/Screens/notification_screen.dart';
import 'package:food_hub/configs/constant_varible.dart';

class FireBaseMessService {
  final _fireBaseMessService = FirebaseMessaging.instance;
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  //init notification FCM
  Future<void> initNotification() async {
    await _fireBaseMessService.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    final fcmToken = await _fireBaseMessService.getToken();
    await initLocalNotification();
    debugPrint("token $fcmToken");

    FirebaseMessaging.onMessage.listen((event) async {
      final notification = event.notification;
      if (notification == null) return;
      showNotification(
          notification.hashCode, notification.title, notification.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      navigatorKey.currentState?.pushNamed(NotificationScreen.id,
          arguments: initialMessage?.notification?.body);
    });
  }

  static void handleNotificationRes(NotificationResponse response) {
    navigatorKey.currentState
        ?.pushNamed(NotificationScreen.id, arguments: response.payload);
  }

  // init local notification
  Future<void> initLocalNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher');
    InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: handleNotificationRes,
      onDidReceiveBackgroundNotificationResponse:
          handleNotificationRes,
    );
  }

  Future<void> showNotification(int id, String? title, String? body) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelId',
      'channelName',
      priority: Priority.high,
      importance: Importance.max,
      icon: "ic_launcher",
      playSound: true,
      channelShowBadge: true,
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails,
        payload: body);
  }
}
