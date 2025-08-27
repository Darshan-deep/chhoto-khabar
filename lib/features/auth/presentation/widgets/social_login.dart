import 'package:chhoto_khabar/features/auth/presentation/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:chhoto_khabar/l10n/app_localizations_unified.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        // Social Login Buttons
        BuildSocialButton(
          imagePath: "assets/icons/google.png",
          text: 'SingIn with Google',
          onPressed: () {},
        ),
        SizedBox(height: 12),
        BuildSocialButton(
          imagePath: "assets/icons/apple.png",
          text: 'SingIn with Apple',
          onPressed: () {},
        ),
      ],
    );
  }
}
