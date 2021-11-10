import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nurow/Screens/analysis_report.dart';
import 'package:nurow/Screens/widgets/patient_details_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AnalysisDetails extends StatefulWidget {
  final String imageUrl;

  const AnalysisDetails({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _AnalysisDetailsState createState() => _AnalysisDetailsState();
}

class _AnalysisDetailsState extends State<AnalysisDetails> {
  bool isAnalysisDone = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(15),
            height: height,
            width: width,
            color: Colors.grey[400],
            child: sizingInformation.isMobile
                ? SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          height: height * 0.27,
                          // width: width * 0.8,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueAccent, width: 5),
                            color: Colors.black,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                widget.imageUrl,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: PatientDetailsText(
                            sizingInformation: sizingInformation,
                            width: width * 0.7,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.43,
                          width: width * 0.8,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                '''
Identified 8 teeth and all boxed
UL8 identified enamel...
UL8 identified nerve....

Diagnostics
Analysing for early stage decay - found
Analysing for bone loss - not found

All analysis complete.
''',
                                textStyle: const TextStyle(
                                    fontSize: 18.0, color: Colors.green),
                                speed: const Duration(milliseconds: 20),
                              ),
                            ],
                            onFinished: () {
                              setState(() {
                                isAnalysisDone = true;
                              });
                            },
                            isRepeatingAnimation: false,
                            pause: const Duration(milliseconds: 1000),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        isAnalysisDone
                            ? TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Reports(
                                            image: widget.imageUrl,
                                          )));
                                },
                                child: const Text(
                                  "Get Reports",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.resolveWith<
                                          EdgeInsetsGeometry>(
                                      (Set<MaterialState> states) {
                                    return EdgeInsets.symmetric(
                                      horizontal: width * 0.03,
                                      vertical: height * 0.015,
                                    );
                                  }),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.2);
                                      }
                                      return Colors
                                          .black; // Use the component's default.
                                    },
                                  ),
                                ),
                              )
                            : TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Stop Analysis",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.resolveWith<
                                          EdgeInsetsGeometry>(
                                      (Set<MaterialState> states) {
                                    return EdgeInsets.symmetric(
                                      horizontal: width * 0.03,
                                      vertical: height * 0.015,
                                    );
                                  }),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.2);
                                      }
                                      return Colors
                                          .black; // Use the component's default.
                                    },
                                  ),
                                ),
                              ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: height * 0.35,
                        width: width * 0.7,
                        margin: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: height * 0.35,
                              width: width * 0.45,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.blueAccent, width: 5),
                                color: Colors.black,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    widget.imageUrl,
                                  ),
                                ),
                              ),
                            ),
                            PatientDetailsText(
                              sizingInformation: sizingInformation,
                              width: width * 0.2,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.5,
                        width: width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: height * 0.5,
                                width: width * 0.45,
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      '''
                                      Identified 8 teeth and all boxed
                                      UL8 identified enamel...
                                      UL8 identified nerve....
                                      
                                      Diagnostics
                                      Analysing for early stage decay - found
                                      Analysing for bone loss - not found
                                      
                                      All analysis complete.
                                      ''',
                                      textStyle: const TextStyle(
                                          fontSize: 20.0, color: Colors.green),
                                      speed: const Duration(milliseconds: 20),
                                    ),
                                  ],
                                  onFinished: () {
                                    setState(() {
                                      isAnalysisDone = true;
                                    });
                                  },
                                  isRepeatingAnimation: false,
                                  pause: const Duration(milliseconds: 1000),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                )),
                            Container(
                              height: height * 0.5,
                              width: width * 0.23,
                              padding: const EdgeInsets.all(15),
                              // color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  isAnalysisDone
                                      ? TextButton(
                                          onPressed: () {
                                            print("object");
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Reports(
                                                          image:
                                                              widget.imageUrl,
                                                        )));
                                          },
                                          child: const Text(
                                            "Get Reports",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty
                                                .resolveWith<
                                                        EdgeInsetsGeometry>(
                                                    (Set<MaterialState>
                                                        states) {
                                              return EdgeInsets.symmetric(
                                                horizontal: width * 0.03,
                                                vertical: height * 0.015,
                                              );
                                            }),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.pressed)) {
                                                  return Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(0.2);
                                                }
                                                return Colors
                                                    .black; // Use the component's default.
                                              },
                                            ),
                                          ),
                                        )
                                      : TextButton(
                                          onPressed: () {
                                            print("object2");
                                          },
                                          child: const Text(
                                            "Stop Analysis",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty
                                                .resolveWith<
                                                        EdgeInsetsGeometry>(
                                                    (Set<MaterialState>
                                                        states) {
                                              return EdgeInsets.symmetric(
                                                horizontal: width * 0.03,
                                                vertical: height * 0.015,
                                              );
                                            }),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.pressed)) {
                                                  return Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(0.2);
                                                }
                                                return Colors
                                                    .black; // Use the component's default.
                                              },
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
