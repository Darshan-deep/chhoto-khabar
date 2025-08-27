// // screens/categories/categories_screen.dart
// import 'package:auto_route/annotations.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:chhoto_khabar/src/features/profile/presentation/blocs/category_bloc/category_event.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:get_it/get_it.dart';
// import '../../../../config/router/app_router.dart';
// import '../../../../core/locale/language_helper.dart';
// import '../../../../shared/data/local/category_storage_service.dart';
// import '../../data/models/category_model.dart';
// import '../blocs/category_bloc/category_bloc.dart';
// import '../blocs/category_bloc/category_state.dart';

// @RoutePage()
// class ChooseCategoriesScreen extends StatefulWidget {
//   const ChooseCategoriesScreen({super.key});

//   @override
//   State<ChooseCategoriesScreen> createState() => _ChooseCategoriesScreenState();
// }

// class _ChooseCategoriesScreenState extends State<ChooseCategoriesScreen> {
//   final Set<String> _selectedCategories = {};
//   late final CategoryBloc _categoryBloc;
//   late final LanguageHelper _languageHelper;

//   @override
//   void initState() {
//     super.initState();
//     _categoryBloc = GetIt.instance<CategoryBloc>();
//     _languageHelper = GetIt.instance<LanguageHelper>();

//     // Fetch categories when screen initializes
//     _fetchCategories();

//     // Listen to language changes and refetch categories
//     _languageHelper.languageNotifier.addListener(_onLanguageChanged);
//   }

//   @override
//   void dispose() {
//     _languageHelper.languageNotifier.removeListener(_onLanguageChanged);
//     super.dispose();
//   }

//   void _fetchCategories() {
//     _categoryBloc.add(FetchCategories(
//       language: _languageHelper.currentLanguage,
//     ));
//   }

//   void _onLanguageChanged() {
//     _fetchCategories();
//   }

//   // Fallback categories for offline or error states
//   List<Map<String, String>> _getFallbackCategories(AppLocalizations l10n) {
//     return [
//       {'key': 'business', 'name': l10n.business},
//       {'key': 'technology', 'name': l10n.technology},
//       {'key': 'science', 'name': l10n.science},
//       {'key': 'health', 'name': l10n.health},
//       {'key': 'entertainment', 'name': l10n.entertainment},
//       {'key': 'sports', 'name': l10n.sports},
//       {'key': 'politics', 'name': l10n.politics},
//       {'key': 'world', 'name': l10n.world},
//       {'key': 'environment', 'name': l10n.environment},
//       {'key': 'education', 'name': l10n.education},
//       {'key': 'food', 'name': l10n.food},
//       {'key': 'travel', 'name': l10n.travel},
//     ];
//   }

//   Widget _buildCategoryChip({
//     required String id,
//     required String name,
//     required String colorCode,
//     required ThemeData theme,
//     required double chipSpacing,
//   }) {
//     final isSelected = _selectedCategories.contains(id);

//     // Parse color from hex string
//     Color categoryColor = theme.colorScheme.primary;
//     try {
//       categoryColor = Color(int.parse(colorCode.replaceAll('#', ''), radix: 16) + 0xFF000000);
//     } catch (e) {
//       // Use default color if parsing fails
//     }

//     return FilterChip(
//       label: Text(name),
//       selected: isSelected,
//       onSelected: (selected) {
//         setState(() {
//           if (selected) {
//             _selectedCategories.add(id);
//           } else {
//             _selectedCategories.remove(id);
//           }
//         });
//       },
//       avatar: isSelected
//           ? Icon(
//         Icons.check,
//         size: 18,
//         color: theme.colorScheme.onPrimary,
//       )
//           : null,
//       labelStyle: TextStyle(
//         color: isSelected
//             ? theme.colorScheme.onPrimary
//             : theme.colorScheme.onSurfaceVariant,
//         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//       ),
//       backgroundColor: isSelected
//           ? categoryColor
//           : theme.colorScheme.surfaceVariant.withOpacity(0.5),
//       selectedColor: categoryColor,
//       checkmarkColor: theme.colorScheme.onPrimary,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//         side: BorderSide(
//           color: isSelected ? categoryColor : theme.colorScheme.outline,
//           width: isSelected ? 1.5 : 1.0,
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoriesContent({
//     required List<CategoryModel> categories,
//     required AppLocalizations l10n,
//     required ThemeData theme,
//     required double chipSpacing,
//   }) {
//     if (categories.isEmpty) {
//       // Show fallback categories if API returns empty
//       final fallbackCategories = _getFallbackCategories(l10n);
//       return Wrap(
//         spacing: chipSpacing,
//         runSpacing: chipSpacing,
//         children: fallbackCategories.map((category) {
//           return _buildCategoryChip(
//             id: category['key']!,
//             name: category['name']!,
//             colorCode: '#2196F3', // Default blue color
//             theme: theme,
//             chipSpacing: chipSpacing,
//           );
//         }).toList(),
//       );
//     }

//     return Wrap(
//       spacing: chipSpacing,
//       runSpacing: chipSpacing,
//       children: categories.map((category) {
//         return _buildCategoryChip(
//           id: category.id,
//           name: category.name,
//           colorCode: category.colorCode,
//           theme: theme,
//           chipSpacing: chipSpacing,
//         );
//       }).toList(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);
//     final l10n = AppLocalizations.of(context)!;

//     // Calculate responsive values
//     final double horizontalPadding = mediaQuery.size.width * 0.06;
//     final double verticalSpacing = mediaQuery.size.height * 0.02;
//     final double chipSpacing = 12;

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: verticalSpacing * 2),
//               // Title
//               Text(
//                 l10n.selectYourInterests,
//                 style: theme.textTheme.headlineLarge,
//               ),
//               SizedBox(height: verticalSpacing * 0.4),
//               // Subtitle
//               Text(
//                 l10n.chooseCategories,
//                 style: theme.textTheme.bodyMedium?.copyWith(
//                   color: theme.colorScheme.onSurfaceVariant,
//                 ),
//               ),
//               SizedBox(height: verticalSpacing * 1.5),
//               // Categories content with BlocBuilder
//               Expanded(
//                 child: BlocBuilder<CategoryBloc, CategoryState>(
//                   bloc: _categoryBloc,
//                   builder: (context, state) {
//                     if (state is CategoryLoading) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else if (state is CategoryLoaded) {
//                       return SingleChildScrollView(
//                         child: _buildCategoriesContent(
//                           categories: state.categoryResponse.results,
//                           l10n: l10n,
//                           theme: theme,
//                           chipSpacing: chipSpacing,
//                         ),
//                       );
//                     } else if (state is CategoryError) {
//                       // Show fallback categories on error
//                       return SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             // Error message
//                             Container(
//                               padding: const EdgeInsets.all(16),
//                               margin: const EdgeInsets.only(bottom: 16),
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.errorContainer,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.warning_amber_rounded,
//                                     color: theme.colorScheme.onErrorContainer,
//                                   ),
//                                   const SizedBox(width: 12),
//                                   Expanded(
//                                     child: Text(
//                                       'Unable to load categories. Showing offline version.',
//                                       style: theme.textTheme.bodyMedium?.copyWith(
//                                         color: theme.colorScheme.onErrorContainer,
//                                       ),
//                                     ),
//                                   ),
//                                   IconButton(
//                                     onPressed: _fetchCategories,
//                                     icon: Icon(
//                                       Icons.refresh,
//                                       color: theme.colorScheme.onErrorContainer,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // Fallback categories
//                             _buildCategoriesContent(
//                               categories: [], // Empty list triggers fallback
//                               l10n: l10n,
//                               theme: theme,
//                               chipSpacing: chipSpacing,
//                             ),
//                           ],
//                         ),
//                       );
//                     }

//                     // Initial state - show loading
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   },
//                 ),
//               ),
//               // Bottom action buttons
//               Padding(
//                 padding: EdgeInsets.only(bottom: verticalSpacing),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () {
//                           context.router.replace(NewsRoute());
//                         },
//                         style: OutlinedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           side: BorderSide(
//                             color: theme.colorScheme.outline,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                         ),
//                         child: Text(
//                           l10n.skip,
//                           style: theme.textTheme.labelLarge?.copyWith(
//                             color: theme.colorScheme.onSurfaceVariant,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: horizontalPadding * 0.7),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: _selectedCategories.length >= 1
//                             ? () {
//                           // Save selected categories before navigating
//                           _saveSelectedCategories();
//                           context.router.replace(NewsRoute());
//                         }
//                             : null,
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           backgroundColor: _selectedCategories.length >= 1
//                               ? theme.colorScheme.primary
//                               : theme.colorScheme.primary.withOpacity(0.5),
//                           foregroundColor: theme.colorScheme.onPrimary,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: Text(
//                           l10n.continuee,
//                           style: theme.textTheme.labelLarge?.copyWith(
//                             color: theme.colorScheme.onPrimary,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _saveSelectedCategories() {

//     // final _categoryService = GetIt.instance<CategoryStorageService>();
//     // _categoryService.saveSelectedCategories(_selectedCategories.toList());

//     // You can also save to user preferences if needed
//     print('Selected categories: ${_selectedCategories.toList()}');
//   }
// }











// // // screens/categories/categories_screen.dart
// // import 'package:auto_route/annotations.dart';
// // import 'package:auto_route/auto_route.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// //
// // import '../../../../config/router/app_router.dart';
// //
// // @RoutePage()
// // class ChooseCategoriesScreen extends StatefulWidget {
// //   const ChooseCategoriesScreen({super.key});
// //
// //   @override
// //   State<ChooseCategoriesScreen> createState() => _ChooseCategoriesScreenState();
// // }
// //
// // class _ChooseCategoriesScreenState extends State<ChooseCategoriesScreen> {
// //   // Define categories as a method to get localized names
// //   List<Map<String, String>> _getCategories(AppLocalizations l10n) {
// //     return [
// //       {'key': 'business', 'name': l10n.business},
// //       {'key': 'technology', 'name': l10n.technology},
// //       {'key': 'science', 'name': l10n.science},
// //       {'key': 'health', 'name': l10n.health},
// //       {'key': 'entertainment', 'name': l10n.entertainment},
// //       {'key': 'sports', 'name': l10n.sports},
// //       {'key': 'politics', 'name': l10n.politics},
// //       {'key': 'world', 'name': l10n.world},
// //       {'key': 'environment', 'name': l10n.environment},
// //       {'key': 'education', 'name': l10n.education},
// //       {'key': 'food', 'name': l10n.food},
// //       {'key': 'travel', 'name': l10n.travel},
// //     ];
// //   }
// //
// //   final Set<String> _selectedCategories = {};
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //     final mediaQuery = MediaQuery.of(context);
// //     final l10n = AppLocalizations.of(context)!;
// //
// //     // Get localized categories
// //     final categories = _getCategories(l10n);
// //
// //     // Calculate responsive values without ScreenUtil
// //     final double horizontalPadding = mediaQuery.size.width * 0.06;
// //     final double verticalSpacing = mediaQuery.size.height * 0.02;
// //     final double chipSpacing = 12;
// //
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Padding(
// //           padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               SizedBox(height: verticalSpacing * 2),
// //               // Title
// //               Text(
// //                 l10n.selectYourInterests,
// //                 style: theme.textTheme.headlineLarge,
// //               ),
// //               SizedBox(height: verticalSpacing * 0.4),
// //               // Subtitle
// //               Text(
// //                 l10n.chooseCategories,
// //                 style: theme.textTheme.bodyMedium?.copyWith(
// //                   color: theme.colorScheme.onSurfaceVariant,
// //                 ),
// //               ),
// //               SizedBox(height: verticalSpacing * 1.5),
// //               // Categories Grid using Wrap instead of GridView for more flexibility
// //               Expanded(
// //                 child: SingleChildScrollView(
// //                   child: Wrap(
// //                     spacing: chipSpacing,
// //                     runSpacing: chipSpacing,
// //                     children: categories.map((category) {
// //                       final isSelected = _selectedCategories.contains(category['key']);
// //
// //                       return FilterChip(
// //                         label: Text(category['name']!),
// //                         selected: isSelected,
// //                         onSelected: (selected) {
// //                           setState(() {
// //                             if (selected) {
// //                               _selectedCategories.add(category['key']!);
// //                             } else {
// //                               _selectedCategories.remove(category['key']!);
// //                             }
// //                           });
// //                         },
// //                         avatar: isSelected
// //                             ? Icon(
// //                           Icons.check,
// //                           size: 18,
// //                           color: theme.colorScheme.onPrimary,
// //                         )
// //                             : null,
// //                         labelStyle: TextStyle(
// //                           color: isSelected
// //                               ? theme.colorScheme.onPrimary
// //                               : theme.colorScheme.onSurfaceVariant,
// //                           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// //                         ),
// //                         backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.5),
// //                         selectedColor: theme.colorScheme.primary,
// //                         checkmarkColor: theme.colorScheme.onPrimary,
// //                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(16),
// //                           side: BorderSide(
// //                             color: isSelected
// //                                 ? theme.colorScheme.primary
// //                                 : theme.colorScheme.outline,
// //                             width: isSelected ? 1.5 : 1.0,
// //                           ),
// //                         ),
// //                       );
// //                     }).toList(),
// //                   ),
// //                 ),
// //               ),
// //               // Bottom action buttons
// //               Padding(
// //                 padding: EdgeInsets.only(bottom: verticalSpacing),
// //                 child: Row(
// //                   children: [
// //                     Expanded(
// //                       child: OutlinedButton(
// //                         onPressed: () {
// //                           // Skip action - navigate to next screen
// //                           context.router.replace(const SignupRoute());
// //                         },
// //                         style: OutlinedButton.styleFrom(
// //                           padding: const EdgeInsets.symmetric(vertical: 16),
// //                           side: BorderSide(
// //                             color: theme.colorScheme.outline,
// //                           ),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(16),
// //                           ),
// //                         ),
// //                         child: Text(
// //                           l10n.skip,
// //                           style: theme.textTheme.labelLarge?.copyWith(
// //                             color: theme.colorScheme.onSurfaceVariant,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(width: horizontalPadding * 0.7),
// //                     Expanded(
// //                       child: ElevatedButton(
// //                         onPressed: _selectedCategories.length >= 1
// //                             ? () {
// //                           context.router.replace(const SignupRoute());
// //                         }
// //                             : null,
// //                         style: ElevatedButton.styleFrom(
// //                           padding: const EdgeInsets.symmetric(vertical: 16),
// //                           backgroundColor: _selectedCategories.length >= 1
// //                               ? theme.colorScheme.primary
// //                               : theme.colorScheme.primary.withOpacity(0.5),
// //                           foregroundColor: theme.colorScheme.onPrimary,
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(16),
// //                           ),
// //                           elevation: 0,
// //                         ),
// //                         child: Text(
// //                           l10n.continuee,
// //                           style: theme.textTheme.labelLarge?.copyWith(
// //                             color: theme.colorScheme.onPrimary,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }