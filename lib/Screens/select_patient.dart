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
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "Search Patient",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: PatientsTable(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
