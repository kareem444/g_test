import 'package:flutter/material.dart';
import 'package:g_test/view/widgets/spacer_widget.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final Color? borderColor;
  final double? buttonWidth;
  final double? buttonBadding;
  final double? borderRadius;
  final Color? buttonColor;
  final Function() onPress;
  final bool? transparent;
  final bool textBold;
  final IconData? icon;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.textSize,
    this.textColor,
    this.borderColor,
    this.buttonWidth,
    this.buttonBadding,
    this.borderRadius,
    this.buttonColor,
    required this.onPress,
    this.transparent,
    this.textBold = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(buttonBadding ?? 8),
        margin: const EdgeInsets.all(8),
        width: Get.width / (buttonWidth ?? 3),
        decoration: BoxDecoration(
          boxShadow: [
            if (transparent == null)
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
          ],
          color: transparent == null
              ? buttonColor ??
                  (context.isDarkMode ? Colors.teal[600] : Colors.blue)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 100),
          border: transparent != null
              ? Border.all(
                  color: borderColor ??
                      (context.isDarkMode
                          ? Colors.teal[700]!
                          : Colors.blueGrey[600]!),
                  width: 2)
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...{
                Icon(
                  icon,
                  color: textColor,
                  size: 30,
                ),
                const SpacerWidget(
                  width: 4,
                ),
              },
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white70,
                  fontSize: textSize ?? 20,
                  fontWeight: textBold ? FontWeight.bold : FontWeight.normal,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
