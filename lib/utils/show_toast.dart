import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(var msg) {
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16,
      backgroundColor: Colors.purple,
      timeInSecForIosWeb: 2);
}
