import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_result/anatomy.dart';
import 'package:nurow/Screens/widgets/xray_result/boneloss.dart';
import 'package:nurow/Screens/widgets/xray_result/decay.dart';
import 'package:nurow/Screens/widgets/xray_result/foreign.dart';
import 'package:nurow/Screens/widgets/xray_result/tooth_identification.dart';
import 'package:nurow/Screens/widgets/xray_result_charting.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/xray.dart';
import 'package:nurow/pdf/master.dart';
import 'package:printing/printing.dart';

class XRayResult extends StatefulWidget {
  const XRayResult({
    Key? key,
    required this.patient,
    required this.currentXray,
    this.isBack,
  }) : super(key: key);

  final Patient patient;
  final Xray currentXray;
  final bool? isBack;

  @override
  State<XRayResult> createState() => _XRayResultState();
}

class _XRayResultState extends State<XRayResult> {
  late String _image;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _image = widget.currentXray.originalImage;
  }

  void changeImage(String image, int index) {
    setState(() {
      _image = image;
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final originalImage = widget.currentXray.originalImage;
    const toothIdentical = 'assets/tooth identification.jpg';
    String anatomy = widget.currentXray.anatomy ?? 'assets/anatomy.png';
    String foriegnStructures = 'assets/foriegn structures.png';
    String decay = 'assets/Decay.png';
    String boneLevel = widget.currentXray.boneloss ?? 'assets/bone-level.png';

    return CustomScaffold(
      // floatingActionButton: widget.isBack != null && widget.isBack == true
      //     ? Transform.translate(
      //         offset: const Offset(-40, 0),
      //         child: FloatingActionButton.extended(
      //           onPressed: () {
      //             locator<NavigationService>().goBack();
      //           },
      //           backgroundColor: Colors.black,
      //           label: const Text(
      //             "Back",
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       )
      //     : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false,
                ),
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
                            const Text("Original"),
                            InkWell(
                              onTap: () => changeImage(originalImage, 0),
                              child: xRayImage(
                                originalImage,
                                imageHeight:
                                    MediaQuery.of(context).size.height * 0.20,
                                imageWidth:
                                    MediaQuery.of(context).size.width * 0.20,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text("Tooth identification"),
                            InkWell(
                              onTap: () => changeImage(
                                toothIdentical,
                                1,
                              ),
                              child: xRayImage(
                                toothIdentical,
                                imageHeight:
                                    MediaQuery.of(context).size.height * 0.20,
                                imageWidth:
                                    MediaQuery.of(context).size.width * 0.20,
                                isAsset: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text("Anatomy"),
                            InkWell(
                              onTap: () => changeImage(
                                anatomy,
                                2,
                              ),
                              child: xRayImage(
                                anatomy,
                                imageHeight:
                                    MediaQuery.of(context).size.height * 0.20,
                                imageWidth:
                                    MediaQuery.of(context).size.width * 0.20,
                                isAsset: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text("Foreign structures"),
                            InkWell(
                              onTap: () => changeImage(
                                foriegnStructures,
                                3,
                              ),
                              child: xRayImage(
                                foriegnStructures,
                                imageHeight:
                                    MediaQuery.of(context).size.height * 0.20,
                                imageWidth:
                                    MediaQuery.of(context).size.width * 0.20,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text("Caries (Decay)"),
                            InkWell(
                              onTap: () => changeImage(
                                decay,
                                4,
                              ),
                              child: xRayImage(
                                decay,
                                imageHeight:
                                    MediaQuery.of(context).size.height * 0.20,
                                imageWidth:
                                    MediaQuery.of(context).size.width * 0.20,
                                isAsset: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text("Bone-loss"),
                            InkWell(
                              onTap: () => changeImage(
                                boneLevel,
                                5,
                              ),
                              child: xRayImage(
                                boneLevel,
                                imageHeight:
                                    MediaQuery.of(context).size.height * 0.20,
                                imageWidth:
                                    MediaQuery.of(context).size.width * 0.20,
                                isAsset: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        ...List<Widget>.generate(
                          widget.currentXray.optionalImages.length,
                          (index) => Column(
                            children: [
                              Text("Optional Image ${index + 1}"),
                              InkWell(
                                onTap: () => changeImage(
                                  widget
                                      .currentXray.optionalImages[index].image,
                                  index + 6,
                                ),
                                child: xRayImage(
                                  widget
                                      .currentXray.optionalImages[index].image,
                                  imageHeight:
                                      MediaQuery.of(context).size.height * 0.20,
                                  imageWidth:
                                      MediaQuery.of(context).size.width * 0.20,
                                  isAsset: true,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: XRayTable(
                        data: widget.patient,
                        currentXray: widget.currentXray,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      if (_index == 6 || _index == 7)
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          child: Table(
                            defaultColumnWidth: const IntrinsicColumnWidth(),
                            children: [
                              TableRow(
                                children: [
                                  Text(widget
                                      .currentXray
                                      .optionalImages[_index - 6]
                                      .toothSelections),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text(widget.currentXray
                                      .optionalImages[_index - 6].view),
                                ],
                              ),
                            ],
                          ),
                        ),
                      xRayImage(
                        _image,
                        imageWidth: MediaQuery.of(context).size.width * 0.40,
                        imageHeight: MediaQuery.of(context).size.height * 0.40,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  if (_index == 0)
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
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
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
                        // const SizedBox(),
                      ],
                    )
                  else if (_index == 1)
                    const ToothIdentification()
                  else if (_index == 2)
                    const Anatomy()
                  else if (_index == 3)
                    const Expanded(child: Foreign())
                  else if (_index == 4) // Caries (decay)
                    const Expanded(child: Decay())
                  else if (_index == 5) // Bone-Loss
                    const BoneLoss()
                  else if (_index == 6 || _index == 7)
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: const Text(
                        "Nurow is currently working on intra oral image detection to combine with radiographic diagnosis to improve outcomes",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  const SizedBox(),
                  const SizedBox(),
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
                          onPressed: () async {
                            ByteData pdf;
                            if (widget.currentXray.report != null) {
                              pdf = await rootBundle
                                  .load(widget.currentXray.report!);
                              Get.to(
                                () => PdfPreview(
                                  maxPageWidth: 700,
                                  build: (format) => pdf.buffer.asUint8List(),
                                ),
                              );
                            }

                            Get.to(
                              () => PdfPreview(
                                maxPageWidth: 700,
                                build: (format) =>
                                    masterPDF(format, widget.patient),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * (0.1),
                            height: MediaQuery.of(context).size.height * (0.06),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: AutoSizeText(
                                "Master Report PDF",
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
                    if (widget.isBack != null && widget.isBack == true)
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
