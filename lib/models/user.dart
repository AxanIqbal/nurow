import 'dart:convert';

import 'package:intl/intl.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

List<User> usersFromJson(List data) =>
    List<User>.from(data.map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.creationTime,
    required this.email,
    required this.lastLogOutTime,
    required this.lastSignInTime,
    required this.userName,
  });

  DateTime creationTime;
  String email;
  List<DateTime> lastLogOutTime;
  List<DateTime> lastSignInTime;
  String userName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        creationTime: json["dob"] is DateTime
            ? json["dob"]
            : DateFormat('EEE, dd MMM yyyy hh:mm:ss zzz')
                .parse(json["creationTime"]),
        email: json["email"],
        lastLogOutTime: List<DateTime>.from(json["lastLogOutTime"].map((x) =>
            x is DateTime
                ? x
                : DateFormat('EEE, dd MMM yyyy hh:mm:ss zzz').parse(x))),
        lastSignInTime: List<DateTime>.from(json["lastSignInTime"].map((x) =>
            x is DateTime
                ? x
                : DateFormat('EEE, dd MMM yyyy hh:mm:ss zzz').parse(x))),
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "creationTime":
            DateFormat('EEE, dd MMM yyyy hh:mm:ss').format(creationTime),
        "email": email,
        "lastLogOutTime": List<dynamic>.from(lastLogOutTime.map((x) =>
            DateFormat('EEE, dd MMM yyyy hh:mm:ss').format(x).toString())),
        "lastSignInTime": List<dynamic>.from(lastSignInTime.map((x) =>
            DateFormat('EEE, dd MMM yyyy hh:mm:ss').format(x).toString())),
        "userName": userName,
      };
}
