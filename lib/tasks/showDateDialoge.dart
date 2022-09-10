import 'package:flutter/material.dart';

Future<DateTime> showDateDialoge(
    BuildContext context, DateTime selectedDate) async {
  DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)));
  if (date != null) {
    return date;
  }
  return selectedDate;
}
