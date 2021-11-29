import 'package:flutter/material.dart';

class BoneLoss extends StatelessWidget {
  const BoneLoss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Diagnosis: Generalised mild horizontal boneloss "),
          SizedBox(
            height: 10,
          ),
          Text(
            "\u2022 CEJ reference point identified: 8 teeth",
          ),
          Text(
            " (Reference point for original bone level)",
          ),
          Text(
            "\u2022 Impediments to original bone level projection: 0",
          ),
          Text(
            " (Indicate higher confidence in tracing)",
          ),
          Text(
            "\u2022 Impediments to current bone level tracing:  crowding/over-lapping structures",
          ),
          Text(
            " (Adjusted confidence in the projection)",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "\u2022 % of current bone tracing within 2mm of CEJ : 47%",
          ),
          Text(
            "\u2022 Overall Confidence in findings: 98%",
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Adjunctive clinical data from patient notes",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            "Irregular interdental cleaning",
          ),
          Text(
            "Diabetic",
          ),
          Text(
            "Smokes 10/day",
          ),
        ],
      ),
    );
  }
}
