import 'package:flutter/material.dart';
import 'package:nurow/Services/database.dart';
import 'package:nurow/models/user.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Audit extends StatelessWidget {
  const Audit({Key? key}) : super(key: key);

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
                  "Audit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: sizingInformation.isMobile ? 20 : 60,
                ),
                // Container(
                //   child: sizingInformation.isMobile
                //       ? Column(
                //     children: [
                //       Container(
                //         height: height * 0.06,
                //         width: width * 0.7,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(50),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       TextButton(
                //         onPressed: () {},
                //         child: Text(
                //           "Search",
                //           style: TextStyle(
                //             color: Colors.white,
                //           ),
                //         ),
                //         style: ButtonStyle(
                //           padding: MaterialStateProperty.resolveWith<
                //               EdgeInsetsGeometry>(
                //                   (Set<MaterialState> states) {
                //                 return EdgeInsets.symmetric(
                //                   horizontal: width * 0.01,
                //                   vertical: height * 0.015,
                //                 );
                //               }),
                //           backgroundColor:
                //           MaterialStateProperty.resolveWith<Color>(
                //                 (Set<MaterialState> states) {
                //               if (states.contains(MaterialState.pressed))
                //                 return Theme
                //                     .of(context)
                //                     .colorScheme
                //                     .primary
                //                     .withOpacity(0.2);
                //               return Colors
                //                   .black; // Use the component's default.
                //             },
                //           ),
                //         ),
                //       ),
                //     ],
                //   )
                //       : Row(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Container(
                //         height: height * 0.06,
                //         width: width * 0.2,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(50),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       TextButton(
                //         onPressed: () {},
                //         child: Text(
                //           "Search",
                //           style: TextStyle(
                //             color: Colors.white,
                //           ),
                //         ),
                //         style: ButtonStyle(
                //           padding: MaterialStateProperty.resolveWith<
                //               EdgeInsetsGeometry>(
                //                   (Set<MaterialState> states) {
                //                 return EdgeInsets.symmetric(
                //                   horizontal: width * 0.01,
                //                   vertical: height * 0.015,
                //                 );
                //               }),
                //           backgroundColor:
                //           MaterialStateProperty.resolveWith<Color>(
                //                 (Set<MaterialState> states) {
                //               if (states.contains(MaterialState.pressed))
                //                 return Theme
                //                     .of(context)
                //                     .colorScheme
                //                     .primary
                //                     .withOpacity(0.2);
                //               return Colors
                //                   .black; // Use the component's default.
                //             },
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: sizingInformation.isMobile ? 40 : 15,
                ),
                SizedBox(
                  height: height * 0.7,
                  child: FutureBuilder<List<User>>(
                    future: DataService().getUserLogs(),
                    builder: (context, snapshot) {
                      // print(snapshot.data);

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: sizingInformation.isDesktop
                              ? height * 0.8
                              : height * 0.9,
                          width: width * .8,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        // List<User> data = List<User>.from(snapshot
                        //     .data!.data!
                        //     .map((e) => User.fromJson(e)));
                        // List<UserModel> data = snapshot.data.data;
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            columns: const [
                              DataColumn(
                                label: Text(
                                  "User Name",
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Created on",
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Last Login",
                                ),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              snapshot.data!.length,
                              (int index) => DataRow(
                                cells: [
                                  DataCell(
                                      Text(snapshot.data![index].userName)),
                                  DataCell(Text(snapshot
                                      .data![index].creationTime
                                      .toString())),
                                  DataCell(
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: DataTable(
                                                        columns: const [
                                                          DataColumn(
                                                            label: Text(
                                                              "last Logged In",
                                                            ),
                                                          ),
                                                        ],
                                                        rows: List<
                                                            DataRow>.generate(
                                                          snapshot
                                                              .data![index]
                                                              .lastSignInTime
                                                              .length,
                                                          (int index2) =>
                                                              DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text(snapshot
                                                                    .data![
                                                                        index]
                                                                    .lastSignInTime[
                                                                        index2]
                                                                    .toString()),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: DataTable(
                                                        columns: const [
                                                          DataColumn(
                                                            label: Text(
                                                              "last Logged Out",
                                                            ),
                                                          ),
                                                        ],
                                                        rows: List<
                                                            DataRow>.generate(
                                                          snapshot
                                                              .data![index]
                                                              .lastLogOutTime
                                                              .length,
                                                          (int index2) =>
                                                              DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text(snapshot
                                                                    .data![
                                                                        index]
                                                                    .lastLogOutTime[
                                                                        index2]
                                                                    .toString()),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: const Text('View'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        height: height * 0.7,
                        width: width * .8,
                        child: const Center(
                          child: Text("None"),
                        ),
                      );
                    },
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
