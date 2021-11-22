import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/Screens/xray_result.dart';
import 'package:nurow/models/patient.dart';

class XRayAnalyse extends StatefulWidget {
  const XRayAnalyse({Key? key, required this.patient}) : super(key: key);

  final Patient patient;

  @override
  State<XRayAnalyse> createState() => _XRayAnalyseState();
}

class _XRayAnalyseState extends State<XRayAnalyse> {
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                xRayImage(
                  widget.patient.xray[0]!.originalImage.path,
                  imageWidth: MediaQuery.of(context).size.width * 0.5,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: xRayTable(widget.patient),
                )),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.black),
                    width: double.infinity,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText('''
Identified 8 teeth and all boxed
UL8 identified enamel ..
UL8 identified nerve ...
                      
                      
Diagnostics
Analysing for early stage decay - found
Analysing for bone loss - not found


All analysis complete
                      ''')
                      ],
                      isRepeatingAnimation: false,
                      onFinished: () {
                        setState(() {
                          isComplete = true;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            if (!isComplete)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Divider(),
                  const Divider(),
                  const Icon(
                    Icons.access_time,
                    size: 55,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Stop Analyse",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                        (Set<MaterialState> states) {
                          return const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          );
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: () {
                  Get.off(
                    () => XRayResult(
                      patient: widget.patient,
                    ),
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                    (Set<MaterialState> states) {
                      return const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      );
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
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
