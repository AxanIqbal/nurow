import 'dart:convert';

import 'package:image_picker/image_picker.dart';

Xray xrayFromJson(String str) => Xray.fromJson(json.decode(str));

String xrayToJson(Xray data) => json.encode(data.toJson());

class Xray {
  Xray({
    required this.image,
    required this.type,
    required this.name,
    required this.address,
    required this.number,
    required this.dob,
  });

  XFile image;
  String type;
  String name;
  String address;
  String number;
  DateTime dob;

  factory Xray.fromJson(Map<String, dynamic> json) => Xray(
        image: json["image"][0],
        type: json["type"],
        name: json["name"],
        address: json["address"],
        number: json["number"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "type": type,
        "name": name,
        "address": address,
        "number": number,
        "dob": dob.toIso8601String(),
      };
}
