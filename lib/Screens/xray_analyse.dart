import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/models/xray.dart';

class XRayAnalyse extends StatefulWidget {
  const XRayAnalyse({Key? key, required this.xray}) : super(key: key);

  final Xray xray;

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
                xRayImage(widget.xray.image.path),
                Expanded(child: xRayTable(widget.xray)),
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
              )
            else
              ElevatedButton(
                onPressed: () {},
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
