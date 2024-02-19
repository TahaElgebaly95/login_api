import 'package:flutter/material.dart';

class Navigation {
  static void push(context, Widget screenName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screenName,
        ));
  }

  static void pushAndRemove(context, Widget screenName) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => screenName,
        ),
        (route) => false);
  }

  static void pop(context) {
    Navigator.pop(context);
  }
}
