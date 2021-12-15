import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/Substrative/bindings/report_binding.dart';
import 'package:nurow/Screens/Substrative/report.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/text_animation.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/xray.dart';

class SubAnalyse extends StatefulWidget {
  const SubAnalyse({
    Key? key,
    required this.patient,
    required this.xray1,
    required this.xray2,
  }) : super(key: key);

  final Patient patient;
  final Xray xray1;
  final Xray xray2;

  @override
  State<SubAnalyse> createState() => _SubAnalyseState();
}

class _SubAnalyseState extends State<SubAnalyse> {
  int _count = 0;
  static const List<String> _text = [
    'Radiograph 1:',
    '',
    'Grading radiograph quality - ',
    'Assessing Radiograph quality grade - ',
    'Preprocessing Radiograph - ',
    'Optimising image for A.I analysis - ',
    'Identifying teeth - ',
    'Labelling teeth - ',
    'Labelling teeth - ',
    'Anatomy identification - ',
    'Foreign structure identification - ',
    'Caries detection - ',
    'BoneLevel detection - ',
    'Searching for comparable Radiograph - ',
    'Searching Patient record for same historical radiograph for possible subtractive imagery analysis - ',
    '',
    'Radiograph 2:',
    '',
    'Grading radiograph quality - ',
    'Assessing Radiograph quality grade - ',
    'Preprocessing Radiograph - ',
    'Optimising image for A.I analysis - ',
    'Identifying teeth - ',
    'Labelling teeth - ',
    'Labelling teeth - ',
    'Anatomy identification - ',
    'Foreign structure identification - ',
    'Caries detection - ',
    'BoneLevel detection - ',
    'Searching for comparable Radiograph - ',
    'Searching Patient record for same historical radiograph for possible subtractive imagery analysis - ',
    '',
    '',
  ];

  void counter() {
    _count += 1;
    setState(() {});
    if (_count >= _text.length) {
      Get.to(
        () => SubReport(
          patient: widget.patient,
          xray1: widget.xray1,
          xray2: widget.xray2,
        ),
        binding: SubReportBinding(),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: XRayTable(
                  data: widget.patient,
                  currentXray: widget.xray1,
                ),
              ),
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
          ],
        ),
      ),
    );
  }
}
