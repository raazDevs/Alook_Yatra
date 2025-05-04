import 'package:alok_yatra_app/src/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget customDateSelection(String title, DateTime? date, VoidCallback onTap) {
  return ListTile(
    title: Row(
      children: [
        Text(
          "$title: ",
          style: normalStyle,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.grey.shade200, border: Border.all(width: 1)),
          child: Text(
            date != null
                ? DateFormat('dd/MM/yyyy').format(date)
                : 'Select Date',
            style: normalStyle,
          ),
        ),
      ],
    ),
    trailing: const Icon(Icons.calendar_today),
    onTap: onTap,
  );
}
