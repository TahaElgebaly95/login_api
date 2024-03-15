import 'package:flutter/material.dart';


class PushButton extends StatelessWidget {
  PushButton({required this.nameOfButton, this.onPressed, super.key});

  final Widget nameOfButton;

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            padding: const EdgeInsets.symmetric(horizontal: 50)),
        child: nameOfButton,
      ),
    );
  }
}
