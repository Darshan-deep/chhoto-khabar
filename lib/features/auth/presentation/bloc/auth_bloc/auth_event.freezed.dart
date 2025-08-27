// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckAuthStatusEventImplCopyWith<$Res> {
  factory _$$CheckAuthStatusEventImplCopyWith(_$CheckAuthStatusEventImpl value,
          $Res Function(_$CheckAuthStatusEventImpl) then) =
      __$$CheckAuthStatusEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthStatusEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthStatusEventImpl>
    implements _$$CheckAuthStatusEventImplCopyWith<$Res> {
  __$$CheckAuthStatusEventImplCopyWithImpl(_$CheckAuthStatusEventImpl _value,
      $Res Function(_$CheckAuthStatusEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthStatusEventImpl implements CheckAuthStatusEvent {
  const _$CheckAuthStatusEventImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuthStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckAuthStatusEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return checkAuthStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return checkAuthStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return checkAuthStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return checkAuthStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus(this);
    }
    return orElse();
  }
}

abstract class CheckAuthStatusEvent implements AuthEvent {
  const factory CheckAuthStatusEvent() = _$CheckAuthStatusEventImpl;
}

/// @nodoc
abstract class _$$SignInEventImplCopyWith<$Res> {
  factory _$$SignInEventImplCopyWith(
          _$SignInEventImpl value, $Res Function(_$SignInEventImpl) then) =
      __$$SignInEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInEventImpl>
    implements _$$SignInEventImplCopyWith<$Res> {
  __$$SignInEventImplCopyWithImpl(
      _$SignInEventImpl _value, $Res Function(_$SignInEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInEventImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInEventImpl implements SignInEvent {
  const _$SignInEventImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signIn(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInEventImplCopyWith<_$SignInEventImpl> get copyWith =>
      __$$SignInEventImplCopyWithImpl<_$SignInEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return signIn(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return signIn?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class SignInEvent implements AuthEvent {
  const factory SignInEvent(
      {required final String email,
      required final String password}) = _$SignInEventImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInEventImplCopyWith<_$SignInEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpEventImplCopyWith<$Res> {
  factory _$$SignUpEventImplCopyWith(
          _$SignUpEventImpl value, $Res Function(_$SignUpEventImpl) then) =
      __$$SignUpEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String firstName, String lastName});
}

/// @nodoc
class __$$SignUpEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignUpEventImpl>
    implements _$$SignUpEventImplCopyWith<$Res> {
  __$$SignUpEventImplCopyWithImpl(
      _$SignUpEventImpl _value, $Res Function(_$SignUpEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$SignUpEventImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpEventImpl implements SignUpEvent {
  const _$SignUpEventImpl(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});

  @override
  final String email;
  @override
  final String password;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'AuthEvent.signUp(email: $email, password: $password, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, firstName, lastName);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpEventImplCopyWith<_$SignUpEventImpl> get copyWith =>
      __$$SignUpEventImplCopyWithImpl<_$SignUpEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return signUp(email, password, firstName, lastName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return signUp?.call(email, password, firstName, lastName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(email, password, firstName, lastName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class SignUpEvent implements AuthEvent {
  const factory SignUpEvent(
      {required final String email,
      required final String password,
      required final String firstName,
      required final String lastName}) = _$SignUpEventImpl;

  String get email;
  String get password;
  String get firstName;
  String get lastName;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpEventImplCopyWith<_$SignUpEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePasswordEventImplCopyWith<$Res> {
  factory _$$ChangePasswordEventImplCopyWith(_$ChangePasswordEventImpl value,
          $Res Function(_$ChangePasswordEventImpl) then) =
      __$$ChangePasswordEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String oldPassword, String newPassword, String confirmPassword});
}

/// @nodoc
class __$$ChangePasswordEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ChangePasswordEventImpl>
    implements _$$ChangePasswordEventImplCopyWith<$Res> {
  __$$ChangePasswordEventImplCopyWithImpl(_$ChangePasswordEventImpl _value,
      $Res Function(_$ChangePasswordEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldPassword = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$ChangePasswordEventImpl(
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePasswordEventImpl implements ChangePasswordEvent {
  const _$ChangePasswordEventImpl(
      {required this.oldPassword,
      required this.newPassword,
      required this.confirmPassword});

  @override
  final String oldPassword;
  @override
  final String newPassword;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'AuthEvent.changePassword(oldPassword: $oldPassword, newPassword: $newPassword, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordEventImpl &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, oldPassword, newPassword, confirmPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordEventImplCopyWith<_$ChangePasswordEventImpl> get copyWith =>
      __$$ChangePasswordEventImplCopyWithImpl<_$ChangePasswordEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return changePassword(oldPassword, newPassword, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return changePassword?.call(oldPassword, newPassword, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(oldPassword, newPassword, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class ChangePasswordEvent implements AuthEvent {
  const factory ChangePasswordEvent(
      {required final String oldPassword,
      required final String newPassword,
      required final String confirmPassword}) = _$ChangePasswordEventImpl;

  String get oldPassword;
  String get newPassword;
  String get confirmPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordEventImplCopyWith<_$ChangePasswordEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgotPasswordEventImplCopyWith<$Res> {
  factory _$$ForgotPasswordEventImplCopyWith(_$ForgotPasswordEventImpl value,
          $Res Function(_$ForgotPasswordEventImpl) then) =
      __$$ForgotPasswordEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ForgotPasswordEventImpl>
    implements _$$ForgotPasswordEventImplCopyWith<$Res> {
  __$$ForgotPasswordEventImplCopyWithImpl(_$ForgotPasswordEventImpl _value,
      $Res Function(_$ForgotPasswordEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordEventImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordEventImpl implements ForgotPasswordEvent {
  const _$ForgotPasswordEventImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.forgotPassword(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordEventImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordEventImplCopyWith<_$ForgotPasswordEventImpl> get copyWith =>
      __$$ForgotPasswordEventImplCopyWithImpl<_$ForgotPasswordEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return forgotPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return forgotPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return forgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return forgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordEvent implements AuthEvent {
  const factory ForgotPasswordEvent({required final String email}) =
      _$ForgotPasswordEventImpl;

  String get email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordEventImplCopyWith<_$ForgotPasswordEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordEventImplCopyWith<$Res> {
  factory _$$ResetPasswordEventImplCopyWith(_$ResetPasswordEventImpl value,
          $Res Function(_$ResetPasswordEventImpl) then) =
      __$$ResetPasswordEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token, String newPassword, String confirmPassword});
}

/// @nodoc
class __$$ResetPasswordEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResetPasswordEventImpl>
    implements _$$ResetPasswordEventImplCopyWith<$Res> {
  __$$ResetPasswordEventImplCopyWithImpl(_$ResetPasswordEventImpl _value,
      $Res Function(_$ResetPasswordEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$ResetPasswordEventImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResetPasswordEventImpl implements ResetPasswordEvent {
  const _$ResetPasswordEventImpl(
      {required this.token,
      required this.newPassword,
      required this.confirmPassword});

  @override
  final String token;
  @override
  final String newPassword;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'AuthEvent.resetPassword(token: $token, newPassword: $newPassword, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordEventImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, token, newPassword, confirmPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordEventImplCopyWith<_$ResetPasswordEventImpl> get copyWith =>
      __$$ResetPasswordEventImplCopyWithImpl<_$ResetPasswordEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return resetPassword(token, newPassword, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return resetPassword?.call(token, newPassword, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(token, newPassword, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordEvent implements AuthEvent {
  const factory ResetPasswordEvent(
      {required final String token,
      required final String newPassword,
      required final String confirmPassword}) = _$ResetPasswordEventImpl;

  String get token;
  String get newPassword;
  String get confirmPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordEventImplCopyWith<_$ResetPasswordEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutEventImplCopyWith<$Res> {
  factory _$$LogoutEventImplCopyWith(
          _$LogoutEventImpl value, $Res Function(_$LogoutEventImpl) then) =
      __$$LogoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutEventImpl>
    implements _$$LogoutEventImplCopyWith<$Res> {
  __$$LogoutEventImplCopyWithImpl(
      _$LogoutEventImpl _value, $Res Function(_$LogoutEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutEventImpl implements LogoutEvent {
  const _$LogoutEventImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class LogoutEvent implements AuthEvent {
  const factory LogoutEvent() = _$LogoutEventImpl;
}

/// @nodoc
abstract class _$$RefreshTokenEventImplCopyWith<$Res> {
  factory _$$RefreshTokenEventImplCopyWith(_$RefreshTokenEventImpl value,
          $Res Function(_$RefreshTokenEventImpl) then) =
      __$$RefreshTokenEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshTokenEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RefreshTokenEventImpl>
    implements _$$RefreshTokenEventImplCopyWith<$Res> {
  __$$RefreshTokenEventImplCopyWithImpl(_$RefreshTokenEventImpl _value,
      $Res Function(_$RefreshTokenEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshTokenEventImpl implements RefreshTokenEvent {
  const _$RefreshTokenEventImpl();

  @override
  String toString() {
    return 'AuthEvent.refreshToken()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshTokenEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return refreshToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return refreshToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (refreshToken != null) {
      return refreshToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return refreshToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return refreshToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (refreshToken != null) {
      return refreshToken(this);
    }
    return orElse();
  }
}

abstract class RefreshTokenEvent implements AuthEvent {
  const factory RefreshTokenEvent() = _$RefreshTokenEventImpl;
}

/// @nodoc
abstract class _$$ClearStateEventImplCopyWith<$Res> {
  factory _$$ClearStateEventImplCopyWith(_$ClearStateEventImpl value,
          $Res Function(_$ClearStateEventImpl) then) =
      __$$ClearStateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearStateEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ClearStateEventImpl>
    implements _$$ClearStateEventImplCopyWith<$Res> {
  __$$ClearStateEventImplCopyWithImpl(
      _$ClearStateEventImpl _value, $Res Function(_$ClearStateEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearStateEventImpl implements ClearStateEvent {
  const _$ClearStateEventImpl();

  @override
  String toString() {
    return 'AuthEvent.clearState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearStateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return clearState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return clearState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return clearState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return clearState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState(this);
    }
    return orElse();
  }
}

abstract class ClearStateEvent implements AuthEvent {
  const factory ClearStateEvent() = _$ClearStateEventImpl;
}

/// @nodoc
abstract class _$$RequireAuthEventImplCopyWith<$Res> {
  factory _$$RequireAuthEventImplCopyWith(_$RequireAuthEventImpl value,
          $Res Function(_$RequireAuthEventImpl) then) =
      __$$RequireAuthEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String action, String? message});
}

/// @nodoc
class __$$RequireAuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RequireAuthEventImpl>
    implements _$$RequireAuthEventImplCopyWith<$Res> {
  __$$RequireAuthEventImplCopyWithImpl(_$RequireAuthEventImpl _value,
      $Res Function(_$RequireAuthEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? message = freezed,
  }) {
    return _then(_$RequireAuthEventImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RequireAuthEventImpl implements RequireAuthEvent {
  const _$RequireAuthEventImpl({required this.action, this.message});

  @override
  final String action;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthEvent.requireAuth(action: $action, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequireAuthEventImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action, message);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequireAuthEventImplCopyWith<_$RequireAuthEventImpl> get copyWith =>
      __$$RequireAuthEventImplCopyWithImpl<_$RequireAuthEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signIn,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        signUp,
    required TResult Function(
            String oldPassword, String newPassword, String confirmPassword)
        changePassword,
    required TResult Function(String email) forgotPassword,
    required TResult Function(
            String token, String newPassword, String confirmPassword)
        resetPassword,
    required TResult Function() logout,
    required TResult Function() refreshToken,
    required TResult Function() clearState,
    required TResult Function(String action, String? message) requireAuth,
  }) {
    return requireAuth(action, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signIn,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult? Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult? Function()? logout,
    TResult? Function()? refreshToken,
    TResult? Function()? clearState,
    TResult? Function(String action, String? message)? requireAuth,
  }) {
    return requireAuth?.call(action, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signIn,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        signUp,
    TResult Function(
            String oldPassword, String newPassword, String confirmPassword)?
        changePassword,
    TResult Function(String email)? forgotPassword,
    TResult Function(String token, String newPassword, String confirmPassword)?
        resetPassword,
    TResult Function()? logout,
    TResult Function()? refreshToken,
    TResult Function()? clearState,
    TResult Function(String action, String? message)? requireAuth,
    required TResult orElse(),
  }) {
    if (requireAuth != null) {
      return requireAuth(action, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatusEvent value) checkAuthStatus,
    required TResult Function(SignInEvent value) signIn,
    required TResult Function(SignUpEvent value) signUp,
    required TResult Function(ChangePasswordEvent value) changePassword,
    required TResult Function(ForgotPasswordEvent value) forgotPassword,
    required TResult Function(ResetPasswordEvent value) resetPassword,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(RefreshTokenEvent value) refreshToken,
    required TResult Function(ClearStateEvent value) clearState,
    required TResult Function(RequireAuthEvent value) requireAuth,
  }) {
    return requireAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult? Function(SignInEvent value)? signIn,
    TResult? Function(SignUpEvent value)? signUp,
    TResult? Function(ChangePasswordEvent value)? changePassword,
    TResult? Function(ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(ResetPasswordEvent value)? resetPassword,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(RefreshTokenEvent value)? refreshToken,
    TResult? Function(ClearStateEvent value)? clearState,
    TResult? Function(RequireAuthEvent value)? requireAuth,
  }) {
    return requireAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatusEvent value)? checkAuthStatus,
    TResult Function(SignInEvent value)? signIn,
    TResult Function(SignUpEvent value)? signUp,
    TResult Function(ChangePasswordEvent value)? changePassword,
    TResult Function(ForgotPasswordEvent value)? forgotPassword,
    TResult Function(ResetPasswordEvent value)? resetPassword,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(RefreshTokenEvent value)? refreshToken,
    TResult Function(ClearStateEvent value)? clearState,
    TResult Function(RequireAuthEvent value)? requireAuth,
    required TResult orElse(),
  }) {
    if (requireAuth != null) {
      return requireAuth(this);
    }
    return orElse();
  }
}

abstract class RequireAuthEvent implements AuthEvent {
  const factory RequireAuthEvent(
      {required final String action,
      final String? message}) = _$RequireAuthEventImpl;

  String get action;
  String? get message;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequireAuthEventImplCopyWith<_$RequireAuthEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
