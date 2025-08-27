// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrendingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        refreshTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadMoreTrending,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTrending value) loadTrending,
    required TResult Function(RefreshTrending value) refreshTrending,
    required TResult Function(LoadMoreTrending value) loadMoreTrending,
    required TResult Function(LikeTrendingArticle value) likeArticle,
    required TResult Function(BookmarkTrendingArticle value) bookmarkArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrending value)? loadTrending,
    TResult? Function(RefreshTrending value)? refreshTrending,
    TResult? Function(LoadMoreTrending value)? loadMoreTrending,
    TResult? Function(LikeTrendingArticle value)? likeArticle,
    TResult? Function(BookmarkTrendingArticle value)? bookmarkArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrending value)? loadTrending,
    TResult Function(RefreshTrending value)? refreshTrending,
    TResult Function(LoadMoreTrending value)? loadMoreTrending,
    TResult Function(LikeTrendingArticle value)? likeArticle,
    TResult Function(BookmarkTrendingArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingEventCopyWith<$Res> {
  factory $TrendingEventCopyWith(
          TrendingEvent value, $Res Function(TrendingEvent) then) =
      _$TrendingEventCopyWithImpl<$Res, TrendingEvent>;
}

/// @nodoc
class _$TrendingEventCopyWithImpl<$Res, $Val extends TrendingEvent>
    implements $TrendingEventCopyWith<$Res> {
  _$TrendingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadTrendingImplCopyWith<$Res> {
  factory _$$LoadTrendingImplCopyWith(
          _$LoadTrendingImpl value, $Res Function(_$LoadTrendingImpl) then) =
      __$$LoadTrendingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int? page,
      String? language,
      String? categorySlug,
      String? search,
      String? ordering,
      int? size});
}

/// @nodoc
class __$$LoadTrendingImplCopyWithImpl<$Res>
    extends _$TrendingEventCopyWithImpl<$Res, _$LoadTrendingImpl>
    implements _$$LoadTrendingImplCopyWith<$Res> {
  __$$LoadTrendingImplCopyWithImpl(
      _$LoadTrendingImpl _value, $Res Function(_$LoadTrendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? language = freezed,
    Object? categorySlug = freezed,
    Object? search = freezed,
    Object? ordering = freezed,
    Object? size = freezed,
  }) {
    return _then(_$LoadTrendingImpl(
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
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      ordering: freezed == ordering
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadTrendingImpl implements LoadTrending {
  const _$LoadTrendingImpl(
      {this.page,
      this.language,
      this.categorySlug,
      this.search,
      this.ordering,
      this.size});

  @override
  final int? page;
  @override
  final String? language;
  @override
  final String? categorySlug;
  @override
  final String? search;
  @override
  final String? ordering;
  @override
  final int? size;

  @override
  String toString() {
    return 'TrendingEvent.loadTrending(page: $page, language: $language, categorySlug: $categorySlug, search: $search, ordering: $ordering, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTrendingImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.ordering, ordering) ||
                other.ordering == ordering) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, page, language, categorySlug, search, ordering, size);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTrendingImplCopyWith<_$LoadTrendingImpl> get copyWith =>
      __$$LoadTrendingImplCopyWithImpl<_$LoadTrendingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        refreshTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadMoreTrending,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return loadTrending(page, language, categorySlug, search, ordering, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return loadTrending?.call(
        page, language, categorySlug, search, ordering, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (loadTrending != null) {
      return loadTrending(page, language, categorySlug, search, ordering, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTrending value) loadTrending,
    required TResult Function(RefreshTrending value) refreshTrending,
    required TResult Function(LoadMoreTrending value) loadMoreTrending,
    required TResult Function(LikeTrendingArticle value) likeArticle,
    required TResult Function(BookmarkTrendingArticle value) bookmarkArticle,
  }) {
    return loadTrending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrending value)? loadTrending,
    TResult? Function(RefreshTrending value)? refreshTrending,
    TResult? Function(LoadMoreTrending value)? loadMoreTrending,
    TResult? Function(LikeTrendingArticle value)? likeArticle,
    TResult? Function(BookmarkTrendingArticle value)? bookmarkArticle,
  }) {
    return loadTrending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrending value)? loadTrending,
    TResult Function(RefreshTrending value)? refreshTrending,
    TResult Function(LoadMoreTrending value)? loadMoreTrending,
    TResult Function(LikeTrendingArticle value)? likeArticle,
    TResult Function(BookmarkTrendingArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (loadTrending != null) {
      return loadTrending(this);
    }
    return orElse();
  }
}

abstract class LoadTrending implements TrendingEvent {
  const factory LoadTrending(
      {final int? page,
      final String? language,
      final String? categorySlug,
      final String? search,
      final String? ordering,
      final int? size}) = _$LoadTrendingImpl;

  int? get page;
  String? get language;
  String? get categorySlug;
  String? get search;
  String? get ordering;
  int? get size;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadTrendingImplCopyWith<_$LoadTrendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshTrendingImplCopyWith<$Res> {
  factory _$$RefreshTrendingImplCopyWith(_$RefreshTrendingImpl value,
          $Res Function(_$RefreshTrendingImpl) then) =
      __$$RefreshTrendingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? language,
      String? categorySlug,
      String? search,
      String? ordering,
      int? size});
}

/// @nodoc
class __$$RefreshTrendingImplCopyWithImpl<$Res>
    extends _$TrendingEventCopyWithImpl<$Res, _$RefreshTrendingImpl>
    implements _$$RefreshTrendingImplCopyWith<$Res> {
  __$$RefreshTrendingImplCopyWithImpl(
      _$RefreshTrendingImpl _value, $Res Function(_$RefreshTrendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
    Object? categorySlug = freezed,
    Object? search = freezed,
    Object? ordering = freezed,
    Object? size = freezed,
  }) {
    return _then(_$RefreshTrendingImpl(
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      categorySlug: freezed == categorySlug
          ? _value.categorySlug
          : categorySlug // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      ordering: freezed == ordering
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RefreshTrendingImpl implements RefreshTrending {
  const _$RefreshTrendingImpl(
      {this.language,
      this.categorySlug,
      this.search,
      this.ordering,
      this.size});

  @override
  final String? language;
  @override
  final String? categorySlug;
  @override
  final String? search;
  @override
  final String? ordering;
  @override
  final int? size;

  @override
  String toString() {
    return 'TrendingEvent.refreshTrending(language: $language, categorySlug: $categorySlug, search: $search, ordering: $ordering, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTrendingImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.ordering, ordering) ||
                other.ordering == ordering) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, language, categorySlug, search, ordering, size);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTrendingImplCopyWith<_$RefreshTrendingImpl> get copyWith =>
      __$$RefreshTrendingImplCopyWithImpl<_$RefreshTrendingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        refreshTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadMoreTrending,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return refreshTrending(language, categorySlug, search, ordering, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return refreshTrending?.call(
        language, categorySlug, search, ordering, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (refreshTrending != null) {
      return refreshTrending(language, categorySlug, search, ordering, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTrending value) loadTrending,
    required TResult Function(RefreshTrending value) refreshTrending,
    required TResult Function(LoadMoreTrending value) loadMoreTrending,
    required TResult Function(LikeTrendingArticle value) likeArticle,
    required TResult Function(BookmarkTrendingArticle value) bookmarkArticle,
  }) {
    return refreshTrending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrending value)? loadTrending,
    TResult? Function(RefreshTrending value)? refreshTrending,
    TResult? Function(LoadMoreTrending value)? loadMoreTrending,
    TResult? Function(LikeTrendingArticle value)? likeArticle,
    TResult? Function(BookmarkTrendingArticle value)? bookmarkArticle,
  }) {
    return refreshTrending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrending value)? loadTrending,
    TResult Function(RefreshTrending value)? refreshTrending,
    TResult Function(LoadMoreTrending value)? loadMoreTrending,
    TResult Function(LikeTrendingArticle value)? likeArticle,
    TResult Function(BookmarkTrendingArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (refreshTrending != null) {
      return refreshTrending(this);
    }
    return orElse();
  }
}

abstract class RefreshTrending implements TrendingEvent {
  const factory RefreshTrending(
      {final String? language,
      final String? categorySlug,
      final String? search,
      final String? ordering,
      final int? size}) = _$RefreshTrendingImpl;

  String? get language;
  String? get categorySlug;
  String? get search;
  String? get ordering;
  int? get size;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTrendingImplCopyWith<_$RefreshTrendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreTrendingImplCopyWith<$Res> {
  factory _$$LoadMoreTrendingImplCopyWith(_$LoadMoreTrendingImpl value,
          $Res Function(_$LoadMoreTrendingImpl) then) =
      __$$LoadMoreTrendingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? language,
      String? categorySlug,
      String? search,
      String? ordering,
      int? size});
}

/// @nodoc
class __$$LoadMoreTrendingImplCopyWithImpl<$Res>
    extends _$TrendingEventCopyWithImpl<$Res, _$LoadMoreTrendingImpl>
    implements _$$LoadMoreTrendingImplCopyWith<$Res> {
  __$$LoadMoreTrendingImplCopyWithImpl(_$LoadMoreTrendingImpl _value,
      $Res Function(_$LoadMoreTrendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
    Object? categorySlug = freezed,
    Object? search = freezed,
    Object? ordering = freezed,
    Object? size = freezed,
  }) {
    return _then(_$LoadMoreTrendingImpl(
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      categorySlug: freezed == categorySlug
          ? _value.categorySlug
          : categorySlug // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      ordering: freezed == ordering
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadMoreTrendingImpl implements LoadMoreTrending {
  const _$LoadMoreTrendingImpl(
      {this.language,
      this.categorySlug,
      this.search,
      this.ordering,
      this.size});

  @override
  final String? language;
  @override
  final String? categorySlug;
  @override
  final String? search;
  @override
  final String? ordering;
  @override
  final int? size;

  @override
  String toString() {
    return 'TrendingEvent.loadMoreTrending(language: $language, categorySlug: $categorySlug, search: $search, ordering: $ordering, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreTrendingImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.ordering, ordering) ||
                other.ordering == ordering) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, language, categorySlug, search, ordering, size);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreTrendingImplCopyWith<_$LoadMoreTrendingImpl> get copyWith =>
      __$$LoadMoreTrendingImplCopyWithImpl<_$LoadMoreTrendingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        refreshTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadMoreTrending,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return loadMoreTrending(language, categorySlug, search, ordering, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return loadMoreTrending?.call(
        language, categorySlug, search, ordering, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult Function(String articleId)? likeArticle,
    TResult Function(String articleId)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (loadMoreTrending != null) {
      return loadMoreTrending(language, categorySlug, search, ordering, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTrending value) loadTrending,
    required TResult Function(RefreshTrending value) refreshTrending,
    required TResult Function(LoadMoreTrending value) loadMoreTrending,
    required TResult Function(LikeTrendingArticle value) likeArticle,
    required TResult Function(BookmarkTrendingArticle value) bookmarkArticle,
  }) {
    return loadMoreTrending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrending value)? loadTrending,
    TResult? Function(RefreshTrending value)? refreshTrending,
    TResult? Function(LoadMoreTrending value)? loadMoreTrending,
    TResult? Function(LikeTrendingArticle value)? likeArticle,
    TResult? Function(BookmarkTrendingArticle value)? bookmarkArticle,
  }) {
    return loadMoreTrending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrending value)? loadTrending,
    TResult Function(RefreshTrending value)? refreshTrending,
    TResult Function(LoadMoreTrending value)? loadMoreTrending,
    TResult Function(LikeTrendingArticle value)? likeArticle,
    TResult Function(BookmarkTrendingArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (loadMoreTrending != null) {
      return loadMoreTrending(this);
    }
    return orElse();
  }
}

abstract class LoadMoreTrending implements TrendingEvent {
  const factory LoadMoreTrending(
      {final String? language,
      final String? categorySlug,
      final String? search,
      final String? ordering,
      final int? size}) = _$LoadMoreTrendingImpl;

  String? get language;
  String? get categorySlug;
  String? get search;
  String? get ordering;
  int? get size;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMoreTrendingImplCopyWith<_$LoadMoreTrendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikeTrendingArticleImplCopyWith<$Res> {
  factory _$$LikeTrendingArticleImplCopyWith(_$LikeTrendingArticleImpl value,
          $Res Function(_$LikeTrendingArticleImpl) then) =
      __$$LikeTrendingArticleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String articleId});
}

/// @nodoc
class __$$LikeTrendingArticleImplCopyWithImpl<$Res>
    extends _$TrendingEventCopyWithImpl<$Res, _$LikeTrendingArticleImpl>
    implements _$$LikeTrendingArticleImplCopyWith<$Res> {
  __$$LikeTrendingArticleImplCopyWithImpl(_$LikeTrendingArticleImpl _value,
      $Res Function(_$LikeTrendingArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
  }) {
    return _then(_$LikeTrendingArticleImpl(
      null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LikeTrendingArticleImpl implements LikeTrendingArticle {
  const _$LikeTrendingArticleImpl(this.articleId);

  @override
  final String articleId;

  @override
  String toString() {
    return 'TrendingEvent.likeArticle(articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeTrendingArticleImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articleId);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeTrendingArticleImplCopyWith<_$LikeTrendingArticleImpl> get copyWith =>
      __$$LikeTrendingArticleImplCopyWithImpl<_$LikeTrendingArticleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        refreshTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadMoreTrending,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return likeArticle(articleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return likeArticle?.call(articleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
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
    required TResult Function(LoadTrending value) loadTrending,
    required TResult Function(RefreshTrending value) refreshTrending,
    required TResult Function(LoadMoreTrending value) loadMoreTrending,
    required TResult Function(LikeTrendingArticle value) likeArticle,
    required TResult Function(BookmarkTrendingArticle value) bookmarkArticle,
  }) {
    return likeArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrending value)? loadTrending,
    TResult? Function(RefreshTrending value)? refreshTrending,
    TResult? Function(LoadMoreTrending value)? loadMoreTrending,
    TResult? Function(LikeTrendingArticle value)? likeArticle,
    TResult? Function(BookmarkTrendingArticle value)? bookmarkArticle,
  }) {
    return likeArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrending value)? loadTrending,
    TResult Function(RefreshTrending value)? refreshTrending,
    TResult Function(LoadMoreTrending value)? loadMoreTrending,
    TResult Function(LikeTrendingArticle value)? likeArticle,
    TResult Function(BookmarkTrendingArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (likeArticle != null) {
      return likeArticle(this);
    }
    return orElse();
  }
}

abstract class LikeTrendingArticle implements TrendingEvent {
  const factory LikeTrendingArticle(final String articleId) =
      _$LikeTrendingArticleImpl;

  String get articleId;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeTrendingArticleImplCopyWith<_$LikeTrendingArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookmarkTrendingArticleImplCopyWith<$Res> {
  factory _$$BookmarkTrendingArticleImplCopyWith(
          _$BookmarkTrendingArticleImpl value,
          $Res Function(_$BookmarkTrendingArticleImpl) then) =
      __$$BookmarkTrendingArticleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String articleId});
}

/// @nodoc
class __$$BookmarkTrendingArticleImplCopyWithImpl<$Res>
    extends _$TrendingEventCopyWithImpl<$Res, _$BookmarkTrendingArticleImpl>
    implements _$$BookmarkTrendingArticleImplCopyWith<$Res> {
  __$$BookmarkTrendingArticleImplCopyWithImpl(
      _$BookmarkTrendingArticleImpl _value,
      $Res Function(_$BookmarkTrendingArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
  }) {
    return _then(_$BookmarkTrendingArticleImpl(
      null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BookmarkTrendingArticleImpl implements BookmarkTrendingArticle {
  const _$BookmarkTrendingArticleImpl(this.articleId);

  @override
  final String articleId;

  @override
  String toString() {
    return 'TrendingEvent.bookmarkArticle(articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkTrendingArticleImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articleId);

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkTrendingArticleImplCopyWith<_$BookmarkTrendingArticleImpl>
      get copyWith => __$$BookmarkTrendingArticleImplCopyWithImpl<
          _$BookmarkTrendingArticleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        refreshTrending,
    required TResult Function(String? language, String? categorySlug,
            String? search, String? ordering, int? size)
        loadMoreTrending,
    required TResult Function(String articleId) likeArticle,
    required TResult Function(String articleId) bookmarkArticle,
  }) {
    return bookmarkArticle(articleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult? Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
    TResult? Function(String articleId)? likeArticle,
    TResult? Function(String articleId)? bookmarkArticle,
  }) {
    return bookmarkArticle?.call(articleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language, String? categorySlug,
            String? search, String? ordering, int? size)?
        loadTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        refreshTrending,
    TResult Function(String? language, String? categorySlug, String? search,
            String? ordering, int? size)?
        loadMoreTrending,
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
    required TResult Function(LoadTrending value) loadTrending,
    required TResult Function(RefreshTrending value) refreshTrending,
    required TResult Function(LoadMoreTrending value) loadMoreTrending,
    required TResult Function(LikeTrendingArticle value) likeArticle,
    required TResult Function(BookmarkTrendingArticle value) bookmarkArticle,
  }) {
    return bookmarkArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrending value)? loadTrending,
    TResult? Function(RefreshTrending value)? refreshTrending,
    TResult? Function(LoadMoreTrending value)? loadMoreTrending,
    TResult? Function(LikeTrendingArticle value)? likeArticle,
    TResult? Function(BookmarkTrendingArticle value)? bookmarkArticle,
  }) {
    return bookmarkArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrending value)? loadTrending,
    TResult Function(RefreshTrending value)? refreshTrending,
    TResult Function(LoadMoreTrending value)? loadMoreTrending,
    TResult Function(LikeTrendingArticle value)? likeArticle,
    TResult Function(BookmarkTrendingArticle value)? bookmarkArticle,
    required TResult orElse(),
  }) {
    if (bookmarkArticle != null) {
      return bookmarkArticle(this);
    }
    return orElse();
  }
}

abstract class BookmarkTrendingArticle implements TrendingEvent {
  const factory BookmarkTrendingArticle(final String articleId) =
      _$BookmarkTrendingArticleImpl;

  String get articleId;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkTrendingArticleImplCopyWith<_$BookmarkTrendingArticleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TrendingState {
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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
abstract class $TrendingStateCopyWith<$Res> {
  factory $TrendingStateCopyWith(
          TrendingState value, $Res Function(TrendingState) then) =
      _$TrendingStateCopyWithImpl<$Res, TrendingState>;
}

/// @nodoc
class _$TrendingStateCopyWithImpl<$Res, $Val extends TrendingState>
    implements $TrendingStateCopyWith<$Res> {
  _$TrendingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrendingState
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
    extends _$TrendingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TrendingState.initial()';
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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

abstract class Initial implements TrendingState {
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
    extends _$TrendingStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TrendingState.loading()';
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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

abstract class Loading implements TrendingState {
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
      String? currentCategorySlug,
      String? currentSearch,
      String? currentOrdering});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$TrendingStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingState
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
    Object? currentSearch = freezed,
    Object? currentOrdering = freezed,
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
      currentSearch: freezed == currentSearch
          ? _value.currentSearch
          : currentSearch // ignore: cast_nullable_to_non_nullable
              as String?,
      currentOrdering: freezed == currentOrdering
          ? _value.currentOrdering
          : currentOrdering // ignore: cast_nullable_to_non_nullable
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
      this.currentCategorySlug,
      this.currentSearch,
      this.currentOrdering})
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
  final String? currentSearch;
  @override
  final String? currentOrdering;

  @override
  String toString() {
    return 'TrendingState.loaded(articles: $articles, hasMoreData: $hasMoreData, currentPage: $currentPage, nextPageUrl: $nextPageUrl, currentLanguage: $currentLanguage, currentCategorySlug: $currentCategorySlug, currentSearch: $currentSearch, currentOrdering: $currentOrdering)';
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
                other.currentCategorySlug == currentCategorySlug) &&
            (identical(other.currentSearch, currentSearch) ||
                other.currentSearch == currentSearch) &&
            (identical(other.currentOrdering, currentOrdering) ||
                other.currentOrdering == currentOrdering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_articles),
      hasMoreData,
      currentPage,
      nextPageUrl,
      currentLanguage,
      currentCategorySlug,
      currentSearch,
      currentOrdering);

  /// Create a copy of TrendingState
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() actionLoading,
  }) {
    return loaded(articles, hasMoreData, currentPage, nextPageUrl,
        currentLanguage, currentCategorySlug, currentSearch, currentOrdering);
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? actionLoading,
  }) {
    return loaded?.call(articles, hasMoreData, currentPage, nextPageUrl,
        currentLanguage, currentCategorySlug, currentSearch, currentOrdering);
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? actionLoading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(articles, hasMoreData, currentPage, nextPageUrl,
          currentLanguage, currentCategorySlug, currentSearch, currentOrdering);
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

abstract class Loaded implements TrendingState {
  const factory Loaded(
      {required final List<ArticleModel> articles,
      required final bool hasMoreData,
      required final int currentPage,
      final String? nextPageUrl,
      final String? currentLanguage,
      final String? currentCategorySlug,
      final String? currentSearch,
      final String? currentOrdering}) = _$LoadedImpl;

  List<ArticleModel> get articles;
  bool get hasMoreData;
  int get currentPage;
  String? get nextPageUrl;
  String? get currentLanguage;
  String? get currentCategorySlug;
  String? get currentSearch;
  String? get currentOrdering;

  /// Create a copy of TrendingState
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
    extends _$TrendingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingState
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
    return 'TrendingState.error(message: $message)';
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

  /// Create a copy of TrendingState
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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

abstract class Error implements TrendingState {
  const factory Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of TrendingState
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
    extends _$TrendingStateCopyWithImpl<$Res, _$ActionLoadingImpl>
    implements _$$ActionLoadingImplCopyWith<$Res> {
  __$$ActionLoadingImplCopyWithImpl(
      _$ActionLoadingImpl _value, $Res Function(_$ActionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActionLoadingImpl implements ActionLoading {
  const _$ActionLoadingImpl();

  @override
  String toString() {
    return 'TrendingState.actionLoading()';
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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
            String? currentCategorySlug,
            String? currentSearch,
            String? currentOrdering)?
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

abstract class ActionLoading implements TrendingState {
  const factory ActionLoading() = _$ActionLoadingImpl;
}
