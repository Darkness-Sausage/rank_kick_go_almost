// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future decreaseSelectedDate(DateTime? selectedDate) async {
  // set selectedDate to -1 day
  if (selectedDate != null) {
    DateTime newDate = selectedDate.subtract(Duration(days: 1));
    return newDate;
  } else {
    return null;
  }
}
