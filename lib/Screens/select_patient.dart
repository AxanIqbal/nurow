import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SelectPatient extends StatefulWidget {
  const SelectPatient({Key? key}) : super(key: key);

  @override
  _SelectPatientState createState() => _SelectPatientState();
}

class _SelectPatientState extends State<SelectPatient> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        backgroundColor: Colors.grey[400],
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Patient Search",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: sizingInformation.isMobile ? 20 : 60,
                ),
                Container(
                  child: sizingInformation.isMobile
                      ? Column(
                          children: [
                            Container(
                              height: height * 0.06,
                              width: width * 0.7,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith<
                                        EdgeInsetsGeometry>(
                                    (Set<MaterialState> states) {
                                  return EdgeInsets.symmetric(
                                    horizontal: width * 0.01,
                                    vertical: height * 0.015,
                                  );
                                }),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.2);
                                    }
                                    return Colors
                                        .black; // Use the component's default.
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: height * 0.06,
                              width: width * 0.2,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith<
                                        EdgeInsetsGeometry>(
                                    (Set<MaterialState> states) {
                                  return EdgeInsets.symmetric(
                                    horizontal: width * 0.01,
                                    vertical: height * 0.015,
                                  );
                                }),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.2);
                                    }
                                    return Colors
                                        .black; // Use the component's default.
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                SizedBox(
                  height: sizingInformation.isMobile ? 40 : 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: height * 0.7,
                    child: SingleChildScrollView(
                      child: DataTable(
                        columns: const [
                          DataColumn(
                            label: Text(
                              "Patient Name",
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Date of Birth",
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Disease",
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Disease",
                            ),
                          ),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Jon Doe")),
                              DataCell(Text("20-20-2021")),
                              DataCell(Text("Lung Cancer")),
                              DataCell(Text("Lung Cancer"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
