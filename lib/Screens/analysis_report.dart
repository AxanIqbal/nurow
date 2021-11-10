import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/patient_details_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;

class Reports extends StatefulWidget {
  const Reports({Key? key, required this.image}) : super(key: key);

  final image;

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(15),
          color: Colors.grey[500],
          child: sizingInformation.isMobile
              ? SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 55,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: height * 0.37,
                        // width: width * 0.8,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 5),
                          color: Colors.black,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              widget.image,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Original",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 7),
                                Container(
                                  height: height * 0.22,
                                  width: width * 0.38,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent, width: 5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        widget.image,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Structures",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 7),
                              Container(
                                height: height * 0.22,
                                width: width * 0.38,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 5),
                                  color: Colors.black,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      widget.image,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      PatientDetailsText(
                        sizingInformation: sizingInformation,
                        width: width * 0.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                  horizontal: width * 0.05,
                                  vertical: height * 0.02,
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
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Container(
                                      color: Colors.grey[500],
                                      padding: const EdgeInsets.all(10),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            reportButton(
                                                height: height,
                                                width: width * 3,
                                                name: "Master Report",
                                                pdfURL: ''),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            reportButton(
                                                height: height,
                                                width: width * 3,
                                                name: "Diagnosis Report",
                                                pdfURL: ''),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            reportButton(
                                                height: height,
                                                width: width * 3,
                                                name: "Epidemology Report",
                                                pdfURL: ''),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text(
                              "Show Reports",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith<
                                      EdgeInsetsGeometry>(
                                  (Set<MaterialState> states) {
                                return EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.02,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                bottom: 10,
                                left: 10,
                                right: 10,
                              ),
                              // height: height * 0.277,
                              // width: width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Original",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Container(
                                    height: height * 0.23,
                                    width: width * 0.38,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blueAccent, width: 5),
                                      color: Colors.black,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          widget.image,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                bottom: 10,
                                left: 10,
                                right: 10,
                              ),
                              // height: height * 0.277,
                              // width: width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Structures",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Container(
                                    height: height * 0.23,
                                    width: width * 0.38,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blueAccent, width: 5),
                                      color: Colors.black,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          widget.image,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: height * 0.58,
                          width: width * 0.48,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueAccent, width: 5),
                            color: Colors.black,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                widget.image,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                              height: height * 0.25,
                              width: width * 0.3,
                              decoration: const BoxDecoration(
                                  // color: Colors.black,
                                  ),
                              child: Center(
                                child: PatientDetailsText(
                                  sizingInformation: sizingInformation,
                                  width: width * 0.2,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
                          ],
                        ),
                        reportButton(
                            height: height,
                            width: width,
                            name: "Master Report",
                            pdfURL: ''),
                        reportButton(
                            height: height,
                            width: width,
                            name: "Diagnosis Report",
                            pdfURL: ''),
                        reportButton(
                            height: height,
                            width: width,
                            name: "Epidemology Report",
                            pdfURL: ''),
                      ],
                    )
                  ],
                ),
        ),
      );
    });
  }
}

Widget reportButton(
    {required String name, required String pdfURL, height, width}) {
  return InkWell(
    onTap: () {
      // html.window
      //     .open('http://www.africau.edu/images/default/sample.pdf', "_blank");
    },
    child: Column(
      children: [
        Container(
          height: height * 0.23,
          width: width * 0.17,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                spreadRadius: 4,
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.blue,
                spreadRadius: -4,
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Colors.black,
          ),
          child: const Center(
            child: Text(
              "PDF Thumbnail Here",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: height * 0.07,
          width: width * 0.17,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                spreadRadius: 4,
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.blue,
                spreadRadius: -4,
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
