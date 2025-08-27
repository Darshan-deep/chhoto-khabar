import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final Map<String, String> name;
  final String colorCode;
  final String? iconUrl;
  final String description;
  final String slug;
  final String createdAt;

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
  List<Object?> get props => [
        id,
        name,
        colorCode,
        iconUrl,
        description,
        slug,
        createdAt,
      ];
}

class Tag extends Equatable {
  final String id;
  final String name;
  final String createdAt;

  const Tag({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  @override
  List<Object> get props => [id, name, createdAt];
}

class Content extends Equatable {
  final Map<String, String> title;
  final Map<String, String> summary;
  final Map<String, String> content;
  final String? sourceUrl;

  const Content({
    required this.title,
    required this.summary,
    required this.content,
    this.sourceUrl,
  });

  @override
  List<Object?> get props => [title, summary, content, sourceUrl];
}

class Author extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isStaff;
  final bool isSuperuser;
  final int bookmarksCount;

  const Author({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isSuperuser,
    required this.bookmarksCount,
  });

  String get fullName => '$firstName $lastName'.trim();

  @override
  List<Object> get props => [
        id,
        email,
        firstName,
        lastName,
        isStaff,
        isSuperuser,
        bookmarksCount,
      ];
}

class Article extends Equatable {
  final String id;
  final String? imageUrl;
  final bool isPublished;
  final String publishedAt;
  final List<Category> categories;
  final List<Tag> tags;
  final Content content;
  final int numberOfLikes;
  final bool isLiked;
  final bool isBookmarked;
  final int numberOfComments;
  final Author? author;
  final String slug;
  final String createdAt;

  const Article({
    required this.id,
    this.imageUrl,
    required this.isPublished,
    required this.publishedAt,
    required this.categories,
    required this.tags,
    required this.content,
    required this.numberOfLikes,
    required this.isLiked,
    required this.isBookmarked,
    required this.numberOfComments,
    this.author,
    required this.slug,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        isPublished,
        publishedAt,
        categories,
        tags,
        content,
        numberOfLikes,
        isLiked,
        isBookmarked,
        numberOfComments,
        author,
        slug,
        createdAt,
      ];
}

class NewsResponse extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<Article> results;

  const NewsResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}
