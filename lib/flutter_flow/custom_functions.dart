import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? getCurrentDate() {
  // give me a custom code where it take the current time from global properties and only take the date from it
  DateTime? now = DateTime.now();
  if (now != null) {
    return DateTime(now.year, now.month, now.day);
  }
  return null;
}

DateTime? getCurrentTime() {
  // give me a custom code where it take the current time from global properties and only take the time from it
  // give me a custom code where it take the current time from global properties and only take the time from it
  DateTime? now = DateTime.now();
  if (now != null) {
    return DateTime(0, 0, 0, now.hour, now.minute, now.second, now.millisecond,
        now.microsecond);
  }
  return null;
}

String? referenceCreate() {
  // i want to create a random string for using as refernce id
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = math.Random.secure();
  final result =
      List.generate(10, (index) => chars[random.nextInt(chars.length)]);
  return result.join();
}

String? timeString(DateTime? date) {
  if (date == null) {
    return null;
  }
  String formattedTime = DateFormat('hh:mm a').format(date);
  return formattedTime;
}
