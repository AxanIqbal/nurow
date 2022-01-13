import 'package:flutter/material.dart';

class XrayCategory {
  XrayCategory({
    required this.description,
    required this.image,
    this.table,
    this.extras,
    this.data,
  });

  String description;
  List<List<String>>? table;
  String image;
  List<Widget>? extras;
  Map? data;

  factory XrayCategory.fromJson(Map<String, dynamic> json) => XrayCategory(
        description: json["description"],
        table: json["table"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "table": table,
        "image": image,
      };
}
