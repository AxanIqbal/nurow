import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/text_table.dart';
import 'package:nurow/models/xray_category.dart';

class ToothIdentification extends StatelessWidget {
  const ToothIdentification({Key? key, this.label}) : super(key: key);

  final XrayCategory? label;

  @override
  Widget build(BuildContext context) {
    const _column = [
      "Tooth Number",
      "Full or Partial view",
      "Confidence",
    ];
    const _row = [
      [
        "UL4",
        "Partial",
        "60%",
      ],
      [
        "UL5",
        "Full",
        "100%",
      ],
      [
        "UL6",
        "Full",
        "100%",
      ],
      [
        "LL7",
        "Full",
        "100%",
      ],
      [
        "LL8",
        "Partial",
        "100%",
      ],
      [
        "LL4",
        "Partial",
        "70%",
      ],
      [
        "LL5",
        "Full",
        "100%",
      ],
      [
        "LL6",
        "Full",
        "100%",
      ],
      [
        "LL7",
        "Full",
        "100%",
      ],
      [
        "LL8",
        "Partial",
        "100%",
      ],
    ];
    return Expanded(
      child: TextTable(
        column: _column,
        row: label?.table ?? _row,
      ),
    );
  }
}
