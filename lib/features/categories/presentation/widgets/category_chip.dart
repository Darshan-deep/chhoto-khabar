import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/domain/model/language_model.dart';

class CategoryChip extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        // Get the category name based on current language
        final categoryName = languageState.selectedLanguage == Language.nepali 
            ? category.name.np 
            : category.name.en;
        
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected 
                ? Color(int.parse(category.colorCode.replaceFirst('#', '0xFF')))
                : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected 
                  ? Color(int.parse(category.colorCode.replaceFirst('#', '0xFF')))
                  : theme.colorScheme.outline.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              categoryName,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isSelected 
                  ? Colors.white
                  : theme.colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AllCategoryChip extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const AllCategoryChip({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        // Get localized "All" text based on current language
        final allText = languageState.selectedLanguage == Language.nepali 
            ? 'सबै' // "All" in Nepali
            : 'All';
        
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected 
                ? theme.colorScheme.primary
                : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected 
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              allText,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isSelected 
                  ? Colors.white
                  : theme.colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
