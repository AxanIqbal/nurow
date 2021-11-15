import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurow/models/xray.dart';

Widget xRayTable(Xray data) {
  return Table(
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
            data.type,
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
