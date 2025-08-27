import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/categories/domain/usecases/get_categories_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryBloc({
    required this.getCategoriesUseCase,
  }) : super(const CategoryState.initial()) {
    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState.loading());

    final result = await getCategoriesUseCase();

    result.fold(
      (failure) => emit(CategoryState.error(failure.message)),
      (categories) => emit(CategoryState.loaded(categories: categories)),
    );
  }

  Future<void> _onSelectCategory(
    SelectCategory event,
    Emitter<CategoryState> emit,
  ) async {
    final currentState = state;
    if (currentState is Loaded) {
      emit(CategoryState.loaded(
        categories: currentState.categories,
        selectedCategory: event.category,
      ));
    }
  }
}
