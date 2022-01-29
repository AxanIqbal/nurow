import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/patient_details.dart';
import 'package:nurow/Screens/widgets/patient_table.dart';
import 'package:nurow/models/patient.dart';

class SelectPatient extends StatelessWidget {
  const SelectPatient({Key? key}) : super(key: key);

  void gotoDetail(Patient patient) {
    Get.to(
      () => PatientDetailTable(
        patient: patient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Padding(
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
              child: PatientsTable(
                handle: gotoDetail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
