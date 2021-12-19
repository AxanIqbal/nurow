import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nurow/Screens/Substrative/analyse.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/subtraction.dart';
import 'package:nurow/models/xray.dart';

class SubAnalyseView extends StatelessWidget {
  const SubAnalyseView({
    Key? key,
    required this.patient,
    required this.xray1,
    required this.xray2,
    required this.isNew,
  }) : super(key: key);
  final Patient patient;
  final Xray xray1, xray2;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Center(
              child: XRayTable(
                data: patient,
                currentXray: xray1,
                secondXray: xray2,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: (16 / 720) * MediaQuery.of(context).size.height,
              fontWeight: FontWeight.bold,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    xRayImage(
                      NetworkImage(xray1.originalImage),
                      imageWidth: MediaQuery.of(context).size.width * 0.3,
                      imageHeight: MediaQuery.of(context).size.height * 0.3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'RadioGraph',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(3),
                        },
                        children: [
                          TableRow(
                            children: [
                              const Text("Type"),
                              const Text(":"),
                              Text(
                                xray1.radiographType,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Date"),
                              const Text(":"),
                              Text(
                                DateFormat("dd/MM/yyy")
                                    .format(xray1.timeStamp)
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    xRayImage(
                      NetworkImage(xray2.originalImage),
                      imageWidth: MediaQuery.of(context).size.width * 0.3,
                      imageHeight: MediaQuery.of(context).size.height * 0.3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'RadioGraph',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(3),
                        },
                        children: [
                          TableRow(
                            children: [
                              const Text("Type"),
                              const Text(":"),
                              Text(
                                xray2.radiographType,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Date"),
                              const Text(":"),
                              Text(
                                DateFormat("dd/MM/yyy")
                                    .format(xray2.timeStamp)
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text(
                  "Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                    (Set<MaterialState> states) {
                      return const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      );
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final subXray = SubtractionXray(
                    xrays: [xray1, xray2],
                    timeStamp: Timestamp.now().toDate(),
                    radiographType: xray1.radiographType,
                  );
                  Get.to(
                    () => SubAnalyse(
                      patient: patient,
                      subXray: subXray,
                      isNew: isNew,
                    ),
                  );
                },
                child: const Text(
                  "Analyse",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                    (Set<MaterialState> states) {
                      return const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      );
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
