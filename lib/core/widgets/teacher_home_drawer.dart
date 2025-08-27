// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:chhoto_khabar/core/utils/snack_bars.dart';
// import 'package:chhoto_khabar/core/widgets/logout_dailog.dart';
// import 'package:chhoto_khabar/features/settings/presentation/bloc/account_bloc.dart';
// import 'package:chhoto_khabar/l10n/app_localizations.dart';
// import 'package:chhoto_khabar/shared/user/bloc/user_bloc.dart';

// class TeacherHomeDrawer extends StatelessWidget {
//   const TeacherHomeDrawer({super.key});

//   // void _logOutDialog(BuildContext context) async {
//   //   final shouldLogout = await showDialog<bool>(
//   //     context: context,
//   //     barrierDismissible: false,
//   //     builder: (context) => const LogoutDailog(),
//   //   );

//   //   if (shouldLogout ?? false) {
//   //     if (context.mounted) {
//   //       context.read<AccountBloc>().add(const AccountEvent.logout());
//   //     }
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;

//     return BlocListener<AccountBloc, AccountState>(
//       listener: (context, state) {
//         state.maybeWhen(
//           orElse: () => null,
//           success: (message) {
//             SnackBars.showSuccessSnackBar(message);
//             context.go('/login');
//           },
//           error: (message) {
//             SnackBars.showErrorSnackBar(message);
//           },
//         );
//       },
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topRight: Radius.circular(24),
//           bottomRight: Radius.circular(0),
//         ),
//         child: Drawer(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           child: SafeArea(
//             child: Column(
//               children: [
//                 _buildProfileSection(context),
//                 Expanded(
//                   child: ListView(
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     children: [
//                       const SizedBox(height: 8),

//                       // Main Navigation
//                       _buildNavigationSection(context, l10n),

//                       // Account & Support Section
//                       _buildAccountSection(context, l10n),

//                       const SizedBox(height: 24),

//                       // Sign Out Button
//                       // Padding(
//                       //   padding: const EdgeInsets.symmetric(horizontal: 24),
//                       //   child: OutlinedButton.icon(
//                       //     onPressed: () {
//                       //       _logOutDialog(context);
//                       //     },
//                       //     icon: Icon(
//                       //       Icons.logout_rounded,
//                       //       size: 18,
//                       //       color: Colors.red.shade700,
//                       //     ),
//                       //     label: Text(
//                       //       "Logout",
//                       //       style: GoogleFonts.poppins(
//                       //         fontWeight: FontWeight.w500,
//                       //       ),
//                       //     ),
//                       //     style: OutlinedButton.styleFrom(
//                       //       foregroundColor: Colors.red.shade700,
//                       //       padding: const EdgeInsets.symmetric(vertical: 12),
//                       //       side: BorderSide(color: Colors.red.shade200),
//                       //     ),
//                       //   ),
//                       // ),

//                       const SizedBox(height: 16),

//                       // Version info
//                       Center(
//                         child: Text(
//                           "v1.0.0",
//                           style: GoogleFonts.poppins(
//                             fontSize: 12,
//                             color: Colors.grey.shade500,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileSection(BuildContext context) {
//     // Force trigger user data loading when profile section builds
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final currentState = context.read<UserBloc>().state;
//       currentState.maybeWhen(
//         initial: () {
//           debugPrint('🧑 Loading user data from initial state');
//           context.read<UserBloc>().add(const UserEvent.getUserInfo());
//         },
//         loaded: (_) {
//           debugPrint('👤 User data already loaded');
//         },
//         error: (message) {
//           debugPrint('⚠️ Previous user data error: $message, retrying...');
//           context.read<UserBloc>().add(const UserEvent.getUserInfo());
//         },
//         orElse: () {
//           debugPrint('🔄 Ensuring user data is loaded');
//           context.read<UserBloc>().add(const UserEvent.getUserInfo());
//         },
//       );
//     });

//     return BlocBuilder<UserBloc, UserState>(
//       builder: (context, state) {
//         return state.maybeWhen(
//           initial: () => _buildProfileSkeleton(context),
//           loading: () => _buildProfileSkeleton(context),
//           error: (message) => _buildProfileError(context, message),
//           loaded: (user) => _buildProfileContent(context, user),
//           orElse: () => _buildProfileSkeleton(context),
//         );
//       },
//     );
//   }

//   Widget _buildProfileSkeleton(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(16),
//           bottomRight: Radius.circular(16),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade100,
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.grey.shade200,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 18,
//                   width: 120,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                     color: Colors.grey.shade200,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Container(
//                   height: 14,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                     color: Colors.grey.shade200,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProfileError(BuildContext context, String message) {
//     return GestureDetector(
//       onTap: () {
//         context.read<UserBloc>().add(const UserEvent.getUserInfo());
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.only(
//             bottomLeft: Radius.circular(16),
//             bottomRight: Radius.circular(16),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade100,
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.red.shade50,
//               ),
//               child: Icon(Icons.refresh, color: Colors.red.shade400),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Failed to load profile",
//                     style: GoogleFonts.poppins(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     "Tap to retry",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.red.shade400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileContent(BuildContext context, user) {
//     return GestureDetector(
//       onTap: () => context.go('/teacher-profile'),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.only(
//             bottomLeft: Radius.circular(16),
//             bottomRight: Radius.circular(16),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade100,
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Hero(
//               tag: 'profile-image',
//               child: Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withValues(alpha: 0.1),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                   image: DecorationImage(
//                     image: user?.profileImage != null
//                         ? NetworkImage(user.profileImage)
//                         : const AssetImage("assets/images/patient/sa.png")
//                             as ImageProvider,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     user?.name ?? "Not Specified",
//                     style: GoogleFonts.poppins(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     user?.email ?? "Not Specified",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNavigationSection(BuildContext context, AppLocalizations l10n) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 24, top: 0, bottom: 8),
//           child: Text(
//             "Navigation",
//             style: GoogleFonts.poppins(
//               fontSize: 12,
//               color: Colors.grey.shade600,
//               fontWeight: FontWeight.w500,
//               letterSpacing: 0.5,
//             ),
//           ),
//         ),
//         _buildMenuItem(
//           context: context,
//           icon: Iconsax.home,
//           title: l10n.home,
//           onTap: () {
//             context.go('/home');
//             Scaffold.of(context).closeDrawer();
//           },
//         ),
//         _buildMenuItem(
//           context: context,
//           icon: Iconsax.calendar,
//           title: 'Calendar',
//           onTap: () => context.go('/student-calendar'),
//         ),
//         _buildMenuItem(
//           context: context,
//           icon: Iconsax.people,
//           title: "Attendance",
//           onTap: () => context.push('/attendance'),
//         ),
//         _buildMenuItem(
//           context: context,
//           icon: Iconsax.personalcard,
//           title: "Profile",
//           onTap: () => context.push("/teacher-profile"),
//         ),
//         _buildMenuItem(
//           context: context,
//           icon: Iconsax.calendar_edit,
//           title: "Leave Request",
//           onTap: () => context.push("/leave-page"),
//         ),
//       ],
//     );
//   }

//   Widget _buildAccountSection(BuildContext context, AppLocalizations l10n) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
//           child: Text(
//             l10n.accountAndSupport,
//             style: GoogleFonts.poppins(
//               fontSize: 12,
//               color: Colors.grey.shade600,
//               fontWeight: FontWeight.w500,
//               letterSpacing: 0.5,
//             ),
//           ),
//         ),
//         _buildMenuItem(
//           context: context,
//           icon: Iconsax.setting,
//           title: l10n.settings,
//           onTap: () => context.push('/settings'),
//         ),
//         _buildMenuItem(
//           context: context,
//           icon: Iconsax.info_circle,
//           title: "Help & Support",
//           onTap: () => context.push('/help-and-support'),
//         ),
//       ],
//     );
//   }

//   Widget _buildMenuItem({
//     required BuildContext context,
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(12),
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 36,
//                 height: 36,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade100,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 alignment: Alignment.center,
//                 child: Icon(
//                   icon,
//                   size: 18,
//                   color: Colors.grey.shade700,
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey.shade800,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
