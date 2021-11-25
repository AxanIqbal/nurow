import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/locator.dart';
import 'package:nurow/models/patient.dart';

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
            const Text(
              "Patient Detail",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // width: MediaQuery.of(context).size.width * 0.5,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: (16 / 720) * MediaQuery.of(context).size.height,
                  fontWeight: FontWeight.bold,
                ),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(0.5),
                    2: FlexColumnWidth(8),
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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  heightFactor: 1,
                  widthFactor: 4,
                  child: Card(
                    color: Colors.grey[400],
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
                                DateFormat("dd/MM/yy")
                                    .format(patient.xray[index]!.timeStamp),
                              ),
                            ),
                            DataCell(
                              Text(patient.xray[index]!.radiographType),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
