import 'package:flutter/material.dart';
import 'package:nurow/Screens/analysis.dart';
import 'package:nurow/Screens/widgets/patient_details_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AnalyseScreen extends StatefulWidget {
  final String image;
  const AnalyseScreen({Key? key, required this.image}) : super(key: key);
  @override
  _AnalyseScreenState createState() => _AnalyseScreenState();
}

class _AnalyseScreenState extends State<AnalyseScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.grey[400],
          padding: const EdgeInsets.all(15),
          child: sizingInformation.isMobile
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                            'https://i.ibb.co/bzyPjVc/X-Icon.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: height * 0.5,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              widget.image,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          decoration: const BoxDecoration(),
                          child: PatientDetailsText(
                            sizingInformation: sizingInformation,
                            width: width * 0.7,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Go Back",
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
                                  if (states.contains(MaterialState.pressed)) {
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
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AnalysisDetails(
                                    imageUrl: widget.image,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "Analyse",
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
                                  if (states.contains(MaterialState.pressed)) {
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
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child:
                          Image.network('https://i.ibb.co/bzyPjVc/X-Icon.png'),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: height * 0.55,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent, width: 5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            widget.image,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: width * 0.6,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PatientDetailsText(
                            width: width * 0.25,
                            sizingInformation: sizingInformation,
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Go Back",
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
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AnalysisDetails(
                                        imageUrl: widget.image,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Analyse",
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
                        ],
                      ),
                    )
                  ],
                ),
        ),
      );
    });
  }
}
