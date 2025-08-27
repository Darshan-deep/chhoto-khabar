// shared/domain/models/category.dart
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String id;
  final String name;
  final String colorCode;
  final String? iconUrl;
  final String description;
  final String slug;
  final DateTime createdAt;

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
      name: json['name'] as String,
      colorCode: json['color_code'] as String,
      iconUrl: json['icon_url'] as String?,
      description: json['description'] as String,
      slug: json['slug'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color_code': colorCode,
      'icon_url': iconUrl,
      'description': description,
      'slug': slug,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, name, colorCode, iconUrl, description, slug, createdAt];
}