import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment(-1.0, 0.0),
              child: Text(
                "Patient Detail",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Align(
              alignment: const Alignment(-1.0, 0.0),
              child: SizedBox(
                // width: MediaQuery.of(context).size.width * 0.5,
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
                            ":",
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
                            ":",
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
                            "Patient Number",
                          ),
                          const Text(
                            ":",
                          ),
                          Text(
                            patient.id ?? '',
                            // textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text(
                            "Address",
                          ),
                          const Text(
                            ":",
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
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
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
                      if (snapshot.hasData) {
                        patient.xray = [];
                        for (var xray in snapshot.data!) {
                          patient.xray.add(xray);
                        }
                        return Center(
                          child: DataTable(
                            columns: const [
                              DataColumn(
                                label: Text(
                                  "Date",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Radiograph Type",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              patient.xray.length,
                              (index) => DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      DateFormat("dd/MM/yy").format(
                                          patient.xraySorted[index].timeStamp),
                                    ),
                                  ),
                                  DataCell(
                                    Text(patient
                                        .xraySorted[index].radiographType),
                                  ),
                                ],
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
                    return const Center(
                      child: Text(
                        "Something Went Wrong?",
                      ),
                    );
                  },
                ),
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
