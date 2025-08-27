import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackBars {
  static void showWarningSnackBar(String message) {
    if (message.isEmpty) return;

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: const Color(0xFFFD7E14).withOpacity(0.9),
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void showErrorSnackBar(String message) {
    if (message.isEmpty) return;

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: const Color(0xFFDC3545),
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void showSuccessSnackBar(String message) {
    if (message.isEmpty) return;

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: const Color(0xFF28A745).withOpacity(0.9),
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void showInfoSnackBar(String message) {
    if (message.isEmpty) return;

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: const Color(0xFF007BFF).withOpacity(0.9),
      textColor: Colors.white,
      fontSize: 14.0,
      

    );
  }

  // Convenience methods
  static void success(String message) {
    showSuccessSnackBar(message);
  }

  static void error(String message) {
    showErrorSnackBar(message);
  }

  static void warning(String message) {
    showWarningSnackBar(message);
  }

  static void info(String message) {
    showInfoSnackBar(message);
  }

  // Custom toast method
  static void showCustomToast({
    required String message,
    required Color backgroundColor,
    Color textColor = Colors.white,
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.BOTTOM,
    int timeInSecForIosWeb = 3,
  }) {
    if (message.isEmpty) return;

    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 14.0,
    );
  }
}