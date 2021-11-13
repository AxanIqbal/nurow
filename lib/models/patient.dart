import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  Patient({
    required this.name,
    required this.dob,
    required this.number,
    required this.address,
    required this.xray,
    required this.xrayLabel,
    required this.log,
  });

  String name;
  String dob;
  String number;
  String address;
  List<String> xray;
  List<String> xrayLabel;
  Log log;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        name: json["name"],
        dob: json["dob"],
        number: json["number"],
        address: json["address"],
        xray: List<String>.from(json["xray"].map((x) => x)),
        xrayLabel: List<String>.from(json["xrayLabel"].map((x) => x)),
        log: Log.fromJson(json["log"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dob": dob,
        "number": number,
        "address": address,
        "xray": List<dynamic>.from(xray.map((x) => x)),
        "xrayLabel": List<dynamic>.from(xrayLabel.map((x) => x)),
        "log": log.toJson(),
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
