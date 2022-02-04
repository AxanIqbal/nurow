import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nurow/Screens/Xray/xray_analyse.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/Services/database.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/xray.dart';

class XRayView extends StatelessWidget {
  const XRayView({
    Key? key,
    required this.data,
    this.isNew = true,
    required this.currentXray,
    this.skip = false,
  }) : super(key: key);

  final Patient data;
  final bool isNew, skip;
  final Xray currentXray;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: List<Widget>.from(
                      currentXray.optionalImages.map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          child: Column(
                            children: [
                              xRayImage(
                                e.image,
                                imageHeight:
                                    MediaQuery.of(context).size.height * 0.18,
                                imageWidth:
                                    MediaQuery.of(context).size.width * 0.18,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.18,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(e.toothSelections),
                                      Text(e.view)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  xRayImage(
                    currentXray.originalImage,
                    imageHeight: MediaQuery.of(context).size.height * 0.5,
                    imageWidth: context.responsiveValue(
                      desktop: MediaQuery.of(context).size.width * 0.5,
                      tablet: MediaQuery.of(context).size.width * 0.6,
                      mobile: MediaQuery.of(context).size.width * 0.7,
                      watch: MediaQuery.of(context).size.width * 0.7,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: context.responsiveValue(
                desktop: MediaQuery.of(context).size.width * 0.4,
                tablet: MediaQuery.of(context).size.width * 0.5,
                mobile: MediaQuery.of(context).size.width * 0.7,
                watch: MediaQuery.of(context).size.width * 0.8,
              ),
              child: XRayTable(
                data: data,
                currentXray: currentXray,
              ),
            ),
            const SizedBox(),
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
                  currentXray: currentXray,
                  isNew: isNew,
                  data: data,
                  skip: skip,
                ),
                const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Button extends StatefulWidget {
  const _Button({
    Key? key,
    required this.isNew,
    required this.data,
    required this.currentXray,
    required this.skip,
  }) : super(key: key);

  final bool isNew, skip;
  final Patient data;
  final Xray currentXray;

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
    UploadTask _task;
    String _img;
    try {
      if (GetPlatform.isMobile) {
        _task = _ref.putFile(
          File(image),
          SettableMetadata(contentType: 'image/jpeg'),
        );
      } else {
        http.Response bytes = await http.get(
          Uri.parse(image),
        );
        _task = _ref.putData(
          bytes.bodyBytes,
          SettableMetadata(contentType: 'image/jpeg'),
        );
      }
      _img = await (await _task).ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      _img = 'error';
    }
    return _img;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isLoading
          ? () async {
              if (widget.skip) {
                Get.to(
                  () => XRayAnalyse(
                    patient: widget.data,
                    currentXray: widget.currentXray,
                  ),
                );
                return;
              }

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
              String _orig = await _uploadAndGetUrl(
                widget.currentXray.originalImage,
                "originalImage-${DateTime.now().toString()}.png",
              );
              var _post = {
                ...widget.currentXray.toJson(),
                "originalImage": _orig,
                "patientId": widget.data.id,
              };
              if (widget.currentXray.optionalImages.isNotEmpty) {
                _post["optionalImages"] = [];
                for (var element in widget.currentXray.optionalImages) {
                  String _op = await _uploadAndGetUrl(
                    element.image,
                    "optional-${DateTime.now().toString()}.png",
                  );
                  _post["optionalImages"].add({
                    "view": element.view,
                    "toothSelections": element.toothSelections,
                    "image": _op,
                  });
                }
              }
              await DataService().addXray(_post);
              setState(() {
                isLoading = false;
              });
              Get.to(
                () => XRayAnalyse(
                  patient: widget.data,
                  currentXray: widget.currentXray,
                ),
              );
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
