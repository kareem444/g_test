import 'package:flutter/material.dart';
import 'package:g_test/controller/auth_provider.dart';
import 'package:g_test/util/text_style_util.dart';
import 'package:g_test/view/pages/home/service/home_page_service.dart';
import 'package:g_test/view/pages/home/widgets/app_bar_widget.dart';
import 'package:g_test/view/pages/home/widgets/diabetes_widget.dart';
import 'package:g_test/view/widgets/create_page_widget.dart';
import 'package:g_test/view/widgets/divider_widget.dart';
import 'package:g_test/view/widgets/spacer_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return CreatePageWidget(
      appBar: const HomeAppBarWidget(),
      page: Flex(
        direction: isLandScape ? Axis.horizontal : Axis.vertical,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Good ${HomePageService.greeting()}!',
                  style: TextStyleUtil.bigHead(),
                ),
                const SpacerWidget(
                  height: 30,
                ),
                Text(
                  context.watch<AuthProvider>().auth?.userName ?? "",
                  style: TextStyleUtil.head2(),
                ),
              ],
            ),
          ),
          const SpacerWidget(),
          DividerWidget(
            height: !isLandScape ? Get.height : 1,
            width: !isLandScape ? 1 : Get.width,
            color: Colors.black38,
          ),
          const SpacerWidget(height: 20),
          const DiabetesWidget(),
        ],
      ),
    );
  }
}
