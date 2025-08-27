// // lib/src/features/profile/presentation/widgets/profile_header.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../../data/models/profile_model.dart';

// class ProfileHeader extends StatelessWidget {
//   final AppLocalizations l10n;
//   final ProfileModel? profile;
//   final bool isAuthenticated;
//   final VoidCallback onSignInTap;

//   const ProfileHeader({
//     Key? key,
//     required this.l10n,
//     this.profile,
//     required this.isAuthenticated,
//     required this.onSignInTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         children: [
//           // Profile avatar
//           CircleAvatar(
//             radius: 50,
//             backgroundColor: theme.colorScheme.primary,
//             child: Icon(
//               Icons.person,
//               size: 50,
//               color: theme.colorScheme.onPrimary,
//             ),
//           ),
//           const SizedBox(height: 16),

//           if (isAuthenticated) ...[
//             // Authenticated user content
//             // User name
//             Text(
//               profile != null
//                   ? '${profile!.firstName} ${profile!.lastName}'.trim()
//                   : 'Loading...',
//               style: theme.textTheme.headlineSmall?.copyWith(
//                 fontWeight: FontWeight.bold,
//                 color: theme.colorScheme.onSurface,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 8),

//             // Email
//             Text(
//               profile?.email ?? 'Loading...',
//               style: theme.textTheme.bodyLarge?.copyWith(
//                 color: theme.colorScheme.onSurface.withOpacity(0.7),
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),

//             // Bookmarks count card
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.primaryContainer,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.bookmark,
//                     size: 20,
//                     color: theme.colorScheme.onPrimaryContainer,
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     '${profile?.bookmarksCount ?? 0} ${l10n.myBookmarks}',
//                     style: theme.textTheme.labelLarge?.copyWith(
//                       color: theme.colorScheme.onPrimaryContainer,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ] else ...[
//             // Unauthenticated user content
//             // Welcome message
//             Text(
//               'Welcome to ${l10n.appName ?? 'Chhoto Khabar'}',
//               style: theme.textTheme.headlineSmall?.copyWith(
//                 fontWeight: FontWeight.bold,
//                 color: theme.colorScheme.onSurface,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 8),

//             // Sign in prompt
//             Text(
//               'Sign in to view your profile and access personalized features',
//               style: theme.textTheme.bodyLarge?.copyWith(
//                 color: theme.colorScheme.onSurface.withOpacity(0.7),
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),

//             // Sign In button
//             ElevatedButton.icon(
//               onPressed: onSignInTap,
//               icon: Icon(
//                 Icons.login,
//                 size: 20,
//                 color: theme.colorScheme.onPrimary,
//               ),
//               label: Text(
//                 l10n.signIn,
//                 style: theme.textTheme.labelLarge?.copyWith(
//                   color: theme.colorScheme.onPrimary,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: theme.colorScheme.primary,
//                 foregroundColor: theme.colorScheme.onPrimary,
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 elevation: 2,
//               ),
//             ),
//             const SizedBox(height: 8),

//             // Additional info for unauthenticated users
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(
//                   color: theme.colorScheme.outline.withOpacity(0.2),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.bookmark_outline,
//                         size: 18,
//                         color: theme.colorScheme.onSurfaceVariant,
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         'Save articles to bookmarks',
//                         style: theme.textTheme.bodySmall?.copyWith(
//                           color: theme.colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.category_outlined,
//                         size: 18,
//                         color: theme.colorScheme.onSurfaceVariant,
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         'Personalize your news feed',
//                         style: theme.textTheme.bodySmall?.copyWith(
//                           color: theme.colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }
// lib/src/features/profile/presentation/widgets/profile_header.dart
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String fullName;
  final String email;
  final int bookmarksCount;
  final bool isStaff;
  final bool isSuperuser;

  const ProfileHeader({
    Key? key,
    required this.fullName,
    required this.email,
    required this.bookmarksCount,
    required this.isStaff,
    required this.isSuperuser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: theme.colorScheme.primary,
              child: Text(
                _getInitials(fullName),
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // User Name
            Text(
              fullName,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 4),
            
            // Email
            Text(
              email,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            
            if (isStaff || isSuperuser) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  isSuperuser ? 'Super User' : 'Staff',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            
            const SizedBox(height: 16),
            
            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem(
                  context,
                  'Bookmarks',
                  bookmarksCount.toString(),
                  Icons.bookmark,
                ),
                _buildStatItem(
                  context,
                  'Account Type',
                  isSuperuser ? 'Admin' : isStaff ? 'Staff' : 'User',
                  Icons.person,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(
          icon,
          color: theme.colorScheme.primary,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return 'U';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }
}
