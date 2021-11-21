import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

Xray xrayFromJson(String str) => Xray.fromJson(json.decode(str));

String xrayToJson(Xray data) => json.encode(data.toJson());

class Xray {
  Xray({
    required this.originalImage,
    required this.xrayLabel,
    DateTime? timeStamp,
  }) : timeStamp = timeStamp ?? Timestamp.now().toDate();

  XFile originalImage;
  DateTime timeStamp;
  String xrayLabel;

  factory Xray.fromJson(Map<String, dynamic> json) => Xray(
        originalImage: json["originalImage"][0],
        timeStamp: json["timeStamp"],
        xrayLabel: json["xrayLabel"],
      );

  Map<String, dynamic> toJson() => {
        "image": originalImage,
        "timeStamp": timeStamp.toIso8601String(),
        "xrayLabel": xrayLabel,
      };
}
