import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurow/models/patient.dart';

class XRayTable extends StatelessWidget {
  const XRayTable({Key? key, required this.data}) : super(key: key);
  final Patient data;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: (20 / 720) * MediaQuery.of(context).size.height,
        fontWeight: FontWeight.bold,
      ),
      child: Table(
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
              ),
              const Text(
                ":",
              ),
              Text(
                data.name,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(
                "DoB",
              ),
              const Text(
                ":",
              ),
              Text(
                DateFormat("dd/MM/yyy").format(data.dob).toString(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(
                "Radiograph Type",
              ),
              const Text(
                ":",
              ),
              Text(
                data.xray[0]!.radiographType,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
