import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/categories/presentation/bloc/category_bloc.dart';
import 'package:chhoto_khabar/core/widgets/news_shimmer_effects.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/domain/model/language_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHeader extends StatelessWidget {
  final int currentMainIndex;
  final VoidCallback onMenuTap;
  final VoidCallback onInfoTap;
  final Function(Category?) onCategorySelected;
  final Category? selectedCategory;

  const MainHeader({
    super.key,
    required this.currentMainIndex,
    required this.onMenuTap,
    required this.onInfoTap,
    required this.onCategorySelected,
    this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: Color(0xFFE5F2F3),
      ),
      child: Column(
        children: [
          // Top Row: Logo, Categories, Navigation, Info, Menu
          Row(
            children: [
              // App Logo
              _buildAppLogo(),
              const SizedBox(width: 12),

              // Category Scroll
              Expanded(
                child: _buildCategoryScroll(),
              ),

              const SizedBox(width: 8),

              // Info Button
              _buildInfoButton(),

              const SizedBox(width: 8),

              // Menu Button
              _buildMenuButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppLogo() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/logo/square_logo.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.newspaper,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryScroll() {
    return SizedBox(
      height: 40,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => NewsShimmerEffects.buildCategoryList(
              itemCount: 3,
              isConstrained: true,
            ),
            loading: () => NewsShimmerEffects.buildCategoryList(
              itemCount: 3,
              isConstrained: true,
            ),
            loaded: (categories, _) {
              if (categories.isEmpty) {
                return const SizedBox.shrink();
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1, // +1 for "All" category
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // "All" category chip
                    return BlocBuilder<LanguageBloc, LanguageState>(
                      builder: (context, languageState) {
                        final isEnglish = languageState.selectedLanguage == Language.english;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: _buildCategoryChip(
                            label: isEnglish ? 'My Feed' : 'मेरो फिड',
                            isSelected: selectedCategory == null,
                            onTap: () => onCategorySelected(null),
                          ),
                        );
                      },
                    );
                  }

                  final category = categories[index - 1];
                  return BlocBuilder<LanguageBloc, LanguageState>(
                    builder: (context, languageState) {
                      final isEnglish = languageState.selectedLanguage == Language.english;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _buildCategoryChip(
                          label: isEnglish ? category.name.en : category.name.np,
                          isSelected: selectedCategory?.id == category.id,
                          onTap: () => onCategorySelected(category),
                        ),
                      );
                    },
                  );
                },
              );
            },
            error: (message) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildCategoryChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF2eaf99) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: isSelected
              ? Border.all(color: Colors.white.withValues(alpha: 0.5))
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 14,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoButton() {
    return GestureDetector(
      onTap: onInfoTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.help,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildMenuButton() {
    return GestureDetector(
      onTap: onMenuTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
