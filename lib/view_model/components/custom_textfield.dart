import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({required this.labelAndHint,required this.customEditingController, super.key});

  final String labelAndHint;
  TextEditingController customEditingController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: customEditingController ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: labelAndHint,
        label: Text(
          labelAndHint,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue,),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
