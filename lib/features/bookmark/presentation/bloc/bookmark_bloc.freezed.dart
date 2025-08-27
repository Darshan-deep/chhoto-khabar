// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookmarkEvent {
  String? get language => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language) loadBookmarks,
    required TResult Function(String? language) refreshBookmarks,
    required TResult Function(String? language) loadMoreBookmarks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language)? loadBookmarks,
    TResult? Function(String? language)? refreshBookmarks,
    TResult? Function(String? language)? loadMoreBookmarks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language)? loadBookmarks,
    TResult Function(String? language)? refreshBookmarks,
    TResult Function(String? language)? loadMoreBookmarks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBookmarks value) loadBookmarks,
    required TResult Function(RefreshBookmarks value) refreshBookmarks,
    required TResult Function(LoadMoreBookmarks value) loadMoreBookmarks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBookmarks value)? loadBookmarks,
    TResult? Function(RefreshBookmarks value)? refreshBookmarks,
    TResult? Function(LoadMoreBookmarks value)? loadMoreBookmarks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBookmarks value)? loadBookmarks,
    TResult Function(RefreshBookmarks value)? refreshBookmarks,
    TResult Function(LoadMoreBookmarks value)? loadMoreBookmarks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkEventCopyWith<BookmarkEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkEventCopyWith<$Res> {
  factory $BookmarkEventCopyWith(
          BookmarkEvent value, $Res Function(BookmarkEvent) then) =
      _$BookmarkEventCopyWithImpl<$Res, BookmarkEvent>;
  @useResult
  $Res call({String? language});
}

/// @nodoc
class _$BookmarkEventCopyWithImpl<$Res, $Val extends BookmarkEvent>
    implements $BookmarkEventCopyWith<$Res> {
  _$BookmarkEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadBookmarksImplCopyWith<$Res>
    implements $BookmarkEventCopyWith<$Res> {
  factory _$$LoadBookmarksImplCopyWith(
          _$LoadBookmarksImpl value, $Res Function(_$LoadBookmarksImpl) then) =
      __$$LoadBookmarksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? page, String? language});
}

/// @nodoc
class __$$LoadBookmarksImplCopyWithImpl<$Res>
    extends _$BookmarkEventCopyWithImpl<$Res, _$LoadBookmarksImpl>
    implements _$$LoadBookmarksImplCopyWith<$Res> {
  __$$LoadBookmarksImplCopyWithImpl(
      _$LoadBookmarksImpl _value, $Res Function(_$LoadBookmarksImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? language = freezed,
  }) {
    return _then(_$LoadBookmarksImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadBookmarksImpl implements LoadBookmarks {
  const _$LoadBookmarksImpl({this.page, this.language});

  @override
  final int? page;
  @override
  final String? language;

  @override
  String toString() {
    return 'BookmarkEvent.loadBookmarks(page: $page, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadBookmarksImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, language);

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadBookmarksImplCopyWith<_$LoadBookmarksImpl> get copyWith =>
      __$$LoadBookmarksImplCopyWithImpl<_$LoadBookmarksImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language) loadBookmarks,
    required TResult Function(String? language) refreshBookmarks,
    required TResult Function(String? language) loadMoreBookmarks,
  }) {
    return loadBookmarks(page, language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language)? loadBookmarks,
    TResult? Function(String? language)? refreshBookmarks,
    TResult? Function(String? language)? loadMoreBookmarks,
  }) {
    return loadBookmarks?.call(page, language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language)? loadBookmarks,
    TResult Function(String? language)? refreshBookmarks,
    TResult Function(String? language)? loadMoreBookmarks,
    required TResult orElse(),
  }) {
    if (loadBookmarks != null) {
      return loadBookmarks(page, language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBookmarks value) loadBookmarks,
    required TResult Function(RefreshBookmarks value) refreshBookmarks,
    required TResult Function(LoadMoreBookmarks value) loadMoreBookmarks,
  }) {
    return loadBookmarks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBookmarks value)? loadBookmarks,
    TResult? Function(RefreshBookmarks value)? refreshBookmarks,
    TResult? Function(LoadMoreBookmarks value)? loadMoreBookmarks,
  }) {
    return loadBookmarks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBookmarks value)? loadBookmarks,
    TResult Function(RefreshBookmarks value)? refreshBookmarks,
    TResult Function(LoadMoreBookmarks value)? loadMoreBookmarks,
    required TResult orElse(),
  }) {
    if (loadBookmarks != null) {
      return loadBookmarks(this);
    }
    return orElse();
  }
}

abstract class LoadBookmarks implements BookmarkEvent {
  const factory LoadBookmarks({final int? page, final String? language}) =
      _$LoadBookmarksImpl;

  int? get page;
  @override
  String? get language;

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadBookmarksImplCopyWith<_$LoadBookmarksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshBookmarksImplCopyWith<$Res>
    implements $BookmarkEventCopyWith<$Res> {
  factory _$$RefreshBookmarksImplCopyWith(_$RefreshBookmarksImpl value,
          $Res Function(_$RefreshBookmarksImpl) then) =
      __$$RefreshBookmarksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? language});
}

/// @nodoc
class __$$RefreshBookmarksImplCopyWithImpl<$Res>
    extends _$BookmarkEventCopyWithImpl<$Res, _$RefreshBookmarksImpl>
    implements _$$RefreshBookmarksImplCopyWith<$Res> {
  __$$RefreshBookmarksImplCopyWithImpl(_$RefreshBookmarksImpl _value,
      $Res Function(_$RefreshBookmarksImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
  }) {
    return _then(_$RefreshBookmarksImpl(
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RefreshBookmarksImpl implements RefreshBookmarks {
  const _$RefreshBookmarksImpl({this.language});

  @override
  final String? language;

  @override
  String toString() {
    return 'BookmarkEvent.refreshBookmarks(language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshBookmarksImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshBookmarksImplCopyWith<_$RefreshBookmarksImpl> get copyWith =>
      __$$RefreshBookmarksImplCopyWithImpl<_$RefreshBookmarksImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language) loadBookmarks,
    required TResult Function(String? language) refreshBookmarks,
    required TResult Function(String? language) loadMoreBookmarks,
  }) {
    return refreshBookmarks(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language)? loadBookmarks,
    TResult? Function(String? language)? refreshBookmarks,
    TResult? Function(String? language)? loadMoreBookmarks,
  }) {
    return refreshBookmarks?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language)? loadBookmarks,
    TResult Function(String? language)? refreshBookmarks,
    TResult Function(String? language)? loadMoreBookmarks,
    required TResult orElse(),
  }) {
    if (refreshBookmarks != null) {
      return refreshBookmarks(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBookmarks value) loadBookmarks,
    required TResult Function(RefreshBookmarks value) refreshBookmarks,
    required TResult Function(LoadMoreBookmarks value) loadMoreBookmarks,
  }) {
    return refreshBookmarks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBookmarks value)? loadBookmarks,
    TResult? Function(RefreshBookmarks value)? refreshBookmarks,
    TResult? Function(LoadMoreBookmarks value)? loadMoreBookmarks,
  }) {
    return refreshBookmarks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBookmarks value)? loadBookmarks,
    TResult Function(RefreshBookmarks value)? refreshBookmarks,
    TResult Function(LoadMoreBookmarks value)? loadMoreBookmarks,
    required TResult orElse(),
  }) {
    if (refreshBookmarks != null) {
      return refreshBookmarks(this);
    }
    return orElse();
  }
}

abstract class RefreshBookmarks implements BookmarkEvent {
  const factory RefreshBookmarks({final String? language}) =
      _$RefreshBookmarksImpl;

  @override
  String? get language;

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshBookmarksImplCopyWith<_$RefreshBookmarksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreBookmarksImplCopyWith<$Res>
    implements $BookmarkEventCopyWith<$Res> {
  factory _$$LoadMoreBookmarksImplCopyWith(_$LoadMoreBookmarksImpl value,
          $Res Function(_$LoadMoreBookmarksImpl) then) =
      __$$LoadMoreBookmarksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? language});
}

/// @nodoc
class __$$LoadMoreBookmarksImplCopyWithImpl<$Res>
    extends _$BookmarkEventCopyWithImpl<$Res, _$LoadMoreBookmarksImpl>
    implements _$$LoadMoreBookmarksImplCopyWith<$Res> {
  __$$LoadMoreBookmarksImplCopyWithImpl(_$LoadMoreBookmarksImpl _value,
      $Res Function(_$LoadMoreBookmarksImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
  }) {
    return _then(_$LoadMoreBookmarksImpl(
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadMoreBookmarksImpl implements LoadMoreBookmarks {
  const _$LoadMoreBookmarksImpl({this.language});

  @override
  final String? language;

  @override
  String toString() {
    return 'BookmarkEvent.loadMoreBookmarks(language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreBookmarksImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreBookmarksImplCopyWith<_$LoadMoreBookmarksImpl> get copyWith =>
      __$$LoadMoreBookmarksImplCopyWithImpl<_$LoadMoreBookmarksImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page, String? language) loadBookmarks,
    required TResult Function(String? language) refreshBookmarks,
    required TResult Function(String? language) loadMoreBookmarks,
  }) {
    return loadMoreBookmarks(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page, String? language)? loadBookmarks,
    TResult? Function(String? language)? refreshBookmarks,
    TResult? Function(String? language)? loadMoreBookmarks,
  }) {
    return loadMoreBookmarks?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page, String? language)? loadBookmarks,
    TResult Function(String? language)? refreshBookmarks,
    TResult Function(String? language)? loadMoreBookmarks,
    required TResult orElse(),
  }) {
    if (loadMoreBookmarks != null) {
      return loadMoreBookmarks(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBookmarks value) loadBookmarks,
    required TResult Function(RefreshBookmarks value) refreshBookmarks,
    required TResult Function(LoadMoreBookmarks value) loadMoreBookmarks,
  }) {
    return loadMoreBookmarks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBookmarks value)? loadBookmarks,
    TResult? Function(RefreshBookmarks value)? refreshBookmarks,
    TResult? Function(LoadMoreBookmarks value)? loadMoreBookmarks,
  }) {
    return loadMoreBookmarks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBookmarks value)? loadBookmarks,
    TResult Function(RefreshBookmarks value)? refreshBookmarks,
    TResult Function(LoadMoreBookmarks value)? loadMoreBookmarks,
    required TResult orElse(),
  }) {
    if (loadMoreBookmarks != null) {
      return loadMoreBookmarks(this);
    }
    return orElse();
  }
}

abstract class LoadMoreBookmarks implements BookmarkEvent {
  const factory LoadMoreBookmarks({final String? language}) =
      _$LoadMoreBookmarksImpl;

  @override
  String? get language;

  /// Create a copy of BookmarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMoreBookmarksImplCopyWith<_$LoadMoreBookmarksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookmarkState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)
        loaded,
    required TResult Function(List<BookmarkModel> bookmarks, int currentPage)
        loadingMore,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult? Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkStateCopyWith<$Res> {
  factory $BookmarkStateCopyWith(
          BookmarkState value, $Res Function(BookmarkState) then) =
      _$BookmarkStateCopyWithImpl<$Res, BookmarkState>;
}

/// @nodoc
class _$BookmarkStateCopyWithImpl<$Res, $Val extends BookmarkState>
    implements $BookmarkStateCopyWith<$Res> {
  _$BookmarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookmarkState
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
    extends _$BookmarkStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BookmarkState.initial()';
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
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)
        loaded,
    required TResult Function(List<BookmarkModel> bookmarks, int currentPage)
        loadingMore,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult? Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult Function(String message)? error,
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
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BookmarkState {
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
    extends _$BookmarkStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'BookmarkState.loading()';
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
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)
        loaded,
    required TResult Function(List<BookmarkModel> bookmarks, int currentPage)
        loadingMore,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult? Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult Function(String message)? error,
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
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BookmarkState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$BookmarkStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarks = null,
    Object? currentPage = null,
    Object? hasMoreData = null,
  }) {
    return _then(_$LoadedImpl(
      bookmarks: null == bookmarks
          ? _value._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<BookmarkModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<BookmarkModel> bookmarks,
      required this.currentPage,
      required this.hasMoreData})
      : _bookmarks = bookmarks;

  final List<BookmarkModel> _bookmarks;
  @override
  List<BookmarkModel> get bookmarks {
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

  @override
  final int currentPage;
  @override
  final bool hasMoreData;

  @override
  String toString() {
    return 'BookmarkState.loaded(bookmarks: $bookmarks, currentPage: $currentPage, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bookmarks),
      currentPage,
      hasMoreData);

  /// Create a copy of BookmarkState
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
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)
        loaded,
    required TResult Function(List<BookmarkModel> bookmarks, int currentPage)
        loadingMore,
    required TResult Function(String message) error,
  }) {
    return loaded(bookmarks, currentPage, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult? Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(bookmarks, currentPage, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(bookmarks, currentPage, hasMoreData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements BookmarkState {
  const factory _Loaded(
      {required final List<BookmarkModel> bookmarks,
      required final int currentPage,
      required final bool hasMoreData}) = _$LoadedImpl;

  List<BookmarkModel> get bookmarks;
  int get currentPage;
  bool get hasMoreData;

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingMoreImplCopyWith<$Res> {
  factory _$$LoadingMoreImplCopyWith(
          _$LoadingMoreImpl value, $Res Function(_$LoadingMoreImpl) then) =
      __$$LoadingMoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BookmarkModel> bookmarks, int currentPage});
}

/// @nodoc
class __$$LoadingMoreImplCopyWithImpl<$Res>
    extends _$BookmarkStateCopyWithImpl<$Res, _$LoadingMoreImpl>
    implements _$$LoadingMoreImplCopyWith<$Res> {
  __$$LoadingMoreImplCopyWithImpl(
      _$LoadingMoreImpl _value, $Res Function(_$LoadingMoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarks = null,
    Object? currentPage = null,
  }) {
    return _then(_$LoadingMoreImpl(
      bookmarks: null == bookmarks
          ? _value._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<BookmarkModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadingMoreImpl implements _LoadingMore {
  const _$LoadingMoreImpl(
      {required final List<BookmarkModel> bookmarks, required this.currentPage})
      : _bookmarks = bookmarks;

  final List<BookmarkModel> _bookmarks;
  @override
  List<BookmarkModel> get bookmarks {
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

  @override
  final int currentPage;

  @override
  String toString() {
    return 'BookmarkState.loadingMore(bookmarks: $bookmarks, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingMoreImpl &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_bookmarks), currentPage);

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingMoreImplCopyWith<_$LoadingMoreImpl> get copyWith =>
      __$$LoadingMoreImplCopyWithImpl<_$LoadingMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)
        loaded,
    required TResult Function(List<BookmarkModel> bookmarks, int currentPage)
        loadingMore,
    required TResult Function(String message) error,
  }) {
    return loadingMore(bookmarks, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult? Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult? Function(String message)? error,
  }) {
    return loadingMore?.call(bookmarks, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(bookmarks, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class _LoadingMore implements BookmarkState {
  const factory _LoadingMore(
      {required final List<BookmarkModel> bookmarks,
      required final int currentPage}) = _$LoadingMoreImpl;

  List<BookmarkModel> get bookmarks;
  int get currentPage;

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingMoreImplCopyWith<_$LoadingMoreImpl> get copyWith =>
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
    extends _$BookmarkStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkState
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
    return 'BookmarkState.error(message: $message)';
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

  /// Create a copy of BookmarkState
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
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)
        loaded,
    required TResult Function(List<BookmarkModel> bookmarks, int currentPage)
        loadingMore,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult? Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BookmarkModel> bookmarks, int currentPage, bool hasMoreData)?
        loaded,
    TResult Function(List<BookmarkModel> bookmarks, int currentPage)?
        loadingMore,
    TResult Function(String message)? error,
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
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BookmarkState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
