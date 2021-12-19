import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nurow/Screens/Substrative/controller/report_controller.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/subtraction.dart';
import 'package:nurow/pdf/master.dart';
import 'package:printing/printing.dart';

class SubReport extends GetView<SubReportController> {
  const SubReport({
    required this.patient,
    required this.subXray,
    this.isBack,
    Key? key,
  }) : super(key: key);

  final Patient patient;
  final SubtractionXray subXray;
  final bool? isBack;

  @override
  Widget build(BuildContext context) {
    final xray1Image = NetworkImage(subXray.xrays[0].originalImage);
    final xray2Image = NetworkImage(subXray.xrays[1].originalImage);
    const subtractive = AssetImage('assets/subtractive.png');
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
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
                        const Text(
                          "Subtractive",
                        ),
                        InkWell(
                          onTap: () => controller.changeImage(subtractive, 0),
                          child: xRayImage(
                            subtractive,
                            imageHeight:
                                MediaQuery.of(context).size.height * 0.20,
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Radiograph 1"),
                        InkWell(
                          onTap: () => controller.changeImage(xray1Image, 1),
                          child: xRayImage(
                            xray1Image,
                            imageHeight:
                                MediaQuery.of(context).size.height * 0.20,
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Radiograph 2"),
                        InkWell(
                          onTap: () => controller.changeImage(xray2Image, 2),
                          child: xRayImage(
                            xray2Image,
                            imageHeight:
                                MediaQuery.of(context).size.height * 0.20,
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        child: Obx(() {
                          if (controller.index.value == 0) {
                            return const Text(
                              'Subtractive analysis',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else if (controller.index.value == 1) {
                            return const Text(
                              'Radiograph 1',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else {
                            return const Text(
                              'Radiograph 2',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        }),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: XRayTable(
                        data: patient,
                        currentXray: subXray.xrays[0],
                      ),
                    ),
                  ),
                  Obx(
                    () => DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Column(
                          children: [
                            xRayImage(
                              controller.image.value,
                              imageWidth:
                                  MediaQuery.of(context).size.width * 0.40,
                              imageHeight:
                                  MediaQuery.of(context).size.height * 0.40,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            if (controller.index.value == 0)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Time lapse between images: ${subXray.xrays[1].timeStamp.difference(subXray.xrays[0].timeStamp).inHours / 24} days'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      'Comparative image discrepancy: 18%'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Caries LL6: +11%'),
                                  const Text('Caries LL7: + 4%'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Bone-level change average: 0.4%'),
                                ],
                              )
                            else if (controller.index.value == 1)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
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
                                              subXray.radiographType,
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
                                                  .format(subXray
                                                      .xrays[0].timeStamp)
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Caries detected: LL6, LL5, UL4',
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Generalised mild horizontal boneloss 30% sites',
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              )
                            else
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
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
                                              subXray.radiographType,
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
                                                  .format(subXray
                                                      .xrays[1].timeStamp)
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Caries detected: LL6, LL5, UL4',
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Generalised mild horizontal boneloss 30% sites',
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                color: Colors.grey[350],
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Reports",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 35,
                              child: Image.asset(
                                'assets/Report.png',
                                color: Colors.black,
                                fit: BoxFit.fill,
                              ),
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
                            height: MediaQuery.of(context).size.height * (0.06),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: AutoSizeText(
                                "Comparative report PDF",
                                minFontSize: 0,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final pdf = await rootBundle
                                .load("assets/Diagnostic report.pdf");
                            Get.to(
                              () => PdfPreview(
                                maxPageWidth: 700,
                                build: (format) => pdf.buffer.asUint8List(),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * (0.1),
                            height: MediaQuery.of(context).size.height * (0.06),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: AutoSizeText(
                                "A.I diagnostic report",
                                minFontSize: 0,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final pdf = await rootBundle
                                .load("assets/Nurow Disease Data report.pdf");
                            Get.to(
                              () => PdfPreview(
                                maxPageWidth: 700,
                                build: (format) => pdf.buffer.asUint8List(),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * (0.1),
                            height: MediaQuery.of(context).size.height * (0.06),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: AutoSizeText(
                                "Disease data & Statics PDF",
                                minFontSize: 0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(),
                        const SizedBox(),
                      ],
                    ),
                    if (isBack != null && isBack == true)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Transform.translate(
                          offset: const Offset(0, -30),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              padding: const EdgeInsets.all(20.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
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
