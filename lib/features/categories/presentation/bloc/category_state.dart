part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = Initial;
  
  const factory CategoryState.loading() = Loading;
  
  const factory CategoryState.loaded({
    required List<Category> categories,
    Category? selectedCategory,
  }) = Loaded;
  
  const factory CategoryState.error(String message) = Error;
}
