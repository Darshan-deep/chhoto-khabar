import 'package:chhoto_khabar/shared/exceptions/validation_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  // Initial state - no authentication attempt made
  const factory AuthState.initial() = AuthInitial;
  
  // Loading state for any auth operation
  const factory AuthState.loading() = AuthLoading;
  
  // User is authenticated with access and refresh tokens
  const factory AuthState.authenticated({
    required String accessToken,
    required String refreshToken,
  }) = AuthAuthenticated;
  
  // User is not authenticated (can still browse news)
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  
  // Authentication required for specific action
  const factory AuthState.authRequired({
    required String action,
    required String message,
  }) = AuthRequired;
  
  // Authentication/operation failed
  const factory AuthState.failure(AppException exception) = AuthFailure;
  
  // Validation errors (e.g., during signup/signin)
  const factory AuthState.validationError(ValidationError validationErrors) = AuthValidationError;
  
  // Specific success states for different operations
  const factory AuthState.signUpSuccess({
    required String message,
    String? email, // For email verification flow
  }) = AuthSignUpSuccess;
  
  const factory AuthState.passwordChangeSuccess({
    required String message,
  }) = AuthPasswordChangeSuccess;
  
  const factory AuthState.forgotPasswordSuccess({
    required String message,
    required String email,
  }) = AuthForgotPasswordSuccess;
  
  const factory AuthState.resetPasswordSuccess({
    required String message,
  }) = AuthResetPasswordSuccess;
  
  // Logout success - user returns to guest mode
  const factory AuthState.logoutSuccess() = AuthLogoutSuccess;
}