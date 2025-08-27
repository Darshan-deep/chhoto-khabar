// File: lib/features/bookmark/data/models/bookmark_models.dart

import 'package:chhoto_khabar/features/bookmark/domain/entities/bookmark.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.colorCode,
    super.iconUrl,
    required super.description,
    required super.slug,
    required super.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    try {
      // Handle both Map and String formats for the name field
      Map<String, String> nameMap;
      final nameData = json['name'];
      
      if (nameData is Map) {
        nameMap = <String, String>{};
        nameData.forEach((key, value) {
          nameMap[key.toString()] = value.toString();
        });
      } else if (nameData is String) {
        // If it's a string, create a map with 'en' as default key
        nameMap = {'en': nameData};
      } else if (nameData != null) {
        nameMap = {'en': nameData.toString()};
      } else {
        nameMap = <String, String>{};
      }

      return CategoryModel(
        id: json['id']?.toString() ?? '',
        name: nameMap,
        colorCode: json['color_code']?.toString() ?? '#000000',
        iconUrl: json['icon_url']?.toString(),
        description: json['description']?.toString() ?? '',
        slug: json['slug']?.toString() ?? '',
        createdAt: json['created_at']?.toString() ?? '',
      );
    } catch (e, stackTrace) {
      throw FormatException('Failed to parse CategoryModel: $e\nData: $json\nStackTrace: $stackTrace');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color_code': colorCode,
      'icon_url': iconUrl,
      'description': description,
      'slug': slug,
      'created_at': createdAt,
    };
  }

  CategoryModel copyWith({
    String? id,
    Map<String, String>? name,
    String? colorCode,
    String? iconUrl,
    String? description,
    String? slug,
    String? createdAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      colorCode: colorCode ?? this.colorCode,
      iconUrl: iconUrl ?? this.iconUrl,
      description: description ?? this.description,
      slug: slug ?? this.slug,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class TagModel extends Tag {
  const TagModel({
    required super.id,
    required super.name,
    required super.createdAt,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    try {
      return TagModel(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
        createdAt: json['created_at']?.toString() ?? '',
      );
    } catch (e, stackTrace) {
      throw FormatException('Failed to parse TagModel: $e\nData: $json\nStackTrace: $stackTrace');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
    };
  }

  TagModel copyWith({
    String? id,
    String? name,
    String? createdAt,
  }) {
    return TagModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ContentModel extends Content {
  const ContentModel({
    required super.title,
    required super.summary,
    required super.content,
    super.sourceUrl,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    try {
      // Updated to handle the new flattened structure
      Map<String, String> titleMap = <String, String>{};
      Map<String, String> summaryMap = <String, String>{};
      Map<String, String> contentMap = <String, String>{};
      String? sourceUrl;

      // Parse each language object
      json.forEach((languageKey, languageData) {
        if (languageData is Map<String, dynamic>) {
          if (languageData['title'] != null) {
            titleMap[languageKey] = languageData['title'].toString();
          }
          if (languageData['summary'] != null) {
            summaryMap[languageKey] = languageData['summary'].toString();
          }
          if (languageData['content'] != null) {
            contentMap[languageKey] = languageData['content'].toString();
          }
          if (languageData['source_url'] != null && sourceUrl == null) {
            sourceUrl = languageData['source_url'].toString();
          }
        }
      });

      return ContentModel(
        title: titleMap,
        summary: summaryMap,
        content: contentMap,
        sourceUrl: sourceUrl,
      );
    } catch (e, stackTrace) {
      throw FormatException('Failed to parse ContentModel: $e\nData: $json\nStackTrace: $stackTrace');
    }
  }

  Map<String, dynamic> toJson() {
    // Convert back to the flattened structure
    Map<String, dynamic> result = {};
    
    // Get all language keys
    Set<String> allLanguages = <String>{
      ...title.keys,
      ...summary.keys,
      ...content.keys,
    };

    for (String lang in allLanguages) {
      result[lang] = {
        'title': title[lang] ?? '',
        'summary': summary[lang] ?? '',
        'content': content[lang] ?? '',
        'source_url': sourceUrl,
      };
    }

    return result;
  }

  ContentModel copyWith({
    Map<String, String>? title,
    Map<String, String>? summary,
    Map<String, String>? content,
    String? sourceUrl,
  }) {
    return ContentModel(
      title: title ?? this.title,
      summary: summary ?? this.summary,
      content: content ?? this.content,
      sourceUrl: sourceUrl ?? this.sourceUrl,
    );
  }
}

class AuthorModel extends Author {
  const AuthorModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.isStaff,
    required super.isSuperuser,
    required super.bookmarksCount,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    try {
      return AuthorModel(
        id: json['id']?.toString() ?? '',
        email: json['email']?.toString() ?? '',
        firstName: json['first_name']?.toString() ?? '',
        lastName: json['last_name']?.toString() ?? '',
        isStaff: _parseBool(json['is_staff']),
        isSuperuser: _parseBool(json['is_superuser']),
        bookmarksCount: _parseInt(json['bookmarks_count']),
      );
    } catch (e, stackTrace) {
      throw FormatException('Failed to parse AuthorModel: $e\nData: $json\nStackTrace: $stackTrace');
    }
  }

  static bool _parseBool(dynamic value) {
    if (value is bool) return value;
    if (value is String) {
      final lowerValue = value.toLowerCase();
      return lowerValue == 'true' || lowerValue == '1';
    }
    if (value is int) return value != 0;
    return false;
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    if (value is double) return value.toInt();
    return 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'is_staff': isStaff,
      'is_superuser': isSuperuser,
      'bookmarks_count': bookmarksCount,
    };
  }

  AuthorModel copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    bool? isStaff,
    bool? isSuperuser,
    int? bookmarksCount,
  }) {
    return AuthorModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isStaff: isStaff ?? this.isStaff,
      isSuperuser: isSuperuser ?? this.isSuperuser,
      bookmarksCount: bookmarksCount ?? this.bookmarksCount,
    );
  }
}

class ArticleModel extends Article {
  const ArticleModel({
    required super.id,
    super.image,
    required super.isPublished,
    required super.publishedAt,
    required super.categories,
    required super.tags,
    required super.content,
    required super.numberOfLikes,
    required super.isLiked,
    required super.isBookmarked,
    required super.numberOfComments,
    required super.author,
    required super.slug,
    required super.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    try {
      return ArticleModel(
        id: json['id']?.toString() ?? '',
        image: json['image']?.toString(),
        isPublished: AuthorModel._parseBool(json['is_published']),
        publishedAt: json['published_at']?.toString() ?? '',
        categories: _parseCategories(json['categories']),
        tags: _parseTags(json['tags']),
        content: ContentModel.fromJson(_ensureMap(json['content'])),
        numberOfLikes: AuthorModel._parseInt(json['number_of_likes']),
        isLiked: AuthorModel._parseBool(json['is_liked']),
        isBookmarked: AuthorModel._parseBool(json['is_bookmarked']),
        numberOfComments: AuthorModel._parseInt(json['number_of_comments']),
        author: AuthorModel.fromJson(_ensureMap(json['author'])),
        slug: json['slug']?.toString() ?? '',
        createdAt: json['created_at']?.toString() ?? '',
      );
    } catch (e, stackTrace) {
      throw FormatException('Failed to parse ArticleModel: $e\nData: $json\nStackTrace: $stackTrace');
    }
  }

  static Map<String, dynamic> _ensureMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      final Map<String, dynamic> result = <String, dynamic>{};
      value.forEach((key, val) {
        result[key.toString()] = val;
      });
      return result;
    }
    return <String, dynamic>{};
  }

  static List<CategoryModel> _parseCategories(dynamic categoriesData) {
    if (categoriesData == null) return <CategoryModel>[];
    
    if (categoriesData is! List) return <CategoryModel>[];

    final List<CategoryModel> categories = <CategoryModel>[];
    
    for (final item in categoriesData) {
      try {
        final Map<String, dynamic> categoryMap = _ensureMap(item);
        if (categoryMap.isNotEmpty) {
          categories.add(CategoryModel.fromJson(categoryMap));
        }
      } catch (e) {
        print('Warning: Failed to parse category item: $e');
        // Continue parsing other categories
      }
    }
    
    return categories;
  }

  static List<TagModel> _parseTags(dynamic tagsData) {
    if (tagsData == null) return <TagModel>[];
    
    if (tagsData is! List) return <TagModel>[];

    final List<TagModel> tags = <TagModel>[];
    
    for (final item in tagsData) {
      try {
        final Map<String, dynamic> tagMap = _ensureMap(item);
        if (tagMap.isNotEmpty) {
          tags.add(TagModel.fromJson(tagMap));
        }
      } catch (e) {
        print('Warning: Failed to parse tag item: $e');
        // Continue parsing other tags
      }
    }
    
    return tags;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'is_published': isPublished,
      'published_at': publishedAt,
      'categories': categories.map((c) => (c as CategoryModel).toJson()).toList(),
      'tags': tags.map((t) => (t as TagModel).toJson()).toList(),
      'content': (content as ContentModel).toJson(),
      'number_of_likes': numberOfLikes,
      'is_liked': isLiked,
      'is_bookmarked': isBookmarked,
      'number_of_comments': numberOfComments,
      'author': (author as AuthorModel).toJson(),
      'slug': slug,
      'created_at': createdAt,
    };
  }

  ArticleModel copyWith({
    String? id,
    String? image,
    bool? isPublished,
    String? publishedAt,
    List<Category>? categories,
    List<Tag>? tags,
    Content? content,
    int? numberOfLikes,
    bool? isLiked,
    bool? isBookmarked,
    int? numberOfComments,
    Author? author,
    String? slug,
    String? createdAt,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      image: image ?? this.image,
      isPublished: isPublished ?? this.isPublished,
      publishedAt: publishedAt ?? this.publishedAt,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
      content: content ?? this.content,
      numberOfLikes: numberOfLikes ?? this.numberOfLikes,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      numberOfComments: numberOfComments ?? this.numberOfComments,
      author: author ?? this.author,
      slug: slug ?? this.slug,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class BookmarkModel extends Bookmark {
  const BookmarkModel({
    required super.id,
    required super.article,
    required super.createdAt,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    try {
      return BookmarkModel(
        id: json['id']?.toString() ?? '',
        article: ArticleModel.fromJson(ArticleModel._ensureMap(json['article'])),
        createdAt: json['created_at']?.toString() ?? '',
      );
    } catch (e, stackTrace) {
      throw FormatException('Failed to parse BookmarkModel: $e\nData: $json\nStackTrace: $stackTrace');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'article': (article as ArticleModel).toJson(),
      'created_at': createdAt,
    };
  }

  BookmarkModel copyWith({
    String? id,
    Article? article,
    String? createdAt,
  }) {
    return BookmarkModel(
      id: id ?? this.id,
      article: article ?? this.article,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

// Utility class for parsing responses
class BookmarkResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<BookmarkModel> results;

  const BookmarkResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory BookmarkResponse.fromJson(Map<String, dynamic> json) {
    try {
      final resultsData = json['results'];
      List<BookmarkModel> bookmarks = <BookmarkModel>[];

      if (resultsData is List) {
        for (final item in resultsData) {
          try {
            final Map<String, dynamic> bookmarkMap = ArticleModel._ensureMap(item);
            if (bookmarkMap.isNotEmpty) {
              bookmarks.add(BookmarkModel.fromJson(bookmarkMap));
            }
          } catch (e) {
            print('Warning: Failed to parse bookmark item: $e');
            // Continue parsing other bookmarks
          }
        }
      }

      return BookmarkResponse(
        count: AuthorModel._parseInt(json['count']),
        next: json['next']?.toString(),
        previous: json['previous']?.toString(),
        results: bookmarks,
      );
    } catch (e, stackTrace) {
      throw FormatException('Failed to parse BookmarkResponse: $e\nData: $json\nStackTrace: $stackTrace');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((bookmark) => bookmark.toJson()).toList(),
    };
  }
}