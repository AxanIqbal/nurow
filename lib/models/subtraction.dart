import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:nurow/models/xray.dart';

List<SubtractionXray> subtractionXrayFromJson(String str) =>
    List<SubtractionXray>.from(
        json.decode(str).map((x) => SubtractionXray.fromJson(x)));

String subtractionXrayToJson(List<SubtractionXray> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubtractionXray {
  SubtractionXray({
    required this.xrays,
    required this.timeStamp,
    required this.radiographType,
    this.id,
  });

  List<Xray> xrays;
  DateTime timeStamp;
  String radiographType;
  String? id;

  factory SubtractionXray.fromJson(Map<String, dynamic> json) =>
      SubtractionXray(
          radiographType: json["radiographType"],
          timeStamp: DateFormat('EEE, dd MMM yyyy hh:mm:ss').parse(
            json["timeStamp"],
          ),
          xrays: List<Xray>.from(json['xrays'].map((x) => Xray.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "xrays": xrays.map((e) => e.toJson()),
        "timeStamp": DateFormat('EEE, dd MMM yyyy hh:mm:ss').format(timeStamp),
        "radiographType": radiographType,
        // "optionalImages": optionalImages.map((e) => e.toJson()),
      };
}
