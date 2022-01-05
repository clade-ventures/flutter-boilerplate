import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

// Please refer to https://pub.dev/packages/flutter_local_notifications

NotificationPlugin notificationPlugin = NotificationPlugin._();

class NotificationPlugin {
  NotificationPlugin._() {
    init();
  }

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late InitializationSettings initializedSettings;

  final didReceivedLocalNotificationSubject =
      BehaviorSubject<ReceivedNotification>();

  Future<void> init() async {
    Logger().i('Initializing Notification Plugin Service');
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _requestIOSPermission();
    }
    await initializePlatformSpecifics();
  }

  Future<void> initializePlatformSpecifics() async {
    try {
      const initializedSettingAndroid =
          AndroidInitializationSettings('app_icon');
      final initializedSettingIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) async {
          final receivedNotification = ReceivedNotification(
            id: id,
            title: title,
            body: body,
            payload: payload,
          );
          didReceivedLocalNotificationSubject.add(receivedNotification);
        },
      );
      initializedSettings = InitializationSettings(
        android: initializedSettingAndroid,
        iOS: initializedSettingIOS,
      );
      await flutterLocalNotificationsPlugin.initialize(
        initializedSettings,
        onSelectNotification: (String? payload) async {
          if (payload != null) {
            debugPrint('notification payload: $payload');
            await onNotificationClick(payload);
          }
        },
      );
    } catch (e) {
      Logger().e('Error Notification ${e.toString()}');
    }
  }

  Future<void> onNotificationClick(dynamic payload) async {
    if (payload != null) {
      // final json = jsonDecode(payload) as Map<String, dynamic>;
      // TODO(any): On Notifications click;
    }
  }

  Future<void> showNotification(
    int id,
    String title,
    String body,
    String payload,
    String types,
  ) async {
    print('showing notification');
    const androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID',
      'CHANNEL_NAME',
      channelDescription: 'CHANNEL_DESCRIPTION',
      importance: Importance.max,
      priority: Priority.high,
      visibility: NotificationVisibility.public,
      sound: RawResourceAndroidNotificationSound('notification'),
      autoCancel: false,
      timeoutAfter: 5000,
      icon: 'app_icon',
      enableLights: true,
      styleInformation: DefaultStyleInformation(true, true),
    );

    const iosChannelSpecifics = IOSNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
      android: androidChannelSpecifics,
      iOS: iosChannelSpecifics,
    );
    final payloads = jsonEncode(<String, String>{
      'type': payload,
      'data': types,
    });
    await flutterLocalNotificationsPlugin
        .show(id, title, body, platformChannelSpecifics, payload: payloads);
  }

  void setOnNotificationClick(Function() onNotificationClick) {
    flutterLocalNotificationsPlugin.initialize(
      initializedSettings,
      onSelectNotification: (String? payloadAndTypes) async {
        // TODO(any): Handling.
        // final payloadAndTypesSlice = payloadAndTypes.split(':');
        // await onNotificationClick(
        //     // payloadAndTypesSlice[0],
        //     // payloadAndTypesSlice[1],
        //     );
      },
    );
  }

  void _requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(sound: true);
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    this.title,
    this.body,
    this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
