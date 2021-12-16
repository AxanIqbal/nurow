import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nurow/Screens/Substrative/analyse.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/Services/database.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/subtraction.dart';
import 'package:nurow/models/xray.dart';

class SubAnalyseView extends StatelessWidget {
  const SubAnalyseView({
    Key? key,
    required this.patient,
    required this.xray1,
    required this.xray2,
    required this.isNew,
  }) : super(key: key);
  final Patient patient;
  final Xray xray1, xray2;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Center(
              child: XRayTable(
                data: patient,
                currentXray: xray1,
                secondXray: xray2,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: (16 / 720) * MediaQuery.of(context).size.height,
              fontWeight: FontWeight.bold,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    xRayImage(
                      NetworkImage(xray1.originalImage),
                      imageWidth: MediaQuery.of(context).size.width * 0.3,
                      imageHeight: MediaQuery.of(context).size.height * 0.3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'RadioGraph',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(3),
                        },
                        children: [
                          TableRow(
                            children: [
                              const Text("Type"),
                              const Text(":"),
                              Text(
                                xray1.radiographType,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Date"),
                              const Text(":"),
                              Text(
                                DateFormat("dd/MM/yyy")
                                    .format(xray1.timeStamp)
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    xRayImage(
                      NetworkImage(xray2.originalImage),
                      imageWidth: MediaQuery.of(context).size.width * 0.3,
                      imageHeight: MediaQuery.of(context).size.height * 0.3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'RadioGraph',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(3),
                        },
                        children: [
                          TableRow(
                            children: [
                              const Text("Type"),
                              const Text(":"),
                              Text(
                                xray2.radiographType,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Date"),
                              const Text(":"),
                              Text(
                                DateFormat("dd/MM/yyy")
                                    .format(xray2.timeStamp)
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text(
                  "Back",
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
              _Button(
                xray1: xray1,
                xray2: xray2,
                isNew: isNew,
                data: patient,
              ),
              const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}

class _Button extends StatefulWidget {
  const _Button({
    Key? key,
    required this.isNew,
    required this.data,
    required this.xray1,
    required this.xray2,
  }) : super(key: key);

  final bool isNew;
  final Patient data;
  final Xray xray1, xray2;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool isLoading = false;
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> _uploadAndGetUrl(String image, String path) async {
    Reference _ref = storage
        .ref()
        .child('xrays')
        .child(widget.data.id ?? 'dumped')
        .child(path);
    http.Response bytes = await http.get(
      Uri.parse(image),
    );
    UploadTask _task = _ref.putData(
      bytes.bodyBytes,
      SettableMetadata(contentType: 'image/jpeg'),
    );
    String _img = await (await _task).ref.getDownloadURL();
    return _img;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isLoading
          ? () async {
              setState(() {
                isLoading = true;
              });
              if (widget.isNew) {
                Patient? _x =
                    await DataService().addPatient(widget.data.toJson());
                if (_x != null) {
                  widget.data.id = _x.id;
                }
              }

              String _orig1 = await _uploadAndGetUrl(
                widget.xray1.originalImage,
                "subtraction-${widget.xray1.radiographType}-${DateTime.now().toString()}.png",
              );
              String _orig2 = await _uploadAndGetUrl(
                widget.xray2.originalImage,
                "subtraction-${widget.xray1.radiographType}-${DateTime.now().toString()}.png",
              );

              await FirebaseFirestore.instance
                  .collection('patients')
                  .doc(widget.data.id!)
                  .collection('subtractions')
                  .add(
                {
                  'timeStamp': DateFormat('EEE, dd MMM yyyy hh:mm:ss')
                      .format(Timestamp.now().toDate()),
                  'radiographType': widget.xray1.radiographType,
                  'xrays': [
                    {
                      ...widget.xray1.toJson(),
                      "originalImage": _orig1,
                    },
                    {
                      ...widget.xray2.toJson(),
                      "originalImage": _orig2,
                    },
                  ],
                },
              );

              // for (var xray in [widget.xray1, widget.xray2]) {
              //   String _orig = await _uploadAndGetUrl(
              //     xray.originalImage,
              //     "originalImage-${DateTime.now().toString()}.png",
              //   );
              //   var _post = {
              //     ...xray.toJson(),
              //     "originalImage": _orig,
              //     "patientId": widget.data.id,
              //   };
              //   if (xray.optionalImages.isNotEmpty) {
              //     _post["optionalImages"] = [];
              //     for (var element in xray.optionalImages) {
              //       String _op = await _uploadAndGetUrl(
              //         element.image,
              //         "optional-${DateTime.now().toString()}.png",
              //       );
              //       _post["optionalImages"].add({
              //         "view": element.view,
              //         "toothSelections": element.toothSelections,
              //         "image": _op,
              //       });
              //     }
              //   }
              //   await DataService().addXray(_post);
              // }
              final subXray = SubtractionXray(
                xrays: [widget.xray1, widget.xray2],
                timeStamp: Timestamp.now().toDate(),
                radiographType: widget.xray1.radiographType,
              );
              setState(() {
                isLoading = false;
              });
              Get.to(
                () => SubAnalyse(
                  patient: widget.data,
                  subXray: subXray,
                ),
              );
              // locator<NavigationService>().navigateToWidget(
              //       () => XRayAnalyse(
              //     patient: widget.data,
              //     currentXray: widget.currentXray,
              //   ),
              // );
            }
          : null,
      child: !isLoading
          ? const Text(
              "Analyse",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )
          : const CircularProgressIndicator(
              color: Colors.black,
            ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
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
    );
  }
}
