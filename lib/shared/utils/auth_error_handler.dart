import 'package:flutter/material.dart';
import 'package:chhoto_khabar/shared/widgets/auth_required_dialog.dart';

extension AuthErrorHandler on Widget {
  static void handleAuthError(BuildContext context, Object error, String action) {
    // Check if it's a 401 authentication error
    if (error.toString().contains('401') || 
        error.toString().toLowerCase().contains('authentication required') ||
        error.toString().toLowerCase().contains('unauthorized')) {
      
      AuthRequiredDialog.show(
        context,
        action: action,
        message: 'Please login to $action',
      );
    }
  }
}

class AuthErrorHelper {
  static void showAuthDialog(BuildContext context, String action, {String? message}) {
    AuthRequiredDialog.show(
      context,
      action: action,
      message: message,
    );
  }
  
  static bool isAuthError(dynamic error) {
    if (error == null) return false;
    
    final errorString = error.toString().toLowerCase();
    return errorString.contains('401') || 
           errorString.contains('authentication required') ||
           errorString.contains('unauthorized') ||
           errorString.contains('please login');
  }
}
