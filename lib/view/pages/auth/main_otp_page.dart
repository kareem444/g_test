import 'package:flutter/material.dart';
import 'package:g_test/service/auth_service.dart';
import 'package:g_test/view/pages/auth/widgets/auth_page_widget.dart';
import 'package:g_test/view/widgets/create_page_widget.dart';
import 'package:get/get.dart';

class MainOtpPage extends StatelessWidget {
  const MainOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    final String verificationId = Get.arguments[0];

    return CreatePageWidget(
      page: AuthPageWidget(
        controller: otpController,
        title: "Verify Phone Number",
        description:
            "The number we sent you is your verify code.\nPlease enter it below to verify your phone number.",
        hintText: "******",
        isOtp: true,
        onPress: () => AuthService.checkOtpVerfication(
          context,
          verificationId,
          otpController.text,
        ),
      ),
    );
  }
}
