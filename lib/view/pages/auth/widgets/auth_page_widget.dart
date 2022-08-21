import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:g_test/util/text_style_util.dart';
import 'package:g_test/view/widgets/button_widget.dart';
import 'package:g_test/view/widgets/spacer_widget.dart';

class AuthPageWidget extends StatelessWidget {
  const AuthPageWidget({
    Key? key,
    required this.controller,
    required this.title,
    required this.description,
    required this.hintText,
    this.icon,
    this.validator,
    required this.onPress,
    this.isOtp = false,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final String description;
  final String hintText;
  final IconData? icon;
  final String? Function(String?)? validator;
  final Function() onPress;
  final bool isOtp;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyleUtil.head1(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Text(
                    description,
                    style: TextStyleUtil.description(),
                    textAlign: TextAlign.center,
                  ),
                  const SpacerWidget(
                    height: 15,
                  ),
                  if (isOtp)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PinFieldAutoFill(
                        controller: controller,
                        decoration: UnderlineDecoration(
                          colorBuilder:
                              FixedColorBuilder(Colors.black.withOpacity(0.3)),
                          hintText: hintText,
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller,
                        validator: validator,
                        keyboardType: keyboardType,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: hintText,
                            suffixIcon: Icon(icon),
                            contentPadding: const EdgeInsets.all(20)),
                      ),
                    ),
                  const SpacerWidget(
                    height: 20,
                  ),
                  ButtonWidget(
                      text: "Continue",
                      buttonBadding: 10,
                      buttonWidth: 1,
                      buttonColor: Colors.amber[900],
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          onPress();
                        }
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
