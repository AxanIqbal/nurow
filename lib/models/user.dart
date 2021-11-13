import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

List<User> usersFromJson(List<Map<String, dynamic>> data) =>
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

  String creationTime;
  String email;
  List<String> lastLogOutTime;
  List<String> lastSignInTime;
  String userName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        creationTime: json["creationTime"],
        email: json["email"],
        lastLogOutTime: List<String>.from(json["lastLogOutTime"].map((x) => x)),
        lastSignInTime: List<String>.from(json["lastSignInTime"].map((x) => x)),
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "creationTime": creationTime,
        "email": email,
        "lastLogOutTime": List<dynamic>.from(lastLogOutTime.map((x) => x)),
        "lastSignInTime": List<dynamic>.from(lastSignInTime.map((x) => x)),
        "userName": userName,
      };
}
