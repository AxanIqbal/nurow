import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/patient_details_text.dart';
import 'package:nurow/Services/database.dart';
import 'package:nurow/models/patient.dart';

class PatientsTable extends StatelessWidget {
  const PatientsTable({Key? key, this.handle}) : super(key: key);

  final Function? handle;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Patient>>(
        future: DataService().getAllPatients(),
        builder: (BuildContext context, AsyncSnapshot<List<Patient>> snapshot) {
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
              return PatientDetails(
                patients: snapshot.data!,
                handle: handle,
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
        });
  }
}
