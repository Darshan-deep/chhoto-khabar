import 'package:equatable/equatable.dart';

class CommentUser extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isStaff;
  final bool isSuperuser;
  final int bookmarksCount;

  const CommentUser({
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

class CommentEntity extends Equatable {
  final String id;
  final CommentUser user;
  final String article;
  final String? parent;
  final String content;
  final bool hasReplies;
  final String createdAt;

  const CommentEntity({
    required this.id,
    required this.user,
    required this.article,
    this.parent,
    required this.content,
    required this.hasReplies,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        user,
        article,
        parent,
        content,
        hasReplies,
        createdAt,
      ];
}

class CommentsResponse extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<CommentEntity> results;

  const CommentsResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}
