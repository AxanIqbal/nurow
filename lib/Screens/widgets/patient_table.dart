import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/patient_details_text.dart';
import 'package:nurow/Services/constants.dart';
import 'package:nurow/Services/database.dart';
import 'package:nurow/models/patient.dart';

class PatientsTable extends StatelessWidget {
  const PatientsTable({Key? key, required this.handle, this.patients})
      : super(key: key);

  final Function handle;
  final List<Patient>? patients;

  @override
  Widget build(BuildContext context) {
    if (patients != null) {
      return Center(
        child: PatientDetails(
          patients: patients!,
          handle: handle,
        ),
      );
    }

    return FutureBuilder<QuerySnapshot<Patient>>(
      future: patientsRef.get(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Patient>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<Patient> data = [];
            for (var element in snapshot.data!.docs) {
              data.add(element.data());
            }
            // print(snapshot.data!.docs.map((e) => e.data()));
            return Center(
              child: PatientDetails(
                patients: data,
                handle: handle,
              ),
            );
          } else {
            return const Center(
              child: Text("No Data Available"),
            );
          }
        }
        return const Center(
          child: Text(
            "Something Went Wrong?",
          ),
        );
      },
    );
  }
}
