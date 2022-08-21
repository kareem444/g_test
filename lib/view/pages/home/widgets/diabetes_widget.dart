import 'package:flutter/material.dart';
import 'package:g_test/helper/http_helper.dart';
import 'package:g_test/util/text_style_util.dart';
import 'package:g_test/view/pages/home/widgets/table_home_widget.dart';
import 'package:g_test/view/widgets/spacer_widget.dart';

class DiabetesWidget extends StatelessWidget {
  const DiabetesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: FutureBuilder<dynamic>(
        future: HttpHelper.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Map<String, dynamic> snapshotData = snapshot.data['problems']
                [0]["Diabetes"][0]["medications"][0]["medicationsClasses"][0];
            return ListView.builder(
                itemCount: snapshotData.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> data =
                      snapshotData.values.elementAt(index)[0];

                  return Column(
                    children: [
                      Text(
                        snapshotData.keys.elementAt(index),
                        style: TextStyleUtil.head2(),
                      ),
                      const SpacerWidget(),
                      TableHomeWidget(
                        data: data,
                      ),
                      const SpacerWidget(
                        height: 20,
                      ),
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "something went wrong",
                style: TextStyleUtil.warning(),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
