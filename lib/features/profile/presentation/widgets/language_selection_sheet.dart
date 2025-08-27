// // lib/src/presentation/_widget/Profile_page_widgets/language_selection_sheet.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import '../../../../shared/language/presentation/language_bloc/language_bloc.dart';
// import '../../../../l10n/l10n.dart';
// import 'language_option.dart';

// class LanguageSelectionSheet extends StatelessWidget {
//   const LanguageSelectionSheet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final l10n = AppLocalizations.of(context)!;

//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: theme.colorScheme.surface,
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Handle bar
//           Center(
//             child: Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.onSurface.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Title
//           Text(
//             l10n.selectLanguage,
//             style: theme.textTheme.headlineSmall?.copyWith(
//               fontWeight: FontWeight.bold,
//               color: theme.colorScheme.onSurface,
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Language options
//           BlocBuilder<LanguageBloc, LanguageState>(
//             builder: (context, state) {
//               return Column(
//                 children: [
//                   // English option
//                   LanguageOption(
//                     displayName: l10n.english,
//                     subtitle: 'English',
//                     flag: L10n.getFlag('en'),
//                     isSelected: state.selectedLanguage.languageCode == 'en',
//                     onTap: () {
//                       context.read<LanguageBloc>().add(
//                         LanguageChanged(const Locale('en')),
//                       );
//                       Navigator.pop(context);
//                     },
//                   ),
//                   const SizedBox(height: 12),

//                   // Nepali option
//                   LanguageOption(
//                     displayName: l10n.nepali,
//                     subtitle: 'नेपाली',
//                     flag: L10n.getFlag('ne'),
//                     isSelected: state.selectedLanguage.languageCode == 'ne',
//                     onTap: () {
//                       context.read<LanguageBloc>().add(
//                         LanguageChanged(const Locale('ne')),
//                       );
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               );
//             },
//           ),

//           const SizedBox(height: 20),
          
//           // Safe area padding
//           SizedBox(height: MediaQuery.of(context).padding.bottom),
//         ],
//       ),
//     );
//   }
// }
