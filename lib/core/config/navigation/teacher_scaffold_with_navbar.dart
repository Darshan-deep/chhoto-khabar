// import 'package:chhoto_khabar/core/theme/app_color.dart';
// import 'package:chhoto_khabar/l10n/app_localizations_unified.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';

// class StudentScaffoldWithNavBar extends StatelessWidget {
//   const StudentScaffoldWithNavBar({
//     required this.studentNavigationShell,
//     Key? key,
//   }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

//   final StatefulNavigationShell studentNavigationShell;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: studentNavigationShell,
//       bottomNavigationBar: NavigationBar(
//         height: 70,
//         labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
//         backgroundColor: Colors.black,
//         elevation: 1,
//         selectedIndex: studentNavigationShell.currentIndex,
//         indicatorColor: Colors.transparent, // Disable default indicator
//         onDestinationSelected: (index) => _onTap(context, index),
//         destinations: List.generate(3, (index) { // Changed from 4 to 3
//           final bool isSelected = studentNavigationShell.currentIndex == index;
//           return NavigationDestination(
//             icon: Container(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//               decoration: isSelected
//                   ? BoxDecoration(
//                       color: Color(0xFF2D2D2D),
//                       borderRadius: BorderRadius.circular(20),
//                     )
//                   : null,
//               child: Icon(
//                 _getIconForIndex(index),
//                 color: isSelected
//                     ? Colors.white
//                     : Theme.of(context).colorScheme.outline,
//                 size: 24,
//               ),
//             ),
//             label: _getLabelForIndex(context, index),
//           );
//         }),
//       ),
//     );
//   }

//   IconData _getIconForIndex(int index) {
//     switch (index) {
//       case 0:
//         return Iconsax.home; // News Feed icon
//       case 1:
//         return Iconsax.trend_up; // Trending icon
//       case 2:
//         return Iconsax.personalcard; // Profile icon
//       default:
//         return Iconsax.home;
//     }
//   }

//   String _getLabelForIndex(BuildContext context, int index) {
//     final l10n = AppLocalizations.of(context)!;
//     switch (index) {
//       case 0:
//         return l10n.home;
//       case 1:
//         return l10n.trending;
//       case 2:
//         return l10n.profile;
//       default:
//         return '';
//     }
//   }

//   void _onTap(BuildContext context, int index) {
//     studentNavigationShell.goBranch(
//       index,
//       initialLocation: index == studentNavigationShell.currentIndex,
//     );
//   }
// }