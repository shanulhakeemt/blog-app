import 'package:flutter/material.dart';

class Navigate {
  static push({required BuildContext context, required Widget screen}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushReplace({required BuildContext context, required Widget screen}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushRemove({required BuildContext context, required Widget screen}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (route) => false,
    );
  }
}