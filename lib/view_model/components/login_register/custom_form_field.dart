import 'package:flutter/material.dart';

class CustomFormFieldTask extends StatelessWidget {
  CustomFormFieldTask(
      {required this.validator,
      required this.onTap,
      required this.controller,
      super.key,
      required this.labelAndHint});

  void Function() onTap;
  final TextEditingController controller;
  String? Function(String?) validator;
  final String labelAndHint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {},
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelAndHint),
        hintText: labelAndHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.amber),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
