import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  // Check if user is already authenticated (on app start)
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatusEvent;
  
  // Sign in with email/password
  const factory AuthEvent.signIn({
    required String email,
    required String password,
  }) = SignInEvent;
  
  // Sign up with user details
  const factory AuthEvent.signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) = SignUpEvent;
  
  // Change password
  const factory AuthEvent.changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) = ChangePasswordEvent;
  
  // Forgot password
  const factory AuthEvent.forgotPassword({
    required String email,
  }) = ForgotPasswordEvent;
  
  // Reset password
  const factory AuthEvent.resetPassword({
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) = ResetPasswordEvent;
  
  // Logout
  const factory AuthEvent.logout() = LogoutEvent;
  
  // Refresh token
  const factory AuthEvent.refreshToken() = RefreshTokenEvent;
  
  // Clear auth state
  const factory AuthEvent.clearState() = ClearStateEvent;
  
  // Require authentication for an action
  const factory AuthEvent.requireAuth({
    required String action,
    String? message,
  }) = RequireAuthEvent;
}