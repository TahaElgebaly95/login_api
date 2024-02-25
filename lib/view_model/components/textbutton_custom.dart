import 'package:flutter/material.dart';
import '../../utils/font_style.dart';


class CustomButton extends StatelessWidget {
  CustomButton({required this.buttonName, this.onPressed, super.key});

  final String buttonName;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(textStyle: AppFontStyle.normalTextStyle),
      onPressed: onPressed,
      child: Text(buttonName,style: AppFontStyle.titleStyle,),
    );
  }
}
