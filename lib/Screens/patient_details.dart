import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nurow/Screens/Substrative/bindings/report_binding.dart';
import 'package:nurow/Screens/Substrative/report.dart';
import 'package:nurow/Screens/Xray/xray_result.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Services/constants.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/subtraction.dart';
import 'package:nurow/models/xray.dart';

class PatientDetailTable extends StatelessWidget {
  const PatientDetailTable({Key? key, required this.patient}) : super(key: key);
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: (16 / 720) * MediaQuery.of(context).size.height,
                  fontWeight: FontWeight.bold,
                ),
                child: Table(
                  defaultColumnWidth: const IntrinsicColumnWidth(),
                  children: [
                    TableRow(
                      children: [
                        const Text(
                          "Patient Name",
                        ),
                        const Text(
                          ": ",
                        ),
                        Text(
                          patient.name,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text(
                          "DoB",
                        ),
                        const Text(
                          ": ",
                        ),
                        Text(
                          DateFormat("dd/MM/yyyy")
                              .format(patient.dob)
                              .toString(),
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text(
                          "Record Number",
                        ),
                        const Text(
                          ": ",
                        ),
                        Text(
                          patient.number,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text(
                          "Address",
                        ),
                        const Text(
                          ": ",
                        ),
                        Text(
                          patient.address,
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Analysed Radiographs",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Card(
                color: Colors.grey[400],
                child: FutureBuilder<QuerySnapshot<Xray>>(
                  future: getAllXray(patient.id!).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        width: 400,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        patient.xray = [];
                        for (var xray in snapshot.data!.docs) {
                          patient.xray.add(xray.data());
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: DataTable(
                              columns: [
                                const DataColumn(
                                  label: Text(
                                    "Date",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text(
                                      "Radiograph Type",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                patient.xray.length,
                                (index) => DataRow(
                                  cells: [
                                    DataCell(
                                      TextButton(
                                        child: Text(
                                          DateFormat("dd/MM/yy").format(patient
                                              .xraySorted[index].timeStamp),
                                        ),
                                        onPressed: () {
                                          Get.to(
                                            () => XRayResult(
                                              patient: patient,
                                              currentXray:
                                                  patient.xraySorted[index],
                                              isBack: true,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          patient
                                              .xraySorted[index].radiographType,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text("No Data Available"),
                        );
                      }
                    }
                    return const Expanded(
                      child: Center(
                        child: Text(
                          "Something Went Wrong?",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Subtractive Analysis",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Card(
                color: Colors.grey[400],
                child: FutureBuilder<QuerySnapshot<SubtractionXray>>(
                  future: FirebaseFirestore.instance
                      .collection('patients')
                      .doc(patient.id!)
                      .collection('subtractions')
                      .withConverter<SubtractionXray>(
                        fromFirestore: (snapshot, options) =>
                            SubtractionXray.fromJson(snapshot.data()!),
                        toFirestore: (value, options) => value.toJson(),
                      )
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        width: 400,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        patient.subXray = [];
                        for (var subXray in snapshot.data!.docs) {
                          patient.subXray.add(subXray.data());
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: DataTable(
                              columns: [
                                const DataColumn(
                                  label: Text(
                                    "Date",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text(
                                      "Radiograph Type",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                patient.subXray.length,
                                (index) => DataRow(
                                  cells: [
                                    DataCell(
                                      TextButton(
                                        child: Text(
                                          DateFormat("dd/MM/yy").format(
                                              patient.subXray[index].timeStamp),
                                        ),
                                        onPressed: () {
                                          Get.to(
                                            () => SubReport(
                                              patient: patient,
                                              subXray: patient.subXray[index],
                                              isBack: true,
                                            ),
                                            binding: SubReportBinding(),
                                          );
                                        },
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          patient.subXray[index].radiographType,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text("No Data Available"),
                        );
                      }
                    }
                    return const Expanded(
                      child: Center(
                        child: Text(
                          "Something Went Wrong?",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text(
                  "Back",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
