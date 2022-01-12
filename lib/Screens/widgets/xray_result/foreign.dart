import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/text_table.dart';
import 'package:nurow/Screens/widgets/xray_result_charting.dart';

class Foreign extends StatelessWidget {
  const Foreign({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    const _column = [
      "Tooth Number",
      "Foreign structures Identified",
      "Position",
      "Observations"
    ];
    const _row = [
      ["UL5", "Restoration", "MOD", "Overhang"],
      ["UL6", "Restoration,", "MOD", "Nil"],
      ["UL7", "Restoration", "MO", "Marginal discrepancy"],
      ["LL5", "Restoration, RCT", "DO", "Marginal discrepancy"],
      ["LL7", "Restoration", "MO", "Overhang"]
    ];
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 16,
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Text(
                "Charting",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              XRayResultCharting(
                image: image,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Agree"),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Edit"),
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  ),
                  const SizedBox(),
                ],
              ),
              const TextTable(
                column: _column,
                row: _row,
              )
            ],
          ),
        ),
      ),
    );
  }
}
