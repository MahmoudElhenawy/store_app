// ملف مخصص لعرض SnackBar بشكل مخصص
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message,
      {Color backgroundColor = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
