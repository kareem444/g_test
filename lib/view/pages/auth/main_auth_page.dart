import 'package:flutter/material.dart';
import 'package:g_test/service/auth_service.dart';
import 'package:g_test/service/form_service.dart';
import 'package:g_test/view/pages/auth/widgets/auth_page_widget.dart';
import 'package:g_test/view/widgets/create_page_widget.dart';

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return CreatePageWidget(
      page: AuthPageWidget(
        controller: phoneController,
        title: "Login",
        description: "Please enter your phone number.",
        keyboardType: TextInputType.phone,
        hintText: "Phone Number",
        validator: (value) => FormService.phoneFieldValidation(value),
        icon: Icons.phone_android_rounded,
        onPress: () => AuthService.handleSignIn(context, phoneController.text),
      ),
    );
  }
}
