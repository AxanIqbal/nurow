import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurow/Screens/xray_result.dart';
import 'package:nurow/Services/database.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/locator.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/xray.dart';

class PatientDetailTable extends StatelessWidget {
  const PatientDetailTable({Key? key, required this.patient}) : super(key: key);
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
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
                          "Patient Telephone",
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
            Card(
              color: Colors.grey[400],
              child: FutureBuilder<List<Xray>>(
                future: DataService().getAllXrays(patient.id!),
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
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      patient.xray = [];
                      for (var xray in snapshot.data!) {
                        patient.xray.add(xray);
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
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
                                        locator<NavigationService>()
                                            .navigateToWidget(
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
                                      width: MediaQuery.of(context).size.width,
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
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: () => locator<NavigationService>().goBack(),
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
