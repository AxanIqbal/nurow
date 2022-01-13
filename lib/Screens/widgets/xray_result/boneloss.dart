import 'package:flutter/material.dart';
import 'package:nurow/models/xray_category.dart';

class BoneLoss extends StatelessWidget {
  const BoneLoss({Key? key, this.boneloss}) : super(key: key);

  final XrayCategory? boneloss;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (boneloss?.data?['Diagnosis'] != null)
            Text(boneloss?.data!['Diagnosis'])
          else
            const Text("Diagnosis: Generalised mild horizontal boneloss "),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Data",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (boneloss?.data?['Data'] != null)
            Text(boneloss?.data!['Data'])
          else ...[
            const Text(
              "\u2022 CEJ reference point identified: 8 teeth",
            ),
            const Text(
              " (Reference point for original bone level)",
            ),
            const Text(
              "\u2022 Impediments to original bone level projection: 0",
            ),
            const Text(
              " (Indicate higher confidence in tracing)",
            ),
            const Text(
              "\u2022 Impediments to current bone level tracing:  crowding/over-lapping structures",
            ),
            const Text(
              " (Adjusted confidence in the projection)",
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "\u2022 % of current bone tracing within 2mm of CEJ : 47%",
            ),
            const Text(
              "\u2022 Overall Confidence in findings: 98%",
            ),
          ],
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Adjunctive clinical data from historical patient records",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (boneloss?.data?['Adjunctive'] != null)
            Text(boneloss?.data!['Adjunctive'])
          else ...[
            const Text(
              "Irregular interdental cleaning",
            ),
            const Text(
              "Diabetic",
            ),
            const Text(
              "Smokes 10/day",
            ),
          ],
        ],
      ),
    );
  }
}
