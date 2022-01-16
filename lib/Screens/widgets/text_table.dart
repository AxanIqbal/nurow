import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextTable extends StatelessWidget {
  const TextTable({Key? key, required this.column, required this.row})
      : super(key: key);
  final List<String> column;
  final List<List<String>> row;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columnSpacing: 36.0,
            columns: List<DataColumn>.generate(
              column.length,
              (index) => DataColumn(
                label: Text(
                  column[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            rows: List<DataRow>.generate(
              row.length,
              (index) => DataRow(
                cells: List<DataCell>.generate(
                  row[index].length,
                  (index1) => DataCell(
                    Text(
                      row[index][index1],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
