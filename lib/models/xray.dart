import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:nurow/models/optional_images.dart';
import 'package:nurow/models/xray_category.dart';

Xray xrayFromJson(String str) => Xray.fromJson(json.decode(str));

List<Xray> xraysFromJson(List data) =>
    List<Xray>.from(data.map((x) => Xray.fromJson(x)));

String xrayToJson(Xray data) => json.encode(data.toJson());

class Xray {
  Xray({
    required this.originalImage,
    required this.radiographType,
    required this.timeStamp,
    required this.optionalImages,
    this.id,
    this.anatomy,
    this.boneloss,
    this.annotated,
    this.labelled,
    this.report,
    this.caries,
    this.charting,
  });

  String originalImage, radiographType;
  DateTime timeStamp;
  String? id, charting, report;
  List<OptionalImages> optionalImages;
  XrayCategory? anatomy, boneloss, labelled, annotated, caries;

  factory Xray.fromJson(Map<String, dynamic> json) => Xray(
        originalImage: json["originalImage"],
        timeStamp: DateFormat('EEE, dd MMM yyyy hh:mm:ss').parse(
          json["timeStamp"],
        ),
        radiographType: json["radiographType"],
        optionalImages: json['optionalImages'] != null
            ? json['optionalImages'] is List
                ? List<OptionalImages>.from(json['optionalImages']
                    .map((x) => OptionalImages.fromJson(x)))
                : [
                    OptionalImages.fromJson(json['optionalImages']),
                  ]
            : [],
        id: json['id'],
        charting: json['charting'],
        report: json['report'],
        anatomy: XrayCategory.fromJson(json['anatomy']),
        annotated: XrayCategory.fromJson(json['annotated']),
        boneloss: XrayCategory.fromJson(json['boneloss']),
        caries: XrayCategory.fromJson(json['caries']),
        labelled: XrayCategory.fromJson(json['labelled']),
      );

  Map<String, dynamic> toJson() => {
        "originalImage": originalImage,
        "timeStamp": DateFormat('EEE, dd MMM yyyy hh:mm:ss').format(timeStamp),
        "radiographType": radiographType,
        "charting": charting,
        "report": report,
        "anatomy": anatomy?.toJson(),
        "annotated": annotated?.toJson(),
        "boneloss": boneloss?.toJson(),
        "caries": caries?.toJson(),
        "labelled": labelled?.toJson(),
      };
}
