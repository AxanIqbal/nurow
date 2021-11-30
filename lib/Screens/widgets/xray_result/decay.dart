import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/text_table.dart';

class Decay extends StatelessWidget {
  const Decay({Key? key}) : super(key: key);

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
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TextTable(column: _column, row: _row),
              SizedBox(
                height: 10,
              ),
              Text(
                "\u2022 Number of decayed teeth in image: 4",
              ),
              Text(
                " (Indicate higher decay risk)",
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "\u2022 Number of restored teeth in image: 5",
              ),
              Text(
                " (Indicate high historical caries rate)",
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "\u2022 % of decay identified within known hotspots:  87%",
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "\u2022 Overall confidence in caries diagnosis: 96%",
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
                "Reported high sugar intake, High frequency grazing.",
              ),
              Text(
                "Irregular interdental cleaning",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
