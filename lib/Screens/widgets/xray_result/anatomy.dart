import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/text_table.dart';

class Anatomy extends StatelessWidget {
  const Anatomy({Key? key}) : super(key: key);

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
    return const TextTable(column: _column, row: _row);
  }
}
