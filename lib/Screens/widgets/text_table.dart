import 'package:flutter/material.dart';

class TextTable extends StatelessWidget {
  const TextTable({Key? key, required this.column, required this.row})
      : super(key: key);
  final List<String> column;
  final List<List<String>> row;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: true,
      ),
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
