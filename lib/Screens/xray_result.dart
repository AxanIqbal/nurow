import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_result_charting.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/pdf/master.dart';
import 'package:printing/printing.dart';

class XRayResult extends StatelessWidget {
  const XRayResult({Key? key, required this.patient}) : super(key: key);

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text("original"),
                          xRayImage(
                            patient.xray[0]!.originalImage.path,
                            imageHeight:
                                MediaQuery.of(context).size.height * 0.20,
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Tooth identification"),
                          xRayImage(
                            'assets/teethlabel.png',
                            imageHeight:
                                MediaQuery.of(context).size.height * 0.20,
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.20,
                            isAsset: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Anatomy"),
                          xRayImage(
                            "assets/teethlayers.png",
                            imageHeight:
                                MediaQuery.of(context).size.height * 0.20,
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.20,
                            isAsset: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Foreign structures"),
                          xRayImage(
                            patient.xray[0]!.originalImage.path,
                            imageHeight:
                                MediaQuery.of(context).size.height * 0.20,
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Caries (Decay)"),
                          xRayImage(
                            "assets/teethlayers.png",
                            imageHeight:
                                MediaQuery.of(context).size.height * 0.20,
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.20,
                            isAsset: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Bone-loss"),
                          xRayImage(
                            "assets/teethlayers.png",
                            imageHeight:
                                MediaQuery.of(context).size.height * 0.20,
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.20,
                            isAsset: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Center(
                        child: XRayTable(
                      data: patient,
                    )),
                  ),
                  xRayImage(
                    patient.xray[0]!.originalImage.path,
                    imageWidth: MediaQuery.of(context).size.width * 0.40,
                    imageHeight: MediaQuery.of(context).size.height * 0.40,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Charting",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const XRayResultCharting(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Agree"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Edit"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                color: Colors.grey[350],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "Reports",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Icon(
                          Icons.analytics_outlined,
                          size: 30,
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => PdfPreview(
                            maxPageWidth: 700,
                            build: (format) => masterPDF(format, patient),
                          ),
                        );
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * (0.1),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text("Master Report PDF")),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => PdfPreview(
                            maxPageWidth: 700,
                            build: (format) => masterPDF(format, patient),
                          ),
                        );
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * (0.1),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text("Diagnostic Report PDF")),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => PdfPreview(
                            maxPageWidth: 700,
                            build: (format) => masterPDF(format, patient),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * (0.1),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text("Disease data & Statics PDF"),
                      ),
                    ),
                    const SizedBox(),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
