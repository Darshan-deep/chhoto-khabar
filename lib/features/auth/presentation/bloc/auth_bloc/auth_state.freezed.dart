// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
          _$AuthInitialImpl value, $Res Function(_$AuthInitialImpl) then) =
      __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
      _$AuthInitialImpl _value, $Res Function(_$AuthInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthInitialImpl implements AuthInitial {
  const _$AuthInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
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
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements AuthState {
  const factory AuthInitial() = _$AuthInitialImpl;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
          _$AuthLoadingImpl value, $Res Function(_$AuthLoadingImpl) then) =
      __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl _value, $Res Function(_$AuthLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLoadingImpl implements AuthLoading {
  const _$AuthLoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
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
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthState {
  const factory AuthLoading() = _$AuthLoadingImpl;
}

/// @nodoc
abstract class _$$AuthAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthAuthenticatedImplCopyWith(_$AuthAuthenticatedImpl value,
          $Res Function(_$AuthAuthenticatedImpl) then) =
      __$$AuthAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$AuthAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthAuthenticatedImpl>
    implements _$$AuthAuthenticatedImplCopyWith<$Res> {
  __$$AuthAuthenticatedImplCopyWithImpl(_$AuthAuthenticatedImpl _value,
      $Res Function(_$AuthAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$AuthAuthenticatedImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthAuthenticatedImpl implements AuthAuthenticated {
  const _$AuthAuthenticatedImpl(
      {required this.accessToken, required this.refreshToken});

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'AuthState.authenticated(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatedImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      __$$AuthAuthenticatedImplCopyWithImpl<_$AuthAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return authenticated(accessToken, refreshToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return authenticated?.call(accessToken, refreshToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(accessToken, refreshToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthAuthenticated implements AuthState {
  const factory AuthAuthenticated(
      {required final String accessToken,
      required final String refreshToken}) = _$AuthAuthenticatedImpl;

  String get accessToken;
  String get refreshToken;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthUnauthenticatedImplCopyWith<$Res> {
  factory _$$AuthUnauthenticatedImplCopyWith(_$AuthUnauthenticatedImpl value,
          $Res Function(_$AuthUnauthenticatedImpl) then) =
      __$$AuthUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthUnauthenticatedImpl>
    implements _$$AuthUnauthenticatedImplCopyWith<$Res> {
  __$$AuthUnauthenticatedImplCopyWithImpl(_$AuthUnauthenticatedImpl _value,
      $Res Function(_$AuthUnauthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthUnauthenticatedImpl implements AuthUnauthenticated {
  const _$AuthUnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthUnauthenticated implements AuthState {
  const factory AuthUnauthenticated() = _$AuthUnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AuthRequiredImplCopyWith<$Res> {
  factory _$$AuthRequiredImplCopyWith(
          _$AuthRequiredImpl value, $Res Function(_$AuthRequiredImpl) then) =
      __$$AuthRequiredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String action, String message});
}

/// @nodoc
class __$$AuthRequiredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthRequiredImpl>
    implements _$$AuthRequiredImplCopyWith<$Res> {
  __$$AuthRequiredImplCopyWithImpl(
      _$AuthRequiredImpl _value, $Res Function(_$AuthRequiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? message = null,
  }) {
    return _then(_$AuthRequiredImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthRequiredImpl implements AuthRequired {
  const _$AuthRequiredImpl({required this.action, required this.message});

  @override
  final String action;
  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.authRequired(action: $action, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthRequiredImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthRequiredImplCopyWith<_$AuthRequiredImpl> get copyWith =>
      __$$AuthRequiredImplCopyWithImpl<_$AuthRequiredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return authRequired(action, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return authRequired?.call(action, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (authRequired != null) {
      return authRequired(action, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return authRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return authRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (authRequired != null) {
      return authRequired(this);
    }
    return orElse();
  }
}

abstract class AuthRequired implements AuthState {
  const factory AuthRequired(
      {required final String action,
      required final String message}) = _$AuthRequiredImpl;

  String get action;
  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthRequiredImplCopyWith<_$AuthRequiredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException exception});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$AuthFailureImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$AuthFailureImpl implements AuthFailure {
  const _$AuthFailureImpl(this.exception);

  @override
  final AppException exception;

  @override
  String toString() {
    return 'AuthState.failure(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AuthFailure implements AuthState {
  const factory AuthFailure(final AppException exception) = _$AuthFailureImpl;

  AppException get exception;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthValidationErrorImplCopyWith<$Res> {
  factory _$$AuthValidationErrorImplCopyWith(_$AuthValidationErrorImpl value,
          $Res Function(_$AuthValidationErrorImpl) then) =
      __$$AuthValidationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ValidationError validationErrors});
}

/// @nodoc
class __$$AuthValidationErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthValidationErrorImpl>
    implements _$$AuthValidationErrorImplCopyWith<$Res> {
  __$$AuthValidationErrorImplCopyWithImpl(_$AuthValidationErrorImpl _value,
      $Res Function(_$AuthValidationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validationErrors = null,
  }) {
    return _then(_$AuthValidationErrorImpl(
      null == validationErrors
          ? _value.validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as ValidationError,
    ));
  }
}

/// @nodoc

class _$AuthValidationErrorImpl implements AuthValidationError {
  const _$AuthValidationErrorImpl(this.validationErrors);

  @override
  final ValidationError validationErrors;

  @override
  String toString() {
    return 'AuthState.validationError(validationErrors: $validationErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthValidationErrorImpl &&
            (identical(other.validationErrors, validationErrors) ||
                other.validationErrors == validationErrors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, validationErrors);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthValidationErrorImplCopyWith<_$AuthValidationErrorImpl> get copyWith =>
      __$$AuthValidationErrorImplCopyWithImpl<_$AuthValidationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return validationError(validationErrors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return validationError?.call(validationErrors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(validationErrors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return validationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return validationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(this);
    }
    return orElse();
  }
}

abstract class AuthValidationError implements AuthState {
  const factory AuthValidationError(final ValidationError validationErrors) =
      _$AuthValidationErrorImpl;

  ValidationError get validationErrors;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthValidationErrorImplCopyWith<_$AuthValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignUpSuccessImplCopyWith<$Res> {
  factory _$$AuthSignUpSuccessImplCopyWith(_$AuthSignUpSuccessImpl value,
          $Res Function(_$AuthSignUpSuccessImpl) then) =
      __$$AuthSignUpSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? email});
}

/// @nodoc
class __$$AuthSignUpSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSignUpSuccessImpl>
    implements _$$AuthSignUpSuccessImplCopyWith<$Res> {
  __$$AuthSignUpSuccessImplCopyWithImpl(_$AuthSignUpSuccessImpl _value,
      $Res Function(_$AuthSignUpSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? email = freezed,
  }) {
    return _then(_$AuthSignUpSuccessImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthSignUpSuccessImpl implements AuthSignUpSuccess {
  const _$AuthSignUpSuccessImpl({required this.message, this.email});

  @override
  final String message;
  @override
  final String? email;

  @override
  String toString() {
    return 'AuthState.signUpSuccess(message: $message, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignUpSuccessImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, email);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignUpSuccessImplCopyWith<_$AuthSignUpSuccessImpl> get copyWith =>
      __$$AuthSignUpSuccessImplCopyWithImpl<_$AuthSignUpSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return signUpSuccess(message, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return signUpSuccess?.call(message, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess(message, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return signUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return signUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthSignUpSuccess implements AuthState {
  const factory AuthSignUpSuccess(
      {required final String message,
      final String? email}) = _$AuthSignUpSuccessImpl;

  String get message;
  String? get email;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSignUpSuccessImplCopyWith<_$AuthSignUpSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthPasswordChangeSuccessImplCopyWith<$Res> {
  factory _$$AuthPasswordChangeSuccessImplCopyWith(
          _$AuthPasswordChangeSuccessImpl value,
          $Res Function(_$AuthPasswordChangeSuccessImpl) then) =
      __$$AuthPasswordChangeSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthPasswordChangeSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthPasswordChangeSuccessImpl>
    implements _$$AuthPasswordChangeSuccessImplCopyWith<$Res> {
  __$$AuthPasswordChangeSuccessImplCopyWithImpl(
      _$AuthPasswordChangeSuccessImpl _value,
      $Res Function(_$AuthPasswordChangeSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthPasswordChangeSuccessImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthPasswordChangeSuccessImpl implements AuthPasswordChangeSuccess {
  const _$AuthPasswordChangeSuccessImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.passwordChangeSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthPasswordChangeSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthPasswordChangeSuccessImplCopyWith<_$AuthPasswordChangeSuccessImpl>
      get copyWith => __$$AuthPasswordChangeSuccessImplCopyWithImpl<
          _$AuthPasswordChangeSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return passwordChangeSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return passwordChangeSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (passwordChangeSuccess != null) {
      return passwordChangeSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return passwordChangeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return passwordChangeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (passwordChangeSuccess != null) {
      return passwordChangeSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthPasswordChangeSuccess implements AuthState {
  const factory AuthPasswordChangeSuccess({required final String message}) =
      _$AuthPasswordChangeSuccessImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthPasswordChangeSuccessImplCopyWith<_$AuthPasswordChangeSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthForgotPasswordSuccessImplCopyWith<$Res> {
  factory _$$AuthForgotPasswordSuccessImplCopyWith(
          _$AuthForgotPasswordSuccessImpl value,
          $Res Function(_$AuthForgotPasswordSuccessImpl) then) =
      __$$AuthForgotPasswordSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String email});
}

/// @nodoc
class __$$AuthForgotPasswordSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthForgotPasswordSuccessImpl>
    implements _$$AuthForgotPasswordSuccessImplCopyWith<$Res> {
  __$$AuthForgotPasswordSuccessImplCopyWithImpl(
      _$AuthForgotPasswordSuccessImpl _value,
      $Res Function(_$AuthForgotPasswordSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? email = null,
  }) {
    return _then(_$AuthForgotPasswordSuccessImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthForgotPasswordSuccessImpl implements AuthForgotPasswordSuccess {
  const _$AuthForgotPasswordSuccessImpl(
      {required this.message, required this.email});

  @override
  final String message;
  @override
  final String email;

  @override
  String toString() {
    return 'AuthState.forgotPasswordSuccess(message: $message, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthForgotPasswordSuccessImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, email);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthForgotPasswordSuccessImplCopyWith<_$AuthForgotPasswordSuccessImpl>
      get copyWith => __$$AuthForgotPasswordSuccessImplCopyWithImpl<
          _$AuthForgotPasswordSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return forgotPasswordSuccess(message, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return forgotPasswordSuccess?.call(message, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (forgotPasswordSuccess != null) {
      return forgotPasswordSuccess(message, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return forgotPasswordSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return forgotPasswordSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (forgotPasswordSuccess != null) {
      return forgotPasswordSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthForgotPasswordSuccess implements AuthState {
  const factory AuthForgotPasswordSuccess(
      {required final String message,
      required final String email}) = _$AuthForgotPasswordSuccessImpl;

  String get message;
  String get email;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthForgotPasswordSuccessImplCopyWith<_$AuthForgotPasswordSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthResetPasswordSuccessImplCopyWith<$Res> {
  factory _$$AuthResetPasswordSuccessImplCopyWith(
          _$AuthResetPasswordSuccessImpl value,
          $Res Function(_$AuthResetPasswordSuccessImpl) then) =
      __$$AuthResetPasswordSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthResetPasswordSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthResetPasswordSuccessImpl>
    implements _$$AuthResetPasswordSuccessImplCopyWith<$Res> {
  __$$AuthResetPasswordSuccessImplCopyWithImpl(
      _$AuthResetPasswordSuccessImpl _value,
      $Res Function(_$AuthResetPasswordSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthResetPasswordSuccessImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthResetPasswordSuccessImpl implements AuthResetPasswordSuccess {
  const _$AuthResetPasswordSuccessImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.resetPasswordSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResetPasswordSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResetPasswordSuccessImplCopyWith<_$AuthResetPasswordSuccessImpl>
      get copyWith => __$$AuthResetPasswordSuccessImplCopyWithImpl<
          _$AuthResetPasswordSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return resetPasswordSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return resetPasswordSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (resetPasswordSuccess != null) {
      return resetPasswordSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return resetPasswordSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return resetPasswordSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (resetPasswordSuccess != null) {
      return resetPasswordSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthResetPasswordSuccess implements AuthState {
  const factory AuthResetPasswordSuccess({required final String message}) =
      _$AuthResetPasswordSuccessImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResetPasswordSuccessImplCopyWith<_$AuthResetPasswordSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLogoutSuccessImplCopyWith<$Res> {
  factory _$$AuthLogoutSuccessImplCopyWith(_$AuthLogoutSuccessImpl value,
          $Res Function(_$AuthLogoutSuccessImpl) then) =
      __$$AuthLogoutSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLogoutSuccessImpl>
    implements _$$AuthLogoutSuccessImplCopyWith<$Res> {
  __$$AuthLogoutSuccessImplCopyWithImpl(_$AuthLogoutSuccessImpl _value,
      $Res Function(_$AuthLogoutSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLogoutSuccessImpl implements AuthLogoutSuccess {
  const _$AuthLogoutSuccessImpl();

  @override
  String toString() {
    return 'AuthState.logoutSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogoutSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String action, String message) authRequired,
    required TResult Function(AppException exception) failure,
    required TResult Function(ValidationError validationErrors) validationError,
    required TResult Function(String message, String? email) signUpSuccess,
    required TResult Function(String message) passwordChangeSuccess,
    required TResult Function(String message, String email)
        forgotPasswordSuccess,
    required TResult Function(String message) resetPasswordSuccess,
    required TResult Function() logoutSuccess,
  }) {
    return logoutSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String action, String message)? authRequired,
    TResult? Function(AppException exception)? failure,
    TResult? Function(ValidationError validationErrors)? validationError,
    TResult? Function(String message, String? email)? signUpSuccess,
    TResult? Function(String message)? passwordChangeSuccess,
    TResult? Function(String message, String email)? forgotPasswordSuccess,
    TResult? Function(String message)? resetPasswordSuccess,
    TResult? Function()? logoutSuccess,
  }) {
    return logoutSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String action, String message)? authRequired,
    TResult Function(AppException exception)? failure,
    TResult Function(ValidationError validationErrors)? validationError,
    TResult Function(String message, String? email)? signUpSuccess,
    TResult Function(String message)? passwordChangeSuccess,
    TResult Function(String message, String email)? forgotPasswordSuccess,
    TResult Function(String message)? resetPasswordSuccess,
    TResult Function()? logoutSuccess,
    required TResult orElse(),
  }) {
    if (logoutSuccess != null) {
      return logoutSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthRequired value) authRequired,
    required TResult Function(AuthFailure value) failure,
    required TResult Function(AuthValidationError value) validationError,
    required TResult Function(AuthSignUpSuccess value) signUpSuccess,
    required TResult Function(AuthPasswordChangeSuccess value)
        passwordChangeSuccess,
    required TResult Function(AuthForgotPasswordSuccess value)
        forgotPasswordSuccess,
    required TResult Function(AuthResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(AuthLogoutSuccess value) logoutSuccess,
  }) {
    return logoutSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthRequired value)? authRequired,
    TResult? Function(AuthFailure value)? failure,
    TResult? Function(AuthValidationError value)? validationError,
    TResult? Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult? Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult? Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult? Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult? Function(AuthLogoutSuccess value)? logoutSuccess,
  }) {
    return logoutSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthRequired value)? authRequired,
    TResult Function(AuthFailure value)? failure,
    TResult Function(AuthValidationError value)? validationError,
    TResult Function(AuthSignUpSuccess value)? signUpSuccess,
    TResult Function(AuthPasswordChangeSuccess value)? passwordChangeSuccess,
    TResult Function(AuthForgotPasswordSuccess value)? forgotPasswordSuccess,
    TResult Function(AuthResetPasswordSuccess value)? resetPasswordSuccess,
    TResult Function(AuthLogoutSuccess value)? logoutSuccess,
    required TResult orElse(),
  }) {
    if (logoutSuccess != null) {
      return logoutSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthLogoutSuccess implements AuthState {
  const factory AuthLogoutSuccess() = _$AuthLogoutSuccessImpl;
}
