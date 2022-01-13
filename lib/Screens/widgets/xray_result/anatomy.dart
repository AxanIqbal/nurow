import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/text_table.dart';
import 'package:nurow/models/xray_category.dart';

class Anatomy extends StatelessWidget {
  const Anatomy({Key? key, this.anatomy}) : super(key: key);

  final XrayCategory? anatomy;

  @override
  Widget build(BuildContext context) {
    const _column = [
      "Tooth Number",
      "Natural structures identified",
      "Observations",
    ];
    const _row = [
      [
        "UL5",
        "E,D,P,CEJ",
        "Nil",
      ],
      [
        "UL6",
        "E,D,CEJ",
        "fractured",
      ],
      [
        "UL7",
        "E,D,P,CEJ",
        "Nil",
      ]
    ];
    return TextTable(
      column: _column,
      row: anatomy?.table ?? _row,
    );
  }
}
