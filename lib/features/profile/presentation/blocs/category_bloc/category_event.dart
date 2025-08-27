// features/category/bloc/category_event.dart
import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class FetchCategories extends CategoryEvent {
  final String? language;
  final int? page;
  final int? size;
  final bool? forceRefresh;

  const FetchCategories({
    this.language,
    this.page,
    this.size,
    this.forceRefresh,
  });

  @override
  List<Object?> get props => [language, page, size, forceRefresh];
}

class RefreshCategories extends CategoryEvent {
  final String? language;

  const RefreshCategories({this.language});

  @override
  List<Object?> get props => [language];
}

class LoadCachedCategories extends CategoryEvent {
  const LoadCachedCategories();

  @override
  List<Object?> get props => [];
}