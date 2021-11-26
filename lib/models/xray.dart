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
    this.optionalImages,
  });

  XFile originalImage;
  DateTime timeStamp;
  String radiographType;
  List<XFile>? optionalImages;

  factory Xray.fromJson(Map<String, dynamic> json) => Xray(
        originalImage: json["originalImage"],
        timeStamp: DateFormat('EEE, dd MMM yyyy hh:mm:ss').parse(
          json["timeStamp"],
        ),
        radiographType: json["radiographType"],
        optionalImages: json['optionalImages'] != null
            ? json['optionalImages'] is List
                ? json['optionalImages']
                : [
                    json['optionalImages'],
                  ]
            : [],
      );

  Map<String, dynamic> toJson() => {
        "originalImage": originalImage,
        "timeStamp": DateFormat('EEE, dd MMM yyyy hh:mm:ss').format(timeStamp),
        "radiographType": radiographType,
      };
}
