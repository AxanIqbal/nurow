import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:nurow/models/xray.dart';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

List<Patient> patientsFromJson(List data) =>
    List<Patient>.from(data.map((x) => Patient.fromJson(x)));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  Patient({
    required this.name,
    required this.dob,
    required this.number,
    required this.address,
    required this.xray,
  });

  String name;
  DateTime dob;
  String number;
  String address;
  List<Xray?> xray;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        name: json["name"],
        dob: json["dob"] is DateTime
            ? json["dob"]
            : DateFormat('EEE, dd MMM yyyy hh:mm:ss zzz').parse(json["dob"]),
        number: json["number"],
        address: json["address"],
        xray: json['xray'] != null
            ? json['xray'] is List
                ? List<Xray?>.from(json['xray'].map((x) => Xray.fromJson(x)))
                : [Xray.fromJson(json['xray'])]
            : [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dob": DateFormat('EEE, dd MMM yyyy hh:mm:ss').format(dob),
        "number": number,
        "address": address,
        // "xray": List<dynamic>.from(xray.map((x) => x?.toJson())),
      };
}

class Log {
  Log({
    required this.creationTime,
    required this.uploadedTime,
  });

  String creationTime;
  String uploadedTime;

  factory Log.fromJson(Map<String, dynamic> json) => Log(
        creationTime: json["creationTime"],
        uploadedTime: json["uploadedTime"],
      );

  Map<String, dynamic> toJson() => {
        "creationTime": creationTime,
        "uploadedTime": uploadedTime,
      };
}
