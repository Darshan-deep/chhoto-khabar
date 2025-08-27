import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';

class CategoryModel {
  final String id;
  final CategoryNameModel name;
  final String colorCode;
  final String? iconUrl;
  final String description;
  final String slug;
  final String createdAt;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.colorCode,
    this.iconUrl,
    required this.description,
    required this.slug,
    required this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: CategoryNameModel.fromJson(json['name'] as Map<String, dynamic>),
      colorCode: json['color_code'] as String,
      iconUrl: json['icon_url'] as String?,
      description: json['description'] as String,
      slug: json['slug'] as String,
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name.toJson(),
      'color_code': colorCode,
      'icon_url': iconUrl,
      'description': description,
      'slug': slug,
      'created_at': createdAt,
    };
  }

  Category toEntity() {
    return Category(
      id: id,
      name: CategoryNameEntity(
        en: name.en,
        np: name.np,
      ),
      colorCode: colorCode,
      iconUrl: iconUrl,
      description: description,
      slug: slug,
      createdAt: DateTime.parse(createdAt),
    );
  }
}

class CategoryNameModel {
  final String en;
  final String np;

  const CategoryNameModel({
    required this.en,
    required this.np,
  });

  factory CategoryNameModel.fromJson(Map<String, dynamic> json) {
    return CategoryNameModel(
      en: json['en'] as String,
      np: json['np'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'np': np,
    };
  }
}

class CategoryResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<CategoryModel> results;

  const CategoryResponseModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
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
      'results': results.map((item) => item.toJson()).toList(),
    };
  }
}
