import 'dart:convert';

import 'package:intl/intl.dart';

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
  });

  String originalImage, radiographType;
  DateTime timeStamp;
  String? id;
  List<OptionalImages> optionalImages;

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
      );

  Map<String, dynamic> toJson() => {
        "originalImage": originalImage,
        "timeStamp": DateFormat('EEE, dd MMM yyyy hh:mm:ss').format(timeStamp),
        "radiographType": radiographType,
        // "optionalImages": optionalImages.map((e) => e.toJson()),
      };
}

List<OptionalImages> optionalImagesFromJson(String str) =>
    List<OptionalImages>.from(
        json.decode(str).map((x) => OptionalImages.fromJson(x)));

String optionalImagesToJson(List<OptionalImages> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OptionalImages {
  OptionalImages({
    required this.toothSelections,
    required this.view,
    required this.image,
  });

  String toothSelections;
  String view;
  String image;

  factory OptionalImages.fromJson(Map<String, dynamic> json) => OptionalImages(
        toothSelections: json["toothSelections"],
        view: json["view"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "toothSelections": toothSelections,
        "view": view,
        "image": image,
      };
}
