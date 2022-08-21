import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpacerWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const SpacerWidget({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / (height ?? 90),
      width: Get.width / (width ?? 90),
    );
  }
}
