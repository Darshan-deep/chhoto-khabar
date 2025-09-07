// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommentsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String articleId) loadComments,
    required TResult Function(String articleId) loadMoreComments,
    required TResult Function(
            String articleId, String content, String? parentId)
        postComment,
    required TResult Function(String commentId, String content) editComment,
    required TResult Function(String articleId) refreshComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String articleId)? loadComments,
    TResult? Function(String articleId)? loadMoreComments,
    TResult? Function(String articleId, String content, String? parentId)?
        postComment,
    TResult? Function(String commentId, String content)? editComment,
    TResult? Function(String articleId)? refreshComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String articleId)? loadComments,
    TResult Function(String articleId)? loadMoreComments,
    TResult Function(String articleId, String content, String? parentId)?
        postComment,
    TResult Function(String commentId, String content)? editComment,
    TResult Function(String articleId)? refreshComments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(LoadMoreComments value) loadMoreComments,
    required TResult Function(PostComment value) postComment,
    required TResult Function(EditComment value) editComment,
    required TResult Function(RefreshComments value) refreshComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(LoadMoreComments value)? loadMoreComments,
    TResult? Function(PostComment value)? postComment,
    TResult? Function(EditComment value)? editComment,
    TResult? Function(RefreshComments value)? refreshComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(LoadMoreComments value)? loadMoreComments,
    TResult Function(PostComment value)? postComment,
    TResult Function(EditComment value)? editComment,
    TResult Function(RefreshComments value)? refreshComments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsEventCopyWith<$Res> {
  factory $CommentsEventCopyWith(
          CommentsEvent value, $Res Function(CommentsEvent) then) =
      _$CommentsEventCopyWithImpl<$Res, CommentsEvent>;
}

/// @nodoc
class _$CommentsEventCopyWithImpl<$Res, $Val extends CommentsEvent>
    implements $CommentsEventCopyWith<$Res> {
  _$CommentsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadCommentsImplCopyWith<$Res> {
  factory _$$LoadCommentsImplCopyWith(
          _$LoadCommentsImpl value, $Res Function(_$LoadCommentsImpl) then) =
      __$$LoadCommentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String articleId});
}

/// @nodoc
class __$$LoadCommentsImplCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$LoadCommentsImpl>
    implements _$$LoadCommentsImplCopyWith<$Res> {
  __$$LoadCommentsImplCopyWithImpl(
      _$LoadCommentsImpl _value, $Res Function(_$LoadCommentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
  }) {
    return _then(_$LoadCommentsImpl(
      null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadCommentsImpl implements LoadComments {
  const _$LoadCommentsImpl(this.articleId);

  @override
  final String articleId;

  @override
  String toString() {
    return 'CommentsEvent.loadComments(articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCommentsImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articleId);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCommentsImplCopyWith<_$LoadCommentsImpl> get copyWith =>
      __$$LoadCommentsImplCopyWithImpl<_$LoadCommentsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String articleId) loadComments,
    required TResult Function(String articleId) loadMoreComments,
    required TResult Function(
            String articleId, String content, String? parentId)
        postComment,
    required TResult Function(String commentId, String content) editComment,
    required TResult Function(String articleId) refreshComments,
  }) {
    return loadComments(articleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String articleId)? loadComments,
    TResult? Function(String articleId)? loadMoreComments,
    TResult? Function(String articleId, String content, String? parentId)?
        postComment,
    TResult? Function(String commentId, String content)? editComment,
    TResult? Function(String articleId)? refreshComments,
  }) {
    return loadComments?.call(articleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String articleId)? loadComments,
    TResult Function(String articleId)? loadMoreComments,
    TResult Function(String articleId, String content, String? parentId)?
        postComment,
    TResult Function(String commentId, String content)? editComment,
    TResult Function(String articleId)? refreshComments,
    required TResult orElse(),
  }) {
    if (loadComments != null) {
      return loadComments(articleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(LoadMoreComments value) loadMoreComments,
    required TResult Function(PostComment value) postComment,
    required TResult Function(EditComment value) editComment,
    required TResult Function(RefreshComments value) refreshComments,
  }) {
    return loadComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(LoadMoreComments value)? loadMoreComments,
    TResult? Function(PostComment value)? postComment,
    TResult? Function(EditComment value)? editComment,
    TResult? Function(RefreshComments value)? refreshComments,
  }) {
    return loadComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(LoadMoreComments value)? loadMoreComments,
    TResult Function(PostComment value)? postComment,
    TResult Function(EditComment value)? editComment,
    TResult Function(RefreshComments value)? refreshComments,
    required TResult orElse(),
  }) {
    if (loadComments != null) {
      return loadComments(this);
    }
    return orElse();
  }
}

abstract class LoadComments implements CommentsEvent {
  const factory LoadComments(final String articleId) = _$LoadCommentsImpl;

  String get articleId;

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadCommentsImplCopyWith<_$LoadCommentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreCommentsImplCopyWith<$Res> {
  factory _$$LoadMoreCommentsImplCopyWith(_$LoadMoreCommentsImpl value,
          $Res Function(_$LoadMoreCommentsImpl) then) =
      __$$LoadMoreCommentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String articleId});
}

/// @nodoc
class __$$LoadMoreCommentsImplCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$LoadMoreCommentsImpl>
    implements _$$LoadMoreCommentsImplCopyWith<$Res> {
  __$$LoadMoreCommentsImplCopyWithImpl(_$LoadMoreCommentsImpl _value,
      $Res Function(_$LoadMoreCommentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
  }) {
    return _then(_$LoadMoreCommentsImpl(
      null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadMoreCommentsImpl implements LoadMoreComments {
  const _$LoadMoreCommentsImpl(this.articleId);

  @override
  final String articleId;

  @override
  String toString() {
    return 'CommentsEvent.loadMoreComments(articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreCommentsImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articleId);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreCommentsImplCopyWith<_$LoadMoreCommentsImpl> get copyWith =>
      __$$LoadMoreCommentsImplCopyWithImpl<_$LoadMoreCommentsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String articleId) loadComments,
    required TResult Function(String articleId) loadMoreComments,
    required TResult Function(
            String articleId, String content, String? parentId)
        postComment,
    required TResult Function(String commentId, String content) editComment,
    required TResult Function(String articleId) refreshComments,
  }) {
    return loadMoreComments(articleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String articleId)? loadComments,
    TResult? Function(String articleId)? loadMoreComments,
    TResult? Function(String articleId, String content, String? parentId)?
        postComment,
    TResult? Function(String commentId, String content)? editComment,
    TResult? Function(String articleId)? refreshComments,
  }) {
    return loadMoreComments?.call(articleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String articleId)? loadComments,
    TResult Function(String articleId)? loadMoreComments,
    TResult Function(String articleId, String content, String? parentId)?
        postComment,
    TResult Function(String commentId, String content)? editComment,
    TResult Function(String articleId)? refreshComments,
    required TResult orElse(),
  }) {
    if (loadMoreComments != null) {
      return loadMoreComments(articleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(LoadMoreComments value) loadMoreComments,
    required TResult Function(PostComment value) postComment,
    required TResult Function(EditComment value) editComment,
    required TResult Function(RefreshComments value) refreshComments,
  }) {
    return loadMoreComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(LoadMoreComments value)? loadMoreComments,
    TResult? Function(PostComment value)? postComment,
    TResult? Function(EditComment value)? editComment,
    TResult? Function(RefreshComments value)? refreshComments,
  }) {
    return loadMoreComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(LoadMoreComments value)? loadMoreComments,
    TResult Function(PostComment value)? postComment,
    TResult Function(EditComment value)? editComment,
    TResult Function(RefreshComments value)? refreshComments,
    required TResult orElse(),
  }) {
    if (loadMoreComments != null) {
      return loadMoreComments(this);
    }
    return orElse();
  }
}

abstract class LoadMoreComments implements CommentsEvent {
  const factory LoadMoreComments(final String articleId) =
      _$LoadMoreCommentsImpl;

  String get articleId;

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMoreCommentsImplCopyWith<_$LoadMoreCommentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostCommentImplCopyWith<$Res> {
  factory _$$PostCommentImplCopyWith(
          _$PostCommentImpl value, $Res Function(_$PostCommentImpl) then) =
      __$$PostCommentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String articleId, String content, String? parentId});
}

/// @nodoc
class __$$PostCommentImplCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$PostCommentImpl>
    implements _$$PostCommentImplCopyWith<$Res> {
  __$$PostCommentImplCopyWithImpl(
      _$PostCommentImpl _value, $Res Function(_$PostCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
    Object? content = null,
    Object? parentId = freezed,
  }) {
    return _then(_$PostCommentImpl(
      articleId: null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PostCommentImpl implements PostComment {
  const _$PostCommentImpl(
      {required this.articleId, required this.content, this.parentId});

  @override
  final String articleId;
  @override
  final String content;
  @override
  final String? parentId;

  @override
  String toString() {
    return 'CommentsEvent.postComment(articleId: $articleId, content: $content, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCommentImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articleId, content, parentId);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCommentImplCopyWith<_$PostCommentImpl> get copyWith =>
      __$$PostCommentImplCopyWithImpl<_$PostCommentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String articleId) loadComments,
    required TResult Function(String articleId) loadMoreComments,
    required TResult Function(
            String articleId, String content, String? parentId)
        postComment,
    required TResult Function(String commentId, String content) editComment,
    required TResult Function(String articleId) refreshComments,
  }) {
    return postComment(articleId, content, parentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String articleId)? loadComments,
    TResult? Function(String articleId)? loadMoreComments,
    TResult? Function(String articleId, String content, String? parentId)?
        postComment,
    TResult? Function(String commentId, String content)? editComment,
    TResult? Function(String articleId)? refreshComments,
  }) {
    return postComment?.call(articleId, content, parentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String articleId)? loadComments,
    TResult Function(String articleId)? loadMoreComments,
    TResult Function(String articleId, String content, String? parentId)?
        postComment,
    TResult Function(String commentId, String content)? editComment,
    TResult Function(String articleId)? refreshComments,
    required TResult orElse(),
  }) {
    if (postComment != null) {
      return postComment(articleId, content, parentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(LoadMoreComments value) loadMoreComments,
    required TResult Function(PostComment value) postComment,
    required TResult Function(EditComment value) editComment,
    required TResult Function(RefreshComments value) refreshComments,
  }) {
    return postComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(LoadMoreComments value)? loadMoreComments,
    TResult? Function(PostComment value)? postComment,
    TResult? Function(EditComment value)? editComment,
    TResult? Function(RefreshComments value)? refreshComments,
  }) {
    return postComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(LoadMoreComments value)? loadMoreComments,
    TResult Function(PostComment value)? postComment,
    TResult Function(EditComment value)? editComment,
    TResult Function(RefreshComments value)? refreshComments,
    required TResult orElse(),
  }) {
    if (postComment != null) {
      return postComment(this);
    }
    return orElse();
  }
}

abstract class PostComment implements CommentsEvent {
  const factory PostComment(
      {required final String articleId,
      required final String content,
      final String? parentId}) = _$PostCommentImpl;

  String get articleId;
  String get content;
  String? get parentId;

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostCommentImplCopyWith<_$PostCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditCommentImplCopyWith<$Res> {
  factory _$$EditCommentImplCopyWith(
          _$EditCommentImpl value, $Res Function(_$EditCommentImpl) then) =
      __$$EditCommentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String commentId, String content});
}

/// @nodoc
class __$$EditCommentImplCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$EditCommentImpl>
    implements _$$EditCommentImplCopyWith<$Res> {
  __$$EditCommentImplCopyWithImpl(
      _$EditCommentImpl _value, $Res Function(_$EditCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? content = null,
  }) {
    return _then(_$EditCommentImpl(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditCommentImpl implements EditComment {
  const _$EditCommentImpl({required this.commentId, required this.content});

  @override
  final String commentId;
  @override
  final String content;

  @override
  String toString() {
    return 'CommentsEvent.editComment(commentId: $commentId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCommentImpl &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentId, content);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCommentImplCopyWith<_$EditCommentImpl> get copyWith =>
      __$$EditCommentImplCopyWithImpl<_$EditCommentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String articleId) loadComments,
    required TResult Function(String articleId) loadMoreComments,
    required TResult Function(
            String articleId, String content, String? parentId)
        postComment,
    required TResult Function(String commentId, String content) editComment,
    required TResult Function(String articleId) refreshComments,
  }) {
    return editComment(commentId, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String articleId)? loadComments,
    TResult? Function(String articleId)? loadMoreComments,
    TResult? Function(String articleId, String content, String? parentId)?
        postComment,
    TResult? Function(String commentId, String content)? editComment,
    TResult? Function(String articleId)? refreshComments,
  }) {
    return editComment?.call(commentId, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String articleId)? loadComments,
    TResult Function(String articleId)? loadMoreComments,
    TResult Function(String articleId, String content, String? parentId)?
        postComment,
    TResult Function(String commentId, String content)? editComment,
    TResult Function(String articleId)? refreshComments,
    required TResult orElse(),
  }) {
    if (editComment != null) {
      return editComment(commentId, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(LoadMoreComments value) loadMoreComments,
    required TResult Function(PostComment value) postComment,
    required TResult Function(EditComment value) editComment,
    required TResult Function(RefreshComments value) refreshComments,
  }) {
    return editComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(LoadMoreComments value)? loadMoreComments,
    TResult? Function(PostComment value)? postComment,
    TResult? Function(EditComment value)? editComment,
    TResult? Function(RefreshComments value)? refreshComments,
  }) {
    return editComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(LoadMoreComments value)? loadMoreComments,
    TResult Function(PostComment value)? postComment,
    TResult Function(EditComment value)? editComment,
    TResult Function(RefreshComments value)? refreshComments,
    required TResult orElse(),
  }) {
    if (editComment != null) {
      return editComment(this);
    }
    return orElse();
  }
}

abstract class EditComment implements CommentsEvent {
  const factory EditComment(
      {required final String commentId,
      required final String content}) = _$EditCommentImpl;

  String get commentId;
  String get content;

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditCommentImplCopyWith<_$EditCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshCommentsImplCopyWith<$Res> {
  factory _$$RefreshCommentsImplCopyWith(_$RefreshCommentsImpl value,
          $Res Function(_$RefreshCommentsImpl) then) =
      __$$RefreshCommentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String articleId});
}

/// @nodoc
class __$$RefreshCommentsImplCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$RefreshCommentsImpl>
    implements _$$RefreshCommentsImplCopyWith<$Res> {
  __$$RefreshCommentsImplCopyWithImpl(
      _$RefreshCommentsImpl _value, $Res Function(_$RefreshCommentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
  }) {
    return _then(_$RefreshCommentsImpl(
      null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshCommentsImpl implements RefreshComments {
  const _$RefreshCommentsImpl(this.articleId);

  @override
  final String articleId;

  @override
  String toString() {
    return 'CommentsEvent.refreshComments(articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshCommentsImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articleId);

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshCommentsImplCopyWith<_$RefreshCommentsImpl> get copyWith =>
      __$$RefreshCommentsImplCopyWithImpl<_$RefreshCommentsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String articleId) loadComments,
    required TResult Function(String articleId) loadMoreComments,
    required TResult Function(
            String articleId, String content, String? parentId)
        postComment,
    required TResult Function(String commentId, String content) editComment,
    required TResult Function(String articleId) refreshComments,
  }) {
    return refreshComments(articleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String articleId)? loadComments,
    TResult? Function(String articleId)? loadMoreComments,
    TResult? Function(String articleId, String content, String? parentId)?
        postComment,
    TResult? Function(String commentId, String content)? editComment,
    TResult? Function(String articleId)? refreshComments,
  }) {
    return refreshComments?.call(articleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String articleId)? loadComments,
    TResult Function(String articleId)? loadMoreComments,
    TResult Function(String articleId, String content, String? parentId)?
        postComment,
    TResult Function(String commentId, String content)? editComment,
    TResult Function(String articleId)? refreshComments,
    required TResult orElse(),
  }) {
    if (refreshComments != null) {
      return refreshComments(articleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadComments value) loadComments,
    required TResult Function(LoadMoreComments value) loadMoreComments,
    required TResult Function(PostComment value) postComment,
    required TResult Function(EditComment value) editComment,
    required TResult Function(RefreshComments value) refreshComments,
  }) {
    return refreshComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadComments value)? loadComments,
    TResult? Function(LoadMoreComments value)? loadMoreComments,
    TResult? Function(PostComment value)? postComment,
    TResult? Function(EditComment value)? editComment,
    TResult? Function(RefreshComments value)? refreshComments,
  }) {
    return refreshComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadComments value)? loadComments,
    TResult Function(LoadMoreComments value)? loadMoreComments,
    TResult Function(PostComment value)? postComment,
    TResult Function(EditComment value)? editComment,
    TResult Function(RefreshComments value)? refreshComments,
    required TResult orElse(),
  }) {
    if (refreshComments != null) {
      return refreshComments(this);
    }
    return orElse();
  }
}

abstract class RefreshComments implements CommentsEvent {
  const factory RefreshComments(final String articleId) = _$RefreshCommentsImpl;

  String get articleId;

  /// Create a copy of CommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshCommentsImplCopyWith<_$RefreshCommentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommentsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() posting,
    required TResult Function(CommentEntity comment) posted,
    required TResult Function() editing,
    required TResult Function(CommentEntity comment) edited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? posting,
    TResult? Function(CommentEntity comment)? posted,
    TResult? Function()? editing,
    TResult? Function(CommentEntity comment)? edited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? posting,
    TResult Function(CommentEntity comment)? posted,
    TResult Function()? editing,
    TResult Function(CommentEntity comment)? edited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Posting value) posting,
    required TResult Function(_Posted value) posted,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Edited value) edited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Posting value)? posting,
    TResult? Function(_Posted value)? posted,
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Edited value)? edited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Posting value)? posting,
    TResult Function(_Posted value)? posted,
    TResult Function(_Editing value)? editing,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res, CommentsState>;
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res, $Val extends CommentsState>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CommentsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() posting,
    required TResult Function(CommentEntity comment) posted,
    required TResult Function() editing,
    required TResult Function(CommentEntity comment) edited,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? posting,
    TResult? Function(CommentEntity comment)? posted,
    TResult? Function()? editing,
    TResult? Function(CommentEntity comment)? edited,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? posting,
    TResult Function(CommentEntity comment)? posted,
    TResult Function()? editing,
    TResult Function(CommentEntity comment)? edited,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Posting value) posting,
    required TResult Function(_Posted value) posted,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Edited value) edited,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Posting value)? posting,
    TResult? Function(_Posted value)? posted,
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Edited value)? edited,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Posting value)? posting,
    TResult Function(_Posted value)? posted,
    TResult Function(_Editing value)? editing,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CommentsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CommentsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() posting,
    required TResult Function(CommentEntity comment) posted,
    required TResult Function() editing,
    required TResult Function(CommentEntity comment) edited,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? posting,
    TResult? Function(CommentEntity comment)? posted,
    TResult? Function()? editing,
    TResult? Function(CommentEntity comment)? edited,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? posting,
    TResult Function(CommentEntity comment)? posted,
    TResult Function()? editing,
    TResult Function(CommentEntity comment)? edited,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Posting value) posting,
    required TResult Function(_Posted value) posted,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Edited value) edited,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Posting value)? posting,
    TResult? Function(_Posted value)? posted,
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Edited value)? edited,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Posting value)? posting,
    TResult Function(_Posted value)? posted,
    TResult Function(_Editing value)? editing,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CommentsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CommentEntity> comments, bool hasMore, int currentPage});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? hasMore = null,
    Object? currentPage = null,
  }) {
    return _then(_$LoadedImpl(
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<CommentEntity> comments,
      required this.hasMore,
      required this.currentPage})
      : _comments = comments;

  final List<CommentEntity> _comments;
  @override
  List<CommentEntity> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final bool hasMore;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'CommentsState.loaded(comments: $comments, hasMore: $hasMore, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_comments), hasMore, currentPage);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() posting,
    required TResult Function(CommentEntity comment) posted,
    required TResult Function() editing,
    required TResult Function(CommentEntity comment) edited,
  }) {
    return loaded(comments, hasMore, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? posting,
    TResult? Function(CommentEntity comment)? posted,
    TResult? Function()? editing,
    TResult? Function(CommentEntity comment)? edited,
  }) {
    return loaded?.call(comments, hasMore, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? posting,
    TResult Function(CommentEntity comment)? posted,
    TResult Function()? editing,
    TResult Function(CommentEntity comment)? edited,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(comments, hasMore, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Posting value) posting,
    required TResult Function(_Posted value) posted,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Edited value) edited,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Posting value)? posting,
    TResult? Function(_Posted value)? posted,
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Edited value)? edited,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Posting value)? posting,
    TResult Function(_Posted value)? posted,
    TResult Function(_Editing value)? editing,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CommentsState {
  const factory _Loaded(
      {required final List<CommentEntity> comments,
      required final bool hasMore,
      required final int currentPage}) = _$LoadedImpl;

  List<CommentEntity> get comments;
  bool get hasMore;
  int get currentPage;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CommentsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() posting,
    required TResult Function(CommentEntity comment) posted,
    required TResult Function() editing,
    required TResult Function(CommentEntity comment) edited,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? posting,
    TResult? Function(CommentEntity comment)? posted,
    TResult? Function()? editing,
    TResult? Function(CommentEntity comment)? edited,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? posting,
    TResult Function(CommentEntity comment)? posted,
    TResult Function()? editing,
    TResult Function(CommentEntity comment)? edited,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Posting value) posting,
    required TResult Function(_Posted value) posted,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Edited value) edited,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Posting value)? posting,
    TResult? Function(_Posted value)? posted,
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Edited value)? edited,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Posting value)? posting,
    TResult Function(_Posted value)? posted,
    TResult Function(_Editing value)? editing,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CommentsState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostingImplCopyWith<$Res> {
  factory _$$PostingImplCopyWith(
          _$PostingImpl value, $Res Function(_$PostingImpl) then) =
      __$$PostingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostingImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$PostingImpl>
    implements _$$PostingImplCopyWith<$Res> {
  __$$PostingImplCopyWithImpl(
      _$PostingImpl _value, $Res Function(_$PostingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostingImpl implements _Posting {
  const _$PostingImpl();

  @override
  String toString() {
    return 'CommentsState.posting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() posting,
    required TResult Function(CommentEntity comment) posted,
    required TResult Function() editing,
    required TResult Function(CommentEntity comment) edited,
  }) {
    return posting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? posting,
    TResult? Function(CommentEntity comment)? posted,
    TResult? Function()? editing,
    TResult? Function(CommentEntity comment)? edited,
  }) {
    return posting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? posting,
    TResult Function(CommentEntity comment)? posted,
    TResult Function()? editing,
    TResult Function(CommentEntity comment)? edited,
    required TResult orElse(),
  }) {
    if (posting != null) {
      return posting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Posting value) posting,
    required TResult Function(_Posted value) posted,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Edited value) edited,
  }) {
    return posting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Posting value)? posting,
    TResult? Function(_Posted value)? posted,
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Edited value)? edited,
  }) {
    return posting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Posting value)? posting,
    TResult Function(_Posted value)? posted,
    TResult Function(_Editing value)? editing,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (posting != null) {
      return posting(this);
    }
    return orElse();
  }
}

abstract class _Posting implements CommentsState {
  const factory _Posting() = _$PostingImpl;
}

/// @nodoc
abstract class _$$PostedImplCopyWith<$Res> {
  factory _$$PostedImplCopyWith(
          _$PostedImpl value, $Res Function(_$PostedImpl) then) =
      __$$PostedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommentEntity comment});
}

/// @nodoc
class __$$PostedImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$PostedImpl>
    implements _$$PostedImplCopyWith<$Res> {
  __$$PostedImplCopyWithImpl(
      _$PostedImpl _value, $Res Function(_$PostedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_$PostedImpl(
      null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentEntity,
    ));
  }
}

/// @nodoc

class _$PostedImpl implements _Posted {
  const _$PostedImpl(this.comment);

  @override
  final CommentEntity comment;

  @override
  String toString() {
    return 'CommentsState.posted(comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostedImpl &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostedImplCopyWith<_$PostedImpl> get copyWith =>
      __$$PostedImplCopyWithImpl<_$PostedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() posting,
    required TResult Function(CommentEntity comment) posted,
    required TResult Function() editing,
    required TResult Function(CommentEntity comment) edited,
  }) {
    return posted(comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? posting,
    TResult? Function(CommentEntity comment)? posted,
    TResult? Function()? editing,
    TResult? Function(CommentEntity comment)? edited,
  }) {
    return posted?.call(comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? posting,
    TResult Function(CommentEntity comment)? posted,
    TResult Function()? editing,
    TResult Function(CommentEntity comment)? edited,
    required TResult orElse(),
  }) {
    if (posted != null) {
      return posted(comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Posting value) posting,
    required TResult Function(_Posted value) posted,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Edited value) edited,
  }) {
    return posted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Posting value)? posting,
    TResult? Function(_Posted value)? posted,
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Edited value)? edited,
  }) {
    return posted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Posting value)? posting,
    TResult Function(_Posted value)? posted,
    TResult Function(_Editing value)? editing,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (posted != null) {
      return posted(this);
    }
    return orElse();
  }
}

abstract class _Posted implements CommentsState {
  const factory _Posted(final CommentEntity comment) = _$PostedImpl;

  CommentEntity get comment;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostedImplCopyWith<_$PostedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditingImplCopyWith<$Res> {
  factory _$$EditingImplCopyWith(
          _$EditingImpl value, $Res Function(_$EditingImpl) then) =
      __$$EditingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditingImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$EditingImpl>
    implements _$$EditingImplCopyWith<$Res> {
  __$$EditingImplCopyWithImpl(
      _$EditingImpl _value, $Res Function(_$EditingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EditingImpl implements _Editing {
  const _$EditingImpl();

  @override
  String toString() {
    return 'CommentsState.editing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() posting,
    required TResult Function(CommentEntity comment) posted,
    required TResult Function() editing,
    required TResult Function(CommentEntity comment) edited,
  }) {
    return editing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? posting,
    TResult? Function(CommentEntity comment)? posted,
    TResult? Function()? editing,
    TResult? Function(CommentEntity comment)? edited,
  }) {
    return editing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? posting,
    TResult Function(CommentEntity comment)? posted,
    TResult Function()? editing,
    TResult Function(CommentEntity comment)? edited,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Posting value) posting,
    required TResult Function(_Posted value) posted,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Edited value) edited,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Posting value)? posting,
    TResult? Function(_Posted value)? posted,
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Edited value)? edited,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Posting value)? posting,
    TResult Function(_Posted value)? posted,
    TResult Function(_Editing value)? editing,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class _Editing implements CommentsState {
  const factory _Editing() = _$EditingImpl;
}

/// @nodoc
abstract class _$$EditedImplCopyWith<$Res> {
  factory _$$EditedImplCopyWith(
          _$EditedImpl value, $Res Function(_$EditedImpl) then) =
      __$$EditedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommentEntity comment});
}

/// @nodoc
class __$$EditedImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$EditedImpl>
    implements _$$EditedImplCopyWith<$Res> {
  __$$EditedImplCopyWithImpl(
      _$EditedImpl _value, $Res Function(_$EditedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_$EditedImpl(
      null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentEntity,
    ));
  }
}

/// @nodoc

class _$EditedImpl implements _Edited {
  const _$EditedImpl(this.comment);

  @override
  final CommentEntity comment;

  @override
  String toString() {
    return 'CommentsState.edited(comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditedImpl &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditedImplCopyWith<_$EditedImpl> get copyWith =>
      __$$EditedImplCopyWithImpl<_$EditedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() posting,
    required TResult Function(CommentEntity comment) posted,
    required TResult Function() editing,
    required TResult Function(CommentEntity comment) edited,
  }) {
    return edited(comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? posting,
    TResult? Function(CommentEntity comment)? posted,
    TResult? Function()? editing,
    TResult? Function(CommentEntity comment)? edited,
  }) {
    return edited?.call(comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CommentEntity> comments, bool hasMore, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? posting,
    TResult Function(CommentEntity comment)? posted,
    TResult Function()? editing,
    TResult Function(CommentEntity comment)? edited,
    required TResult orElse(),
  }) {
    if (edited != null) {
      return edited(comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Posting value) posting,
    required TResult Function(_Posted value) posted,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Edited value) edited,
  }) {
    return edited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Posting value)? posting,
    TResult? Function(_Posted value)? posted,
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Edited value)? edited,
  }) {
    return edited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Posting value)? posting,
    TResult Function(_Posted value)? posted,
    TResult Function(_Editing value)? editing,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (edited != null) {
      return edited(this);
    }
    return orElse();
  }
}

abstract class _Edited implements CommentsState {
  const factory _Edited(final CommentEntity comment) = _$EditedImpl;

  CommentEntity get comment;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditedImplCopyWith<_$EditedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
