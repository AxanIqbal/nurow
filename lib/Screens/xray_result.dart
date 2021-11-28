import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
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
  }) : super(key: key);

  final Patient patient;
  final Xray currentXray;

  @override
  State<XRayResult> createState() => _XRayResultState();
}

class _XRayResultState extends State<XRayResult> {
  late ImageProvider<Object> _image;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _image = NetworkImage(widget.currentXray.originalImage);
  }

  void changeImage(ImageProvider<Object> image, int index) {
    setState(() {
      _image = image;
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final originalImage = NetworkImage(widget.currentXray.originalImage);
    const toothIdentical = AssetImage('assets/tooth identification.jpg');
    const anatomy = AssetImage('assets/anatomy.png');
    const foriegnStructures = AssetImage('assets/foriegn structures.png');
    const decay = AssetImage('assets/Decay.png');
    const boneLevel = AssetImage('assets/bone-level.png');

    return Scaffold(
      backgroundColor: Colors.grey[400],
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
                            const Text("original"),
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
                      ],
                    ),
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
                        data: widget.patient,
                        currentXray: widget.currentXray,
                      ),
                    ),
                  ),
                  xRayImage(
                    _image,
                    imageWidth: MediaQuery.of(context).size.width * 0.40,
                    imageHeight: MediaQuery.of(context).size.height * 0.40,
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
                  else if (_index == 4)
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Number of decayed teeth in image: 3",
                          ),
                          Text(
                            "- Indicate higher decay risk",
                          ),
                          Text(
                            "Number of restored teeth in image: 5",
                          ),
                          Text(
                            "- Indicate high historical caries rate",
                          ),
                          Text(
                            "% of decay identified within known hotspots:  87%",
                          ),
                          Text(
                            "- Increased confidence in caries diagnosis: 96%",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Patient clinical data ( from notes) :",
                          ),
                          Text(
                            "High sugar intake",
                          ),
                          Text(
                            "Irregular interdental cleaning",
                          ),
                        ],
                      ),
                    )
                  else if (_index == 5)
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "CEJ reference point identified: 8 teeth",
                          ),
                          Text(
                            "   -Reference point for original bone level",
                          ),
                          Text(
                            "Impediments to original bone level projection 0",
                          ),
                          Text(
                            "   -Indicate higher confidence in projection",
                          ),
                          Text(
                            "Impediments to current bone level tracing:  0",
                          ),
                          Text(
                            " -Indicate higher confidence in tracing",
                          ),
                          Text(
                            "Reference marking on teeth to classify boneloss",
                          ),
                          Text(
                            "  -root divided into thirds and marked",
                          ),
                          Text(
                            "Confidence in findings: 98%",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Patient clinical data ( from notes) :",
                          ),
                          Text(
                            "Irregular interdental cleaning",
                          ),
                          Text(
                            "-Higher risk",
                          ),
                          Text(
                            "-Diabetic",
                          ),
                        ],
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
                      onPressed: () {
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
                            "A.I diagnostic report",
                            minFontSize: 0,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => PdfPreview(
                              maxPageWidth: 700,
                              build: (format) async {
                                return await masterPDF(format, widget.patient);
                              }),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
