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

import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

Future<void> scheduleNotification(
  String? title,
  String? content,
  String? time, // e.g., "2:30 PM"
) async {
  print('Provided time: $time');

  // Parse the time string into a DateTime object (e.g., "2:30 PM")
  DateTime parsedTime = DateFormat.jm().parse(time!);

  // Get the current date and time
  DateTime now = DateTime.now();

  // Create a scheduled time for today at the parsed time
  var scheduledTime = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    parsedTime.hour,
    parsedTime.minute,
  );

  // If the scheduled time is in the past, schedule it for the next day
  if (scheduledTime.isBefore(now)) {
    scheduledTime = scheduledTime.add(Duration(days: 1));
  }

  // INITIALIZE the timezone database
  tzdata.initializeTimeZones();

  // Initialize the FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize the Android-specific settings for the notification
  var androidSettings = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.high,
    priority: Priority.high,
    icon:
        '@mipmap/ic_launcher', // Replace with your small icon name without the extension
  );

  // Initialize the notification details
  var notificationDetails =
      NotificationDetails(android: androidSettings, iOS: null);

  // Schedule the notification to repeat daily at the specified time
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    title!,
    content!,
    scheduledTime,
    notificationDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents:
        DateTimeComponents.time, // Repeat daily at this time
    payload: 'custom_sound',
  );
  print('Notification scheduled for $scheduledTime');
}
