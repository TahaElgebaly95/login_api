import 'package:flutter/material.dart';
import 'package:login_api/utils/font_style.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.buttonName, this.onPressed, super.key});

  final String buttonName;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(textStyle: AppFontStyle.normalTextStyle),
      onPressed: onPressed,
      child: Text(buttonName),
    );
  }
}
