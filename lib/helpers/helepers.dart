import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void snackBarMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

String formateDate(Timestamp time) {
  DateTime dateTime = time.toDate();
  String year = dateTime.year.toString();
  String month = dateTime.month.toString();
  String day = dateTime.day.toString();

  return ' $day/' '$month' '/$year';
}
