import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/categories/presentation/bloc/category_bloc.dart';
import 'package:chhoto_khabar/features/categories/presentation/widgets/category_chip.dart';
import 'package:chhoto_khabar/core/config/dependency_injection/di_config.dart';

class CategoryFilterWidget extends StatelessWidget {
  final Function(Category?) onCategorySelected;

  const CategoryFilterWidget({
    super.key,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryBloc>()..add(const CategoryEvent.loadCategories()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        
        height: 35,
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
              loaded: (categories, selectedCategory) => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length + 1, // +1 for "All" chip
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // "All" chip
                    return AllCategoryChip(
                      isSelected: selectedCategory == null,
                      onTap: () {
                        context.read<CategoryBloc>().add(
                          const CategoryEvent.selectCategory(null),
                        );
                        onCategorySelected(null);
                      },
                    );
                  }
                  
                  final category = categories[index - 1];
                  return CategoryChip(
                    category: category,
                    isSelected: selectedCategory?.id == category.id,
                    onTap: () {
                      context.read<CategoryBloc>().add(
                        CategoryEvent.selectCategory(category),
                      );
                      onCategorySelected(category);
                    },
                  );
                },
              ),
              error: (message) => Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Failed to load categories: $message',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
