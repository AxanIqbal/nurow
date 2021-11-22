import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/patient_table.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SelectPatient extends StatelessWidget {
  const SelectPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        backgroundColor: Colors.grey[400],
        body: Container(
          padding: const EdgeInsets.all(10),
          child: const Align(
            alignment: Alignment.topCenter,
            child: PatientsTable(),
          ),
        ),
      );
    });
  }
}
