import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/analysis_report.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
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
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text("original"),
                    xRayImage(patient.xray[0]!.originalImage.path,
                        imageHeight: 200, imageWidth: 200),
                  ],
                ),
                Column(
                  children: [
                    const Text("Tooth identification"),
                    xRayImage(patient.xray[0]!.originalImage.path,
                        imageHeight: 200, imageWidth: 200),
                  ],
                ),
                Column(
                  children: [
                    const Text("Anatomy"),
                    xRayImage(patient.xray[0]!.originalImage.path,
                        imageHeight: 200, imageWidth: 200),
                  ],
                ),
                Column(
                  children: [
                    const Text("Foriegn structures"),
                    xRayImage(patient.xray[0]!.originalImage.path,
                        imageHeight: 200, imageWidth: 200),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                xRayTable(patient),
                xRayImage(patient.xray[0]!.originalImage.path),
                const SizedBox(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                reportButton(
                  height: 200,
                  width: 200,
                  name: "Master Report",
                  onTap: () {
                    Get.to(
                      () => PdfPreview(
                        maxPageWidth: 700,
                        build: (format) => masterPDF(format, patient),
                      ),
                    );
                  },
                ),
                reportButton(
                  height: 200,
                  width: 200,
                  name: "Diagnosis Report",
                  onTap: () {},
                ),
                reportButton(
                  height: 200,
                  width: 200,
                  name: "Epidemology Report",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
