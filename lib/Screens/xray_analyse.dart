import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/text_animation.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/Screens/xray_result.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/locator.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/xray.dart';

class XRayAnalyse extends StatefulWidget {
  const XRayAnalyse({
    Key? key,
    required this.patient,
    required this.currentXray,
  }) : super(key: key);

  final Patient patient;
  final Xray currentXray;

  @override
  State<XRayAnalyse> createState() => _XRayAnalyseState();
}

class _XRayAnalyseState extends State<XRayAnalyse> {
  bool isComplete = true;
  int _count = 0;
  static const List<String> _text = [
    'Identifying teeth and boxed',
    '',
    'Grading radiograph quality - done',
    'Assessing Radiograph quality grade - done',
    'Preprocessing Radiograph - done',
    'Optimising image for A.I analysis - done',
    'Identifying teeth - done',
    'Labelling teeth - done',
    'Labelling teeth - done',
    'Anatomy identification - done',
    'Foreign structure identification - done',
    'Caries detection - done',
    'BoneLevel detection - done',
    'Searching for comparable Radiograph - done',
    'Searching Patient record for same historical radiograph for possible subtractive imagery analysis - done',
  ];

  void counter() {
    _count += 1;
    setState(() {});
    if (_count >= _text.length) {
      locator<NavigationService>().navigateToWidget(
        () => XRayResult(
          patient: widget.patient,
          currentXray: widget.currentXray,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  widget.currentXray.originalImage.path,
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
                      currentXray: widget.currentXray,
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
                        ...List<Widget>.generate(_text.length, (index) {
                          if (_count >= index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: TextAnimation(
                                text: _text[index],
                                counter: counter,
                              ),
                            );
                          }
                          return const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                          );
                        }),
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
