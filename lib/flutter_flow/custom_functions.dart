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
import '/auth/firebase_auth/auth_util.dart';

String displayDate(DateTime? selectedDate) {
  // parameter is the date selected. return 'today' if it's today, if not, return the date.
  final DateTime now = DateTime.now();
  if (selectedDate == null ||
      selectedDate.year == now.year &&
          selectedDate.month == now.month &&
          selectedDate.day == now.day) {
    return 'Today';
  } else {
    return DateFormat.yMMMMd('en_US').format(selectedDate);
  }
}

DateTime upperSelectedDateTime(DateTime? selectedDate) {
  // return input date as default DateTime format with highest time in the day.
  if (selectedDate == null) {
    return DateTime.now().add(Duration(hours: 23, minutes: 59, seconds: 59));
  } else {
    return DateTime(
        selectedDate.year, selectedDate.month, selectedDate.day, 23, 59, 59);
  }
}

DateTime decreasedSelectedDate(DateTime selectedDate) {
  // decrease selectedDate by 1 day
  return selectedDate.subtract(Duration(days: 1));
}

DateTime increasedSelectedDate(DateTime selectedDate) {
  // increase selectedDate by 1 day
// increase selectedDate by 1 day
  return selectedDate.add(Duration(days: 1));
}

String displayMatchStatus(
  int matchTime,
  DateTime matchStartTime,
  int matchStatus,
  int matchLength,
) {
  int stoppageTime;
  int fullTime;

  switch (matchStatus) {
    // Pre match
    case 0:
      return DateFormat("HH:mm").format(matchStartTime);
    // First half
    case 1:
      if (matchTime > matchLength) {
        stoppageTime = matchTime - matchLength;
        return "$matchLength' + $stoppageTime'";
      } else {
        return "$matchTime'";
      }
    // Half time
    case 2:
      return "HT";
    // Second half
    case 3:
      if (matchTime > matchLength * 2) {
        stoppageTime = matchTime - matchLength * 2;
        fullTime = matchLength * 2;
        return "$fullTime' + $stoppageTime'";
      } else {
        return "$matchTime'";
      }
    // Full time
    case 4:
      return "FT";
    default:
      return "$matchTime'(P)";
  }
}

DateTime upperSelectedDateTimeCopy(DateTime selectedDate) {
  // return input date as default DateTime format with highest time in the day.
  return DateTime(
      selectedDate.year, selectedDate.month, selectedDate.day, 23, 59, 59);
}

DateTime roundupDate(DateTime inputDate) {
  // change hours, minutes, second of a Datetime to 00:00:00
  return DateTime(inputDate.year, inputDate.month, inputDate.day, 0, 0, 0);
}

DateTime lowerSelectedDateTime(DateTime? selectedDate) {
  if (selectedDate == null) {
    return DateTime.now().add(Duration(hours: 0, minutes: 0, seconds: 0));
  } else {
    return DateTime(
        selectedDate.year, selectedDate.month, selectedDate.day, 0, 0, 0);
  }
}
