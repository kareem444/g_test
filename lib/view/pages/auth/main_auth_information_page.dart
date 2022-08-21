import 'package:flutter/material.dart';
import 'package:g_test/service/auth_service.dart';
import 'package:g_test/service/form_service.dart';
import 'package:g_test/view/pages/auth/widgets/auth_page_widget.dart';
import 'package:g_test/view/widgets/create_page_widget.dart';

class MainAuthInformationPage extends StatelessWidget {
  const MainAuthInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();

    return CreatePageWidget(
      page: AuthPageWidget(
        controller: userNameController,
        title: "User Information",
        description:
            "Make The UserName In English And Not Contain Special Characters.",
        hintText: "User Name",
        validator: (value) => FormService.userNameFieldValidation(value),
        icon: Icons.person,
        onPress: () =>
            AuthService.addUserToFireStore(context, userNameController.text),
      ),
    );
  }
}
