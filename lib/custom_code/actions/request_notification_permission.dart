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

import 'package:permission_handler/permission_handler.dart';

Future<void> requestNotificationPermission() async {
  // Request notification permissions for Android
  var status = await Permission.notification.request();

  if (status.isGranted) {
    print('Notification permissions granted');
  } else if (status.isDenied) {
    print('Notification permissions denied');
  } else if (status.isPermanentlyDenied) {
    print('Notification permissions permanently denied');
    await openAppSettings(); // Open settings for the user to enable manually
  } else {
    print('Notification permission status: $status');
  }
}
