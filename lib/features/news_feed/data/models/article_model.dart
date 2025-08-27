import 'package:chhoto_khabar/features/news_feed/domain/entities/article.dart';

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
    Map<String, String> nameMap;
    
    // Handle both string and map name formats
    if (json['name'] is String) {
      // Simple string format from articles endpoint
      nameMap = {'en': json['name'] as String};
    } else if (json['name'] is Map) {
      // Map format from categories endpoint
      nameMap = Map<String, String>.from(json['name'] as Map);
    } else {
      nameMap = <String, String>{};
    }
    
    return CategoryModel(
      id: json['id'] as String,
      name: nameMap,
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
      'name': name,
      'color_code': colorCode,
      'icon_url': iconUrl,
      'description': description,
      'slug': slug,
      'created_at': createdAt,
    };
  }
}

class TagModel extends Tag {
  const TagModel({
    required super.id,
    required super.name,
    required super.createdAt,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
    };
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
    // Check if this is a flat structure (single language response)
    if (json.containsKey('title') && json.containsKey('summary') && json.containsKey('content')) {
      // Flat structure - API returned content for specific language
      // Use multiple keys to ensure compatibility with existing UI code
      final title = json['title']?.toString() ?? '';
      final summary = json['summary']?.toString() ?? '';
      final content = json['content']?.toString() ?? '';
      
      return ContentModel(
        title: {
          'en': title,  // For backward compatibility with existing UI
          'np': title,  // For Nepali
          'current': title,  // For current language
        }, 
        summary: {
          'en': summary,
          'np': summary,
          'current': summary,
        },
        content: {
          'en': content,
          'np': content,
          'current': content,
        },
        sourceUrl: json['source_url']?.toString(),
      );
    }
    
    // Handle the nested structure where content has language-specific objects
    final Map<String, String> titles = {};
    final Map<String, String> summaries = {};
    final Map<String, String> contents = {};
    String? sourceUrl;

    // Extract data from language-specific nested objects
    json.forEach((language, data) {
      if (data is Map<String, dynamic>) {
        if (data['title'] != null) {
          titles[language] = data['title'].toString();
        }
        if (data['summary'] != null) {
          summaries[language] = data['summary'].toString();
        }
        if (data['content'] != null) {
          contents[language] = data['content'].toString();
        }
        if (data['source_url'] != null) {
          sourceUrl = data['source_url'].toString();
        }
      }
    });

    return ContentModel(
      title: titles,
      summary: summaries,
      content: contents,
      sourceUrl: sourceUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'summary': summary,
      'content': content,
      'source_url': sourceUrl,
    };
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
    return AuthorModel(
      id: json['id'] as String,
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      isStaff: json['is_staff'] as bool? ?? false,
      isSuperuser: json['is_superuser'] as bool? ?? false,
      bookmarksCount: json['bookmarks_count'] as int? ?? 0,
    );
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
}

class ArticleModel extends Article {
  const ArticleModel({
    required super.id,
    super.imageUrl,
    required super.isPublished,
    required super.publishedAt,
    required super.categories,
    required super.tags,
    required super.content,
    required super.numberOfLikes,
    required super.isLiked,
    required super.isBookmarked,
    required super.numberOfComments,
    super.author,
    required super.slug,
    required super.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    try {
      print('🔍 Parsing article: ${json['id']}');
      
      return ArticleModel(
        id: json['id'] as String,
        imageUrl: json['image_url'] as String?,
        isPublished: json['is_published'] as bool? ?? true,
        publishedAt: json['published_at'] as String,
        categories: (json['categories'] as List? ?? [])
            .map((cat) => CategoryModel.fromJson(cat as Map<String, dynamic>))
            .toList(),
        tags: (json['tags'] as List? ?? [])
            .map((tag) => TagModel.fromJson(tag as Map<String, dynamic>))
            .toList(),
        content: () {
          print('🔍 Content field type: ${json['content'].runtimeType}');
          print('🔍 Content field value: ${json['content']}');
          if (json['content'] is Map<String, dynamic>) {
            return ContentModel.fromJson(json['content'] as Map<String, dynamic>);
          } else {
            throw Exception('Content field is not a Map: ${json['content'].runtimeType}');
          }
        }(),
        numberOfLikes: json['number_of_likes'] as int? ?? 0,
        isLiked: json['is_liked'] as bool? ?? false,
        isBookmarked: json['is_bookmarked'] as bool? ?? false,
        numberOfComments: json['number_of_comments'] as int? ?? 0,
        author: json['author'] != null 
          ? AuthorModel.fromJson(json['author'] as Map<String, dynamic>)
          : null,
        slug: json['slug'] as String,
        createdAt: json['created_at'] as String,
      );
    } catch (e) {
      print('❌ ArticleModel parsing error for ${json['id']}: $e');
      print('❌ Content field: ${json['content']}');
      throw Exception('Failed to parse ArticleModel: $e\nJSON: $json');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'is_published': isPublished,
      'published_at': publishedAt,
      'categories': categories
          .map((cat) => (cat as CategoryModel).toJson())
          .toList(),
      'tags': tags.map((tag) => (tag as TagModel).toJson()).toList(),
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
}

class NewsResponseModel extends NewsResponse {
  const NewsResponseModel({
    required super.count,
    super.next,
    super.previous,
    required super.results,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((article) => ArticleModel.fromJson(article as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results
          .map((article) => (article as ArticleModel).toJson())
          .toList(),
    };
  }
}
