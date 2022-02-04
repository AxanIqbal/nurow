import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nurow/Screens/Substrative/bindings/report_binding.dart';
import 'package:nurow/Screens/Substrative/report.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/text_animation.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/Services/constants.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/subtraction.dart';

class SubAnalyse extends StatefulWidget {
  const SubAnalyse({
    Key? key,
    required this.patient,
    required this.subXray,
    required this.isNew,
  }) : super(key: key);

  final Patient patient;
  final SubtractionXray subXray;
  final bool isNew;

  @override
  State<SubAnalyse> createState() => _SubAnalyseState();
}

class _SubAnalyseState extends State<SubAnalyse> {
  int _count = 0;
  FirebaseStorage storage = FirebaseStorage.instance;
  final ScrollController _scrollController = ScrollController();
  late SubtractionXray subXray;
  late List<List> _text;

  Future<String> _uploadAndGetUrl(String image, String path) async {
    Reference _ref = storage
        .ref()
        .child('xrays')
        .child(widget.patient.id ?? 'dumped')
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

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
    _text = [
      [
        'Syncing With Database - ',
        () async {
          if (widget.isNew) {
            Patient? _x =
                (await (await patientsRef.add(widget.patient)).get()).data();
            if (_x != null) {
              widget.patient.id = _x.id;
            }
          }

          String _orig1 = await _uploadAndGetUrl(
            widget.subXray.xrays[0].originalImage,
            "subtraction-${widget.subXray.xrays[0].radiographType}-${DateTime.now().toString()}.png",
          );
          String _orig2 = await _uploadAndGetUrl(
            widget.subXray.xrays[1].originalImage,
            "subtraction-${widget.subXray.xrays[1].radiographType}-${DateTime.now().toString()}.png",
          );

          try {
            await FirebaseFirestore.instance
                .collection('patients')
                .doc(widget.patient.id!)
                .collection('subtractions')
                .add(
              {
                'timeStamp': DateFormat('EEE, dd MMM yyyy hh:mm:ss')
                    .format(Timestamp.now().toDate()),
                'radiographType': widget.subXray.xrays[0].radiographType,
                'xrays': [
                  {
                    ...widget.subXray.xrays[0].toJson(),
                    "originalImage": _orig1,
                  },
                  {
                    ...widget.subXray.xrays[1].toJson(),
                    "originalImage": _orig2,
                  },
                ],
              },
            );
          } catch (e, s) {
            debugPrint(s.toString());
            Get.snackbar(
              "Error",
              e.toString(),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
              snackPosition: SnackPosition.BOTTOM,
            );
            return;
          }
          subXray = SubtractionXray(
            xrays: widget.subXray.xrays,
            timeStamp: Timestamp.now().toDate(),
            radiographType: widget.subXray.radiographType,
          );
        }
      ],
      ['', () {}],
      ['Radiograph 1:', () {}],
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
      ['Radiograph 2:', () {}],
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
  }

  void counter() {
    _count += 1;
    _scrollToBottom();
    setState(() {});
    if (_count >= _text.length) {
      Get.to(
        () => SubReport(
          patient: widget.patient,
          subXray: widget.subXray,
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
                  currentXray: widget.subXray.xrays[0],
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
                    width: double.infinity,
                    child: ListView(
                      controller: _scrollController,
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
