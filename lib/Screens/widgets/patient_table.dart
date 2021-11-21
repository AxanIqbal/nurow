import 'package:flutter/material.dart';
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return DataTable(
                columns: <DataColumn>[
                  const DataColumn(
                    label: Text(
                      'Name',
                    ),
                  ),
                  const DataColumn(
                    label: Text(
                      'Date Of Birth',
                    ),
                  ),
                  const DataColumn(
                    label: Text(
                      'Number',
                    ),
                  ),
                  if (handle != null)
                    const DataColumn(
                      label: Text(
                        'Select',
                      ),
                    ),
                ],
                rows: List.generate(
                  snapshot.data!.length,
                  (index) => DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(snapshot.data![index].name),
                      ),
                      DataCell(
                        Text(snapshot.data![index].dob.toIso8601String()),
                      ),
                      DataCell(
                        Text(snapshot.data![index].number),
                      ),
                      if (handle != null)
                        DataCell(
                          IconButton(
                            icon: const Icon(
                              Icons.check,
                              color: Colors.blue,
                            ),
                            onPressed: () => handle!(snapshot.data![index]),
                          ),
                        ),
                    ],
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
        });
  }
}
