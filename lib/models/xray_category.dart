import 'package:flutter/material.dart';

class XrayCategory {
  XrayCategory({
    required this.image,
    this.table,
    this.extras,
    this.data,
  });

  List<List<String>>? table;
  String image;
  List<Widget>? extras;
  Map? data;

  factory XrayCategory.fromJson(Map<String, dynamic> json) => XrayCategory(
        table: json["table"],
        image: json["image"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "table": table,
        "image": image,
        "data": data,
      };
}
