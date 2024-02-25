import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.prefixIcon,
      required this.onTap,
      required this.labelAndHint,
      required this.customEditingController,
      required this.validator,
      super.key});

  void Function() onTap;
  String? Function(String?) validator;
  final String labelAndHint;
  TextEditingController customEditingController = TextEditingController();
  Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      validator: validator,
      controller: customEditingController,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: labelAndHint,
        label: Text(
          labelAndHint,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
