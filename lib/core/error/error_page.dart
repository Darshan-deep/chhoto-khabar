import 'package:chhoto_khabar/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final String? returnRoute;
  final VoidCallback? onButtonPressed;
  final String? imagePath;
  final bool showHomeButton;

  const ErrorPage({
    super.key,
    this.title = 'Page Not Found',
    this.message = 'The page you are looking for doesn\'t exist or some parameters are missing.',
    this.buttonText = 'Go Back',
    this.returnRoute,
    this.onButtonPressed,
    this.imagePath,
    this.showHomeButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imagePath != null
                  ? Image.asset(
                      imagePath!,
                      height: 180,
                    )
                  : Icon(
                      Icons.error_outline_rounded,
                      size: 120,
                      color: Theme.of(context).colorScheme.error,
                    ),
              const SizedBox(height: 24),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onButtonPressed ??
                      () {
                        if (returnRoute != null) {
                          context.replaceNamed(returnRoute!); 
                        } else {
                          context.pop();
                        }
                      },
                  child: Text(buttonText),
                ),
              ),
              if (showHomeButton) ...[
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      context.replaceNamed('/patient-home');
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Go to Home"),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
