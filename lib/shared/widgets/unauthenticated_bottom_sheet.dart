// import 'package:chhoto_khabar/l10n/app_localizations.dart';
// import 'package:flutter/material.dart';

// class UnauthenticatedBottomSheet extends StatelessWidget {
//   final String message;
//   final VoidCallback onSignInTap;
//   final VoidCallback? onSignUpTap;
//   final VoidCallback? onCancelTap;

//   const UnauthenticatedBottomSheet({
//     Key? key,
//     required this.message,
//     required this.onSignInTap,
//     this.onSignUpTap,
//     this.onCancelTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final l10n = AppLocalizations.of(context)!;

//     return Container(
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: theme.colorScheme.surface,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: theme.colorScheme.shadow.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Handle bar
//             Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.onSurface.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
            
//             const SizedBox(height: 24),

//             // Icon
//             Container(
//               width: 80,
//               height: 80,
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.primary.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 Icons.lock_outline,
//                 size: 40,
//                 color: theme.colorScheme.primary,
//               ),
//             ),

//             const SizedBox(height: 24),

//             // Title
//             Text(
//               l10n.signInRequired,
//               style: theme.textTheme.headlineSmall?.copyWith(
//                 fontWeight: FontWeight.bold,
//                 color: theme.colorScheme.onSurface,
//               ),
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 12),

//             // Message
//             Text(
//               message,
//               style: theme.textTheme.bodyLarge?.copyWith(
//                 color: theme.colorScheme.onSurface.withOpacity(0.7),
//               ),
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 32),

//             // Action buttons
//             Column(
//               children: [
//                 // Sign In button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: onSignInTap,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: theme.colorScheme.primary,
//                       foregroundColor: theme.colorScheme.onPrimary,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: Text(
//                       l10n.signIn,
//                       style: theme.textTheme.labelLarge?.copyWith(
//                         fontWeight: FontWeight.w600,
//                         color: theme.colorScheme.onPrimary,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 // Sign Up button (optional)
//                 if (onSignUpTap != null)
//                   SizedBox(
//                     width: double.infinity,
//                     child: OutlinedButton(
//                       onPressed: onSignUpTap,
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: theme.colorScheme.primary,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         side: BorderSide(
//                           color: theme.colorScheme.primary,
//                           width: 1.5,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: Text(
//                         l10n.signUp,
//                         style: theme.textTheme.labelLarge?.copyWith(
//                           fontWeight: FontWeight.w600,
//                           color: theme.colorScheme.primary,
//                         ),
//                       ),
//                     ),
//                   ),

//                 const SizedBox(height: 12),

//                 // Cancel button
//                 SizedBox(
//                   width: double.infinity,
//                   child: TextButton(
//                     onPressed: onCancelTap ?? () => Navigator.of(context).pop(),
//                     style: TextButton.styleFrom(
//                       foregroundColor: theme.colorScheme.onSurface.withOpacity(0.6),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                     ),
//                     child: Text(
//                       l10n.cancel,
//                       style: theme.textTheme.labelLarge?.copyWith(
//                         fontWeight: FontWeight.w500,
//                         color: theme.colorScheme.onSurface.withOpacity(0.6),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // Safe area bottom padding
//             SizedBox(height: MediaQuery.of(context).padding.bottom),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:chhoto_khabar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class UnauthenticatedBottomSheet extends StatelessWidget {
  final String message;
  final VoidCallback onSignInTap;
  final VoidCallback? onSignUpTap;
  final VoidCallback? onCancelTap;

  const UnauthenticatedBottomSheet({
    Key? key,
    required this.message,
    required this.onSignInTap,
    this.onSignUpTap,
    this.onCancelTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            
            const SizedBox(height: 24),

            // Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.lock_outline,
                size: 40,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 24),

            // Title
            Text(
              'Sign in required',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            // Message
            Text(
              message,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Action buttons
            Column(
              children: [
                // Sign In button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onSignInTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Sign In',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Sign Up button (optional)
                if (onSignUpTap != null)
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: onSignUpTap,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 12),

                // Cancel button
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: onCancelTap ?? () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.onSurface.withOpacity(0.6),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Cancel',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Safe area bottom padding
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
