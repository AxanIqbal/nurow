import 'package:flutter/material.dart';
import 'package:nurow/Screens/analysis_report.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/models/xray.dart';

class XRayResult extends StatelessWidget {
  const XRayResult({Key? key, required this.xray}) : super(key: key);

  final Xray xray;

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
                    xRayImage(xray.image.path,
                        imageHeight: 200, imageWidth: 200),
                  ],
                ),
                Column(
                  children: [
                    const Text("Tooth identification"),
                    xRayImage(xray.image.path,
                        imageHeight: 200, imageWidth: 200),
                  ],
                ),
                Column(
                  children: [
                    const Text("Anatomy"),
                    xRayImage(xray.image.path,
                        imageHeight: 200, imageWidth: 200),
                  ],
                ),
                Column(
                  children: [
                    const Text("Foriegn structures"),
                    xRayImage(xray.image.path,
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
                xRayTable(xray),
                xRayImage(xray.image.path),
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
                    height: 200, width: 200, name: "Master Report", pdfURL: ''),
                reportButton(
                    height: 200,
                    width: 200,
                    name: "Diagnosis Report",
                    pdfURL: ''),
                reportButton(
                    height: 200,
                    width: 200,
                    name: "Epidemology Report",
                    pdfURL: ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
