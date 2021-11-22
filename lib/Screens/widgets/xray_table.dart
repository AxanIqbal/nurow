import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurow/models/patient.dart';

Widget xRayTable(Patient data) {
  return Table(
    columnWidths: const {
      0: FlexColumnWidth(4),
      1: FlexColumnWidth(1),
      2: FlexColumnWidth(4),
    },
    children: [
      TableRow(
        children: [
          const Text(
            "Patient Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Text(
            ":",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const Text(
            "DoB",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Text(
            ":",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateFormat("dd/MM/yyy").format(data.dob).toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const Text(
            "X-Ray Type",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Text(
            ":",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data.xray[0]!.xrayLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ],
  );
}
