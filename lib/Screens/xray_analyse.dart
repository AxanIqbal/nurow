import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/text_animation.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/Screens/xray_result.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/locator.dart';
import 'package:nurow/models/patient.dart';

class XRayAnalyse extends StatefulWidget {
  const XRayAnalyse({Key? key, required this.patient}) : super(key: key);

  final Patient patient;

  @override
  State<XRayAnalyse> createState() => _XRayAnalyseState();
}

class _XRayAnalyseState extends State<XRayAnalyse> {
  bool isComplete = true;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 2),
      (Timer t) {
        timer?.cancel();
        locator<NavigationService>().navigateToWidget(
          () => XRayResult(
            patient: widget.patient,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<String> _text = [
      'Identifying teeth and boxed',
      '',
      'Grading radiograph quality - done',
      'Assessing Radiograph quality grade',
      'Preprocessing Radiograph',
      'Optimising image for A.I analysis',
      'Identifying teeth',
      'Labelling teeth',
      'Labelling teeth',
      'Anatomy identification',
      'Foreign structure identification',
      'Caries detection',
      'BoneLevel detection',
      'Searching for comparable Radiograph',
      'Searching Patient record for same historical radiograph for possible subtractive imagery analysis',
    ];

    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                xRayImage(
                  widget.patient.xray[0]!.originalImage.path,
                  imageWidth: MediaQuery.of(context).size.width * 0.4,
                  imageHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                const SizedBox(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: XRayTable(
                      data: widget.patient,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.black),
                    // padding: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: ListView(
                      children: [
                        const SizedBox(),
                        ...List<Widget>.generate(
                          _text.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: TextAnimation(
                              text: _text[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // if (!isComplete)
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       const Divider(),
            //       const Divider(),
            //       const Icon(
            //         Icons.access_time,
            //         size: 55,
            //       ),
            //       ElevatedButton(
            //         onPressed: () {},
            //         child: const Text(
            //           "Stop Analyse",
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 30,
            //           ),
            //         ),
            //         style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(Colors.white),
            //           padding:
            //               MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            //             (Set<MaterialState> states) {
            //               return const EdgeInsets.symmetric(
            //                 horizontal: 40,
            //                 vertical: 20,
            //               );
            //             },
            //           ),
            //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(25.0),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   )
            // else
            //   ElevatedButton(
            //     onPressed: () {
            //       locator<NavigationService>().navigateToWidget(
            //         () => XRayResult(
            //           patient: widget.patient,
            //         ),
            //       );
            //     },
            //     child: const Text(
            //       "Next",
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 30,
            //       ),
            //     ),
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(Colors.white),
            //       padding:
            //           MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            //         (Set<MaterialState> states) {
            //           return const EdgeInsets.symmetric(
            //             horizontal: 40,
            //             vertical: 20,
            //           );
            //         },
            //       ),
            //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(25.0),
            //         ),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
