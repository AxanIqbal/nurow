import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/text_table.dart';
import 'package:nurow/models/xray_category.dart';

class Decay extends StatelessWidget {
  const Decay({Key? key, this.decay}) : super(key: key);

  final XrayCategory? decay;

  @override
  Widget build(BuildContext context) {
    const _row = [
      ['LL6', 'Proximal', 'Crowding, Poor margin', '95%'],
      ['LL7', 'Proximal', 'Poor contact point', '99%'],
      ['LL4', 'Occlusal', 'Nil', '99%'],
      ['LL6', 'Recurrent', 'Nil', '97%'],
    ];
    const _column = [
      'Total Number',
      'Position of Tooth',
      'Impediments',
      'Confidence %'
    ];
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 16,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
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
                if (decay?.data?['Data'] != null)
                  Text(decay?.data!['Data'])
                else ...[
                  const Text(
                    "\u2022 Number of decayed teeth in image: 4",
                  ),
                  const Text(
                    " (Indicate higher decay risk)",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "\u2022 Number of restored teeth in image: 5",
                  ),
                  const Text(
                    " (Indicate high historical caries rate)",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "\u2022 % of decay identified within known hotspots:  87%",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "\u2022 Overall confidence in caries diagnosis: 96%",
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
                if (decay?.data?['Adjunctive'] != null)
                  Text(decay?.data!['Adjunctive'])
                else ...[
                  const Text(
                    "Reported high sugar intake, High frequency grazing.",
                  ),
                  const Text(
                    "Irregular interdental cleaning",
                  ),
                ],
                TextTable(
                  column: decay?.table != null
                      ? [
                          'Tooth Number',
                          'Position on Tooth',
                          'Advancement Level',
                          'Indicators',
                          'Uncertainties',
                          'Confidence %'
                        ]
                      : _column,
                  row: decay?.table ?? _row,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
