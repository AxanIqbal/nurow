import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

Xray xrayFromJson(String str) => Xray.fromJson(json.decode(str));

String xrayToJson(Xray data) => json.encode(data.toJson());

class Xray {
  Xray({
    required this.originalImage,
    required this.radiographType,
    required this.timeStamp,
  });

  XFile originalImage;
  DateTime timeStamp;
  String radiographType;

  factory Xray.fromJson(Map<String, dynamic> json) => Xray(
        originalImage: json["originalImage"][0],
        timeStamp: DateFormat('EEE, dd MMM yyyy hh:mm:ss').parse(
          json["timeStamp"],
        ),
        radiographType: json["radiographType"],
      );

  Map<String, dynamic> toJson() => {
        "originalImage": originalImage,
        "timeStamp": DateFormat('EEE, dd MMM yyyy hh:mm:ss').format(timeStamp),
        "radiographType": radiographType,
      };
}
