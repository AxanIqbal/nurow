import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurow/models/patient.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key, required this.patients, required this.handle})
      : super(key: key);
  final List<Patient> patients;
  final Function handle;

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  TextEditingController controller = TextEditingController();
  String _searchResult = '';
  List<Patient> patientFiltered = [];

  @override
  void initState() {
    setState(() {
      patientFiltered = widget.patients;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          SizedBox(
            width: 400,
            child: ListTile(
              tileColor: Colors.white,
              leading: const Icon(Icons.search),
              title: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(
                    () {
                      _searchResult = value;
                      patientFiltered = widget.patients
                          .where((user) =>
                              user.name.toLowerCase().contains(_searchResult))
                          .toList();
                    },
                  );
                },
              ),
              trailing: _searchResult != ''
                  ? IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        setState(
                          () {
                            controller.clear();
                            _searchResult = '';
                            patientFiltered = widget.patients;
                          },
                        );
                      },
                    )
                  : null,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Card(
              color: Colors.grey[400],
              elevation: 1.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Date Of Birth',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Telephone',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(
                    patientFiltered.length,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                          TextButton(
                              onPressed: () =>
                                  widget.handle(patientFiltered[index]),
                              child: Text(patientFiltered[index].name)),
                        ),
                        DataCell(
                          Text(
                            DateFormat("dd-MM-yyyy")
                                .format(patientFiltered[index].dob),
                          ),
                        ),
                        DataCell(
                          Text(patientFiltered[index].address),
                        ),
                        DataCell(
                          Text(patientFiltered[index].number),
                        ),
                        // if (widget.handle != null)
                        //   DataCell(
                        //     IconButton(
                        //       icon: const Icon(
                        //         Icons.check,
                        //         color: Colors.blue,
                        //       ),
                        //       onPressed: () => widget.handle!(patientFiltered[index]),
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
