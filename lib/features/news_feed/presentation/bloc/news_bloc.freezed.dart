// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug)
        loadNews,
    required TResult Function(String? language, String? categorySlug)
        refreshNews,
    required TResult Function(String? language, String? categorySlug)
        loadMoreNews,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult? Function(String? language, String? categorySlug)? refreshNews,
    TResult? Function(String? language, String? categorySlug)? loadMoreNews,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult Function(String? language, String? categorySlug)? refreshNews,
    TResult Function(String? language, String? categorySlug)? loadMoreNews,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNews value) loadNews,
    required TResult Function(RefreshNews value) refreshNews,
    required TResult Function(LoadMoreNews value) loadMoreNews,
    required TResult Function(LikeArticle value) likeArticle,
    required TResult Function(BookmarkArticle value) bookmarkArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNews value)? loadNews,
    TResult? Function(RefreshNews value)? refreshNews,
    TResult? Function(LoadMoreNews value)? loadMoreNews,
    TResult? Function(LikeArticle value)? likeArticle,
    TResult? Function(BookmarkArticle value)? bookmarkArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNews value)? loadNews,
    TResult Function(RefreshNews value)? refreshNews,
    TResult Function(LoadMoreNews value)? loadMoreNews,
    TResult Function(LikeArticle value)? likeArticle,
    TResult Function(BookmarkArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEventCopyWith<$Res> {
  factory $NewsEventCopyWith(NewsEvent value, $Res Function(NewsEvent) then) =
      _$NewsEventCopyWithImpl<$Res, NewsEvent>;
}

/// @nodoc
class _$NewsEventCopyWithImpl<$Res, $Val extends NewsEvent>
    implements $NewsEventCopyWith<$Res> {
  _$NewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadNewsImplCopyWith<$Res> {
  factory _$$LoadNewsImplCopyWith(
          _$LoadNewsImpl value, $Res Function(_$LoadNewsImpl) then) =
      __$$LoadNewsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? page, String? language, String? categorySlug});
}

/// @nodoc
class __$$LoadNewsImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$LoadNewsImpl>
    implements _$$LoadNewsImplCopyWith<$Res> {
  __$$LoadNewsImplCopyWithImpl(
      _$LoadNewsImpl _value, $Res Function(_$LoadNewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? language = freezed,
    Object? categorySlug = freezed,
  }) {
    return _then(_$LoadNewsImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      categorySlug: freezed == categorySlug
          ? _value.categorySlug
          : categorySlug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadNewsImpl implements LoadNews {
  const _$LoadNewsImpl({this.page, this.language, this.categorySlug});

  @override
  final int? page;
  @override
  final String? language;
  @override
  final String? categorySlug;

  @override
  String toString() {
    return 'NewsEvent.loadNews(page: $page, language: $language, categorySlug: $categorySlug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadNewsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, language, categorySlug);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadNewsImplCopyWith<_$LoadNewsImpl> get copyWith =>
      __$$LoadNewsImplCopyWithImpl<_$LoadNewsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug)
        loadNews,
    required TResult Function(String? language, String? categorySlug)
        refreshNews,
    required TResult Function(String? language, String? categorySlug)
        loadMoreNews,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return loadNews(page, language, categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult? Function(String? language, String? categorySlug)? refreshNews,
    TResult? Function(String? language, String? categorySlug)? loadMoreNews,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return loadNews?.call(page, language, categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult Function(String? language, String? categorySlug)? refreshNews,
    TResult Function(String? language, String? categorySlug)? loadMoreNews,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (loadNews != null) {
      return loadNews(page, language, categorySlug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNews value) loadNews,
    required TResult Function(RefreshNews value) refreshNews,
    required TResult Function(LoadMoreNews value) loadMoreNews,
    required TResult Function(LikeArticle value) likeArticle,
    required TResult Function(BookmarkArticle value) bookmarkArticle,
  }) {
    return loadNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNews value)? loadNews,
    TResult? Function(RefreshNews value)? refreshNews,
    TResult? Function(LoadMoreNews value)? loadMoreNews,
    TResult? Function(LikeArticle value)? likeArticle,
    TResult? Function(BookmarkArticle value)? bookmarkArticle,
  }) {
    return loadNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNews value)? loadNews,
    TResult Function(RefreshNews value)? refreshNews,
    TResult Function(LoadMoreNews value)? loadMoreNews,
    TResult Function(LikeArticle value)? likeArticle,
    TResult Function(BookmarkArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (loadNews != null) {
      return loadNews(this);
    }
    return orElse();
  }
}

abstract class LoadNews implements NewsEvent {
  const factory LoadNews(
      {final int? page,
      final String? language,
      final String? categorySlug}) = _$LoadNewsImpl;

  int? get page;
  String? get language;
  String? get categorySlug;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadNewsImplCopyWith<_$LoadNewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshNewsImplCopyWith<$Res> {
  factory _$$RefreshNewsImplCopyWith(
          _$RefreshNewsImpl value, $Res Function(_$RefreshNewsImpl) then) =
      __$$RefreshNewsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? language, String? categorySlug});
}

/// @nodoc
class __$$RefreshNewsImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$RefreshNewsImpl>
    implements _$$RefreshNewsImplCopyWith<$Res> {
  __$$RefreshNewsImplCopyWithImpl(
      _$RefreshNewsImpl _value, $Res Function(_$RefreshNewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
    Object? categorySlug = freezed,
  }) {
    return _then(_$RefreshNewsImpl(
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      categorySlug: freezed == categorySlug
          ? _value.categorySlug
          : categorySlug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RefreshNewsImpl implements RefreshNews {
  const _$RefreshNewsImpl({this.language, this.categorySlug});

  @override
  final String? language;
  @override
  final String? categorySlug;

  @override
  String toString() {
    return 'NewsEvent.refreshNews(language: $language, categorySlug: $categorySlug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshNewsImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language, categorySlug);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshNewsImplCopyWith<_$RefreshNewsImpl> get copyWith =>
      __$$RefreshNewsImplCopyWithImpl<_$RefreshNewsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug)
        loadNews,
    required TResult Function(String? language, String? categorySlug)
        refreshNews,
    required TResult Function(String? language, String? categorySlug)
        loadMoreNews,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return refreshNews(language, categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult? Function(String? language, String? categorySlug)? refreshNews,
    TResult? Function(String? language, String? categorySlug)? loadMoreNews,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return refreshNews?.call(language, categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult Function(String? language, String? categorySlug)? refreshNews,
    TResult Function(String? language, String? categorySlug)? loadMoreNews,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (refreshNews != null) {
      return refreshNews(language, categorySlug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNews value) loadNews,
    required TResult Function(RefreshNews value) refreshNews,
    required TResult Function(LoadMoreNews value) loadMoreNews,
    required TResult Function(LikeArticle value) likeArticle,
    required TResult Function(BookmarkArticle value) bookmarkArticle,
  }) {
    return refreshNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNews value)? loadNews,
    TResult? Function(RefreshNews value)? refreshNews,
    TResult? Function(LoadMoreNews value)? loadMoreNews,
    TResult? Function(LikeArticle value)? likeArticle,
    TResult? Function(BookmarkArticle value)? bookmarkArticle,
  }) {
    return refreshNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNews value)? loadNews,
    TResult Function(RefreshNews value)? refreshNews,
    TResult Function(LoadMoreNews value)? loadMoreNews,
    TResult Function(LikeArticle value)? likeArticle,
    TResult Function(BookmarkArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (refreshNews != null) {
      return refreshNews(this);
    }
    return orElse();
  }
}

abstract class RefreshNews implements NewsEvent {
  const factory RefreshNews(
      {final String? language, final String? categorySlug}) = _$RefreshNewsImpl;

  String? get language;
  String? get categorySlug;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshNewsImplCopyWith<_$RefreshNewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreNewsImplCopyWith<$Res> {
  factory _$$LoadMoreNewsImplCopyWith(
          _$LoadMoreNewsImpl value, $Res Function(_$LoadMoreNewsImpl) then) =
      __$$LoadMoreNewsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? language, String? categorySlug});
}

/// @nodoc
class __$$LoadMoreNewsImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$LoadMoreNewsImpl>
    implements _$$LoadMoreNewsImplCopyWith<$Res> {
  __$$LoadMoreNewsImplCopyWithImpl(
      _$LoadMoreNewsImpl _value, $Res Function(_$LoadMoreNewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
    Object? categorySlug = freezed,
  }) {
    return _then(_$LoadMoreNewsImpl(
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      categorySlug: freezed == categorySlug
          ? _value.categorySlug
          : categorySlug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadMoreNewsImpl implements LoadMoreNews {
  const _$LoadMoreNewsImpl({this.language, this.categorySlug});

  @override
  final String? language;
  @override
  final String? categorySlug;

  @override
  String toString() {
    return 'NewsEvent.loadMoreNews(language: $language, categorySlug: $categorySlug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreNewsImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language, categorySlug);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreNewsImplCopyWith<_$LoadMoreNewsImpl> get copyWith =>
      __$$LoadMoreNewsImplCopyWithImpl<_$LoadMoreNewsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug)
        loadNews,
    required TResult Function(String? language, String? categorySlug)
        refreshNews,
    required TResult Function(String? language, String? categorySlug)
        loadMoreNews,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return loadMoreNews(language, categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult? Function(String? language, String? categorySlug)? refreshNews,
    TResult? Function(String? language, String? categorySlug)? loadMoreNews,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return loadMoreNews?.call(language, categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult Function(String? language, String? categorySlug)? refreshNews,
    TResult Function(String? language, String? categorySlug)? loadMoreNews,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (loadMoreNews != null) {
      return loadMoreNews(language, categorySlug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNews value) loadNews,
    required TResult Function(RefreshNews value) refreshNews,
    required TResult Function(LoadMoreNews value) loadMoreNews,
    required TResult Function(LikeArticle value) likeArticle,
    required TResult Function(BookmarkArticle value) bookmarkArticle,
  }) {
    return loadMoreNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNews value)? loadNews,
    TResult? Function(RefreshNews value)? refreshNews,
    TResult? Function(LoadMoreNews value)? loadMoreNews,
    TResult? Function(LikeArticle value)? likeArticle,
    TResult? Function(BookmarkArticle value)? bookmarkArticle,
  }) {
    return loadMoreNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNews value)? loadNews,
    TResult Function(RefreshNews value)? refreshNews,
    TResult Function(LoadMoreNews value)? loadMoreNews,
    TResult Function(LikeArticle value)? likeArticle,
    TResult Function(BookmarkArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (loadMoreNews != null) {
      return loadMoreNews(this);
    }
    return orElse();
  }
}

abstract class LoadMoreNews implements NewsEvent {
  const factory LoadMoreNews(
      {final String? language,
      final String? categorySlug}) = _$LoadMoreNewsImpl;

  String? get language;
  String? get categorySlug;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMoreNewsImplCopyWith<_$LoadMoreNewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikeArticleImplCopyWith<$Res> {
  factory _$$LikeArticleImplCopyWith(
          _$LikeArticleImpl value, $Res Function(_$LikeArticleImpl) then) =
      __$$LikeArticleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String articleId});
}

/// @nodoc
class __$$LikeArticleImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$LikeArticleImpl>
    implements _$$LikeArticleImplCopyWith<$Res> {
  __$$LikeArticleImplCopyWithImpl(
      _$LikeArticleImpl _value, $Res Function(_$LikeArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
  }) {
    return _then(_$LikeArticleImpl(
      null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LikeArticleImpl implements LikeArticle {
  const _$LikeArticleImpl(this.articleId);

  @override
  final String articleId;

  @override
  String toString() {
    return 'NewsEvent.likeArticle(articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeArticleImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articleId);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeArticleImplCopyWith<_$LikeArticleImpl> get copyWith =>
      __$$LikeArticleImplCopyWithImpl<_$LikeArticleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug)
        loadNews,
    required TResult Function(String? language, String? categorySlug)
        refreshNews,
    required TResult Function(String? language, String? categorySlug)
        loadMoreNews,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return likeArticle(articleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult? Function(String? language, String? categorySlug)? refreshNews,
    TResult? Function(String? language, String? categorySlug)? loadMoreNews,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return likeArticle?.call(articleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult Function(String? language, String? categorySlug)? refreshNews,
    TResult Function(String? language, String? categorySlug)? loadMoreNews,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (likeArticle != null) {
      return likeArticle(articleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNews value) loadNews,
    required TResult Function(RefreshNews value) refreshNews,
    required TResult Function(LoadMoreNews value) loadMoreNews,
    required TResult Function(LikeArticle value) likeArticle,
    required TResult Function(BookmarkArticle value) bookmarkArticle,
  }) {
    return likeArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNews value)? loadNews,
    TResult? Function(RefreshNews value)? refreshNews,
    TResult? Function(LoadMoreNews value)? loadMoreNews,
    TResult? Function(LikeArticle value)? likeArticle,
    TResult? Function(BookmarkArticle value)? bookmarkArticle,
  }) {
    return likeArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNews value)? loadNews,
    TResult Function(RefreshNews value)? refreshNews,
    TResult Function(LoadMoreNews value)? loadMoreNews,
    TResult Function(LikeArticle value)? likeArticle,
    TResult Function(BookmarkArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (likeArticle != null) {
      return likeArticle(this);
    }
    return orElse();
  }
}

abstract class LikeArticle implements NewsEvent {
  const factory LikeArticle(final String articleId) = _$LikeArticleImpl;

  String get articleId;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeArticleImplCopyWith<_$LikeArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookmarkArticleImplCopyWith<$Res> {
  factory _$$BookmarkArticleImplCopyWith(_$BookmarkArticleImpl value,
          $Res Function(_$BookmarkArticleImpl) then) =
      __$$BookmarkArticleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String articleId});
}

/// @nodoc
class __$$BookmarkArticleImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$BookmarkArticleImpl>
    implements _$$BookmarkArticleImplCopyWith<$Res> {
  __$$BookmarkArticleImplCopyWithImpl(
      _$BookmarkArticleImpl _value, $Res Function(_$BookmarkArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
  }) {
    return _then(_$BookmarkArticleImpl(
      null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BookmarkArticleImpl implements BookmarkArticle {
  const _$BookmarkArticleImpl(this.articleId);

  @override
  final String articleId;

  @override
  String toString() {
    return 'NewsEvent.bookmarkArticle(articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkArticleImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articleId);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkArticleImplCopyWith<_$BookmarkArticleImpl> get copyWith =>
      __$$BookmarkArticleImplCopyWithImpl<_$BookmarkArticleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug)
        loadNews,
    required TResult Function(String? language, String? categorySlug)
        refreshNews,
    required TResult Function(String? language, String? categorySlug)
        loadMoreNews,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return bookmarkArticle(articleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult? Function(String? language, String? categorySlug)? refreshNews,
    TResult? Function(String? language, String? categorySlug)? loadMoreNews,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return bookmarkArticle?.call(articleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug)?
        loadNews,
    TResult Function(String? language, String? categorySlug)? refreshNews,
    TResult Function(String? language, String? categorySlug)? loadMoreNews,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (bookmarkArticle != null) {
      return bookmarkArticle(articleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNews value) loadNews,
    required TResult Function(RefreshNews value) refreshNews,
    required TResult Function(LoadMoreNews value) loadMoreNews,
    required TResult Function(LikeArticle value) likeArticle,
    required TResult Function(BookmarkArticle value) bookmarkArticle,
  }) {
    return bookmarkArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNews value)? loadNews,
    TResult? Function(RefreshNews value)? refreshNews,
    TResult? Function(LoadMoreNews value)? loadMoreNews,
    TResult? Function(LikeArticle value)? likeArticle,
    TResult? Function(BookmarkArticle value)? bookmarkArticle,
  }) {
    return bookmarkArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNews value)? loadNews,
    TResult Function(RefreshNews value)? refreshNews,
    TResult Function(LoadMoreNews value)? loadMoreNews,
    TResult Function(LikeArticle value)? likeArticle,
    TResult Function(BookmarkArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (bookmarkArticle != null) {
      return bookmarkArticle(this);
    }
    return orElse();
  }
}

abstract class BookmarkArticle implements NewsEvent {
  const factory BookmarkArticle(final String articleId) = _$BookmarkArticleImpl;

  String get articleId;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkArticleImplCopyWith<_$BookmarkArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() actionLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? actionLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? actionLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(ActionLoading value) actionLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(ActionLoading value)? actionLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(ActionLoading value)? actionLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsState
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
    extends _$NewsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NewsState.initial()';
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
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() actionLoading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? actionLoading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? actionLoading,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(ActionLoading value) actionLoading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(ActionLoading value)? actionLoading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(ActionLoading value)? actionLoading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements NewsState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'NewsState.loading()';
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
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() actionLoading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? actionLoading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? actionLoading,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(ActionLoading value) actionLoading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(ActionLoading value)? actionLoading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(ActionLoading value)? actionLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements NewsState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ArticleModel> articles,
      bool hasMoreData,
      int currentPage,
      String? nextPageUrl,
      String? currentLanguage,
      String? currentCategorySlug});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? hasMoreData = null,
    Object? currentPage = null,
    Object? nextPageUrl = freezed,
    Object? currentLanguage = freezed,
    Object? currentCategorySlug = freezed,
  }) {
    return _then(_$LoadedImpl(
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleModel>,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLanguage: freezed == currentLanguage
          ? _value.currentLanguage
          : currentLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentCategorySlug: freezed == currentCategorySlug
          ? _value.currentCategorySlug
          : currentCategorySlug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(
      {required final List<ArticleModel> articles,
      required this.hasMoreData,
      required this.currentPage,
      this.nextPageUrl,
      this.currentLanguage,
      this.currentCategorySlug})
      : _articles = articles;

  final List<ArticleModel> _articles;
  @override
  List<ArticleModel> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  final bool hasMoreData;
  @override
  final int currentPage;
  @override
  final String? nextPageUrl;
  @override
  final String? currentLanguage;
  @override
  final String? currentCategorySlug;

  @override
  String toString() {
    return 'NewsState.loaded(articles: $articles, hasMoreData: $hasMoreData, currentPage: $currentPage, nextPageUrl: $nextPageUrl, currentLanguage: $currentLanguage, currentCategorySlug: $currentCategorySlug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl) &&
            (identical(other.currentLanguage, currentLanguage) ||
                other.currentLanguage == currentLanguage) &&
            (identical(other.currentCategorySlug, currentCategorySlug) ||
                other.currentCategorySlug == currentCategorySlug));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_articles),
      hasMoreData,
      currentPage,
      nextPageUrl,
      currentLanguage,
      currentCategorySlug);

  /// Create a copy of NewsState
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
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() actionLoading,
  }) {
    return loaded(articles, hasMoreData, currentPage, nextPageUrl,
        currentLanguage, currentCategorySlug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? actionLoading,
  }) {
    return loaded?.call(articles, hasMoreData, currentPage, nextPageUrl,
        currentLanguage, currentCategorySlug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? actionLoading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(articles, hasMoreData, currentPage, nextPageUrl,
          currentLanguage, currentCategorySlug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(ActionLoading value) actionLoading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(ActionLoading value)? actionLoading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(ActionLoading value)? actionLoading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements NewsState {
  const factory Loaded(
      {required final List<ArticleModel> articles,
      required final bool hasMoreData,
      required final int currentPage,
      final String? nextPageUrl,
      final String? currentLanguage,
      final String? currentCategorySlug}) = _$LoadedImpl;

  List<ArticleModel> get articles;
  bool get hasMoreData;
  int get currentPage;
  String? get nextPageUrl;
  String? get currentLanguage;
  String? get currentCategorySlug;

  /// Create a copy of NewsState
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
    extends _$NewsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsState
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

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NewsState.error(message: $message)';
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

  /// Create a copy of NewsState
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
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() actionLoading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? actionLoading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? actionLoading,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(ActionLoading value) actionLoading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(ActionLoading value)? actionLoading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(ActionLoading value)? actionLoading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements NewsState {
  const factory Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActionLoadingImplCopyWith<$Res> {
  factory _$$ActionLoadingImplCopyWith(
          _$ActionLoadingImpl value, $Res Function(_$ActionLoadingImpl) then) =
      __$$ActionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActionLoadingImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$ActionLoadingImpl>
    implements _$$ActionLoadingImplCopyWith<$Res> {
  __$$ActionLoadingImplCopyWithImpl(
      _$ActionLoadingImpl _value, $Res Function(_$ActionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActionLoadingImpl implements ActionLoading {
  const _$ActionLoadingImpl();

  @override
  String toString() {
    return 'NewsState.actionLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ActionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() actionLoading,
  }) {
    return actionLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? actionLoading,
  }) {
    return actionLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ArticleModel> articles,
            bool hasMoreData,
            int currentPage,
            String? nextPageUrl,
            String? currentLanguage,
            String? currentCategorySlug)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? actionLoading,
    required TResult orElse(),
  }) {
    if (actionLoading != null) {
      return actionLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(ActionLoading value) actionLoading,
  }) {
    return actionLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(ActionLoading value)? actionLoading,
  }) {
    return actionLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(ActionLoading value)? actionLoading,
    required TResult orElse(),
  }) {
    if (actionLoading != null) {
      return actionLoading(this);
    }
    return orElse();
  }
}

abstract class ActionLoading implements NewsState {
  const factory ActionLoading() = _$ActionLoadingImpl;
}
