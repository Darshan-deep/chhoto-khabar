class Category {
  final String id;
  final CategoryNameEntity name;
  final String colorCode;
  final String? iconUrl;
  final String description;
  final String slug;
  final DateTime createdAt;

  const Category({
    required this.id,
    required this.name,
    required this.colorCode,
    this.iconUrl,
    required this.description,
    required this.slug,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, slug: $slug)';
  }
}

class CategoryNameEntity {
  final String en;
  final String np;

  const CategoryNameEntity({
    required this.en,
    required this.np,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CategoryNameEntity && other.en == en && other.np == np;
  }

  @override
  int get hashCode => en.hashCode ^ np.hashCode;

  @override
  String toString() {
    return 'CategoryNameEntity(en: $en, np: $np)';
  }
}

class CategoryResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Category> results;

  const CategoryResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
}
