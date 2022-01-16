import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/text_animation.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/Screens/xray_result.dart';
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
  int _count = 0;
  static final List<List> _text = [
    ['Identifying teeth and boxed', () {}],
    ['', () {}],
    ['Grading radiograph quality - ', () {}],
    ['Assessing Radiograph quality grade - ', () {}],
    ['Preprocessing Radiograph - ', () {}],
    ['Optimising image for A.I analysis - ', () {}],
    ['Identifying teeth - ', () {}],
    ['Labelling teeth - ', () {}],
    ['Labelling teeth - ', () {}],
    ['Anatomy identification - ', () {}],
    ['Foreign structure identification - ', () {}],
    ['Caries detection - ', () {}],
    ['BoneLevel detection - ', () {}],
    ['Searching for comparable Radiograph - ', () {}],
    ['Searching for data for subtractive imagery - ', () {}],
    ['', () {}],
    ['', () {}],
  ];

  void counter() {
    _count += 1;
    setState(() {});
    if (_count >= _text.length) {
      Get.to(
        () => XRayResult(
          patient: widget.patient,
          currentXray: widget.currentXray,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                  widget.currentXray.originalImage,
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
                                text: _text[index][0],
                                waitFunction: _text[index][1],
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
          ],
        ),
      ),
    );
  }
}
