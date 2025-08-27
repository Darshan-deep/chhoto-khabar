import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';

class CommentUserModel extends CommentUser {
  const CommentUserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.isStaff,
    required super.isSuperuser,
    required super.bookmarksCount,
  });

  factory CommentUserModel.fromJson(Map<String, dynamic> json) {
    return CommentUserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      isStaff: json['is_staff'] as bool,
      isSuperuser: json['is_superuser'] as bool,
      bookmarksCount: json['bookmarks_count'] as int,
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

class CommentModel extends CommentEntity {
  const CommentModel({
    required super.id,
    required super.user,
    required super.article,
    super.parent,
    required super.content,
    required super.hasReplies,
    required super.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] as String,
      user: json['user'] != null 
          ? CommentUserModel.fromJson(json['user'] as Map<String, dynamic>)
          : const CommentUserModel(
              id: '',
              email: '',
              firstName: 'Unknown',
              lastName: 'User',
              isStaff: false,
              isSuperuser: false,
              bookmarksCount: 0,
            ),
      article: json['article'] as String,
      parent: json['parent'] as String?,
      content: json['content'] as String,
      hasReplies: json['has_replies'] as bool? ?? false,
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': (user as CommentUserModel).toJson(),
      'article': article,
      'parent': parent,
      'content': content,
      'has_replies': hasReplies,
      'created_at': createdAt,
    };
  }
}

class CommentsResponseModel extends CommentsResponse {
  const CommentsResponseModel({
    required super.count,
    super.next,
    super.previous,
    required super.results,
  });

  factory CommentsResponseModel.fromJson(Map<String, dynamic> json) {
    return CommentsResponseModel(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((comment) => CommentModel.fromJson(comment as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results
          .map((comment) => (comment as CommentModel).toJson())
          .toList(),
    };
  }
}
