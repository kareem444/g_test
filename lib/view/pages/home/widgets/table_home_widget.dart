import 'package:flutter/material.dart';

class TableHomeWidget extends StatelessWidget {
  const TableHomeWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text('Class'),
          ),
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(
            label: Text('Does'),
          ),
          DataColumn(
            label: Text('strength'),
          ),
        ],
        rows: <DataRow>[
          for (int i = 0; i < data.length; i++)
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text(data.keys.elementAt(i)),
                ),
                DataCell(
                  Text(data.values.elementAt(i)[0]['name']),
                ),
                DataCell(
                  Text(data.values.elementAt(i)[0]['dose']),
                ),
                DataCell(
                  Text(data.values.elementAt(i)[0]['strength']),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
