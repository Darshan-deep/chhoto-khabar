// shared/domain/models/response.dart
import 'package:equatable/equatable.dart';
import 'category_model.dart';

class CategoryResponse extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<CategoryModel> results;

  const CategoryResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((category) => category.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}