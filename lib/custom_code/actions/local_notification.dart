// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future localNotification(
  String? title,
  String? content,
) async {
  // Send local notification only Android
  // Initialize the FlutterLocalNotificationsPlugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Configure the Android initialization settings
  var androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // Configure the initialization settings for the FlutterLocalNotificationsPlugin
  var initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: null,
    macOS: null,
  );

  // Initialize the FlutterLocalNotificationsPlugin with the initialization settings
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Configure the notification details
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.max,
  );

  // Send the notification
  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    title ?? 'Default Title', // Use provided title or fallback
    content ?? 'Default Content', // Use provided content or fallback
    NotificationDetails(android: androidPlatformChannelSpecifics),
  );
}
