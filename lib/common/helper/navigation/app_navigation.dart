import 'package:flutter/material.dart';

class AppNavigation {
  static void pushReplacement({
    required BuildContext context,
    required Widget widget,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=> widget),
    );
  }

  static void pushRemove({
    required BuildContext context,
    required Widget widget,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=> widget),
      (route)=> false,
    );
  }
  
  static void push({
    required BuildContext context,
    required Widget widget,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> widget),
    );
  }
}
