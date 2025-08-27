import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:chhoto_khabar/features/auth/domain/entity/authResponse.dart';
import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/logout_usecase.dart';

import 'package:chhoto_khabar/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:chhoto_khabar/shared/data/local/shared_pref_service.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final LogoutUseCase _logoutUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final SharedPrefsService _prefsService;
  final UserRepository _userRepository; // ✅ Add this

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required LogoutUseCase logoutUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
    required ChangePasswordUseCase changePasswordUseCase,
    required SharedPrefsService prefsService,
    required UserRepository userRepository, // ✅ Add this
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _logoutUseCase = logoutUseCase,
        _forgotPasswordUseCase = forgotPasswordUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _changePasswordUseCase = changePasswordUseCase,
        _prefsService = prefsService,
        _userRepository = userRepository, // ✅ Add this
        super(const AuthState.initial()) {
    
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<ChangePasswordEvent>(_onChangePassword);
    on<ForgotPasswordEvent>(_onForgotPassword);
    on<ResetPasswordEvent>(_onResetPassword);
    on<LogoutEvent>(_onLogout);
    on<RefreshTokenEvent>(_onRefreshToken);
    on<ClearStateEvent>(_onClearState);
    on<RequireAuthEvent>(_onRequireAuth);
  }

  // Check if user is authenticated on app start
  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    try {
      final accessToken = await _prefsService.getString(_accessTokenKey);
      final refreshToken = await _prefsService.getString(_refreshTokenKey);

      if (accessToken != null && refreshToken != null) {
        // Tokens exist, user is authenticated
        emit(AuthState.authenticated(
          accessToken: accessToken,
          refreshToken: refreshToken,
        ));
      } else {
        // No stored credentials, user is unauthenticated but can still browse
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      // Error reading stored data, treat as unauthenticated
      await _clearAuthData();
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final result = await _signInUseCase.call(
        SignInParams(email: event.email, password: event.password),
      );

      await result.fold(
        (failure) async {
          if (failure.validationErrors != null) {
            emit(AuthState.validationError(failure.validationErrors!));
          } else if (failure.statusCode == 401) {
            emit(AuthState.failure(
              AppException(
                message: 'Invalid email or password',
                statusCode: 401, identifier: '',
              ),
            ));
          } else if (failure.statusCode == 429) {
            emit(AuthState.failure(
              AppException(
                message: 'Too many login attempts. Please try again later.',
                statusCode: 429, identifier: 'tooManyAttemptsError',
              ),
            ));
          } else {
            emit(AuthState.failure(failure));
          }
        },
        (authResponse) async {
          try {
            // Store only tokens
            await _storeAuthData(authResponse.accessToken, authResponse.refreshToken);
            
            emit(AuthState.authenticated(
              accessToken: authResponse.accessToken,
              refreshToken: authResponse.refreshToken,
            ));
          } catch (storageError) {
            // Handle storage errors
            emit(AuthState.failure(
              AppException(
                message: 'Failed to save login information',
                statusCode: 500, identifier: 'signInError',
              ),
            ));
          }
        },
      );
    } catch (e) {
      // Handle unexpected errors
      emit(AuthState.failure(
        AppException(
          message: 'An unexpected error occurred during sign in',
          statusCode: 500, identifier: 'signInError',
        ),
      ));
    }
  }

  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final result = await _signUpUseCase.call(
        SignUpParams(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
        ),
      );

      await result.fold(
        (failure) async {
          if (failure.validationErrors != null) {
            emit(AuthState.validationError(failure.validationErrors!));
          } else {
            emit(AuthState.failure(failure));
          }
        },
        (authResponse) async {
          try {
            // Store only tokens
            await _storeAuthData(authResponse.accessToken, authResponse.refreshToken);
            
            emit(AuthState.authenticated(
              accessToken: authResponse.accessToken,
              refreshToken: authResponse.refreshToken,
            ));
          } catch (storageError) {
            emit(AuthState.failure(
              AppException(
                message: 'Failed to save registration information',
                statusCode: 500, identifier: 'signUpError',
              ),
            ));
          }
        },
      );
    } catch (e) {
      emit(AuthState.failure(
        AppException(
          message: 'An unexpected error occurred during sign up',
          statusCode: 500, identifier: 'signUpError',
        ),
      ));
    }
  }

  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    // Only allow if authenticated
    if (!isAuthenticated) {
      emit(const AuthState.authRequired(
        action: 'change password',
        message: 'Please login to change your password',
      ));
      return;
    }

    emit(const AuthState.loading());

    try {
      final result = await _changePasswordUseCase.call(
        ChangePasswordParams(
          oldPassword: event.oldPassword,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
        ),
      );

      result.fold(
        (failure) {
          if (failure.validationErrors != null) {
            emit(AuthState.validationError(failure.validationErrors!));
          } else {
            emit(AuthState.failure(failure));
          }
        },
        (_) => emit(const AuthState.passwordChangeSuccess(
          message: 'Password changed successfully',
        )),
      );
    } catch (e) {
      emit(AuthState.failure(
        AppException(
          message: 'An unexpected error occurred while changing password',
          statusCode: 500, identifier: 'changePasswordError',
        ),
      ));
    }
  }

  Future<void> _onForgotPassword(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final result = await _forgotPasswordUseCase.call(
        ForgotPasswordParams(email: event.email),
      );

      result.fold(
        (failure) => emit(AuthState.failure(failure)),
        (_) => emit(AuthState.forgotPasswordSuccess(
          message: 'Password reset link sent to your email',
          email: event.email,
        )),
      );
    } catch (e) {
      emit(AuthState.failure(
        AppException(
          message: 'An unexpected error occurred',
          statusCode: 500, identifier: 'forgotPasswordError',
        ),
      ));
    }
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final result = await _resetPasswordUseCase.call(
        ResetPasswordParams(
          token: event.token,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
        ),
      );

      result.fold(
        (failure) {
          if (failure.validationErrors != null) {
            emit(AuthState.validationError(failure.validationErrors!));
          } else {
            emit(AuthState.failure(failure));
          }
        },
        (_) => emit(const AuthState.resetPasswordSuccess(
          message: 'Password reset successfully',
        )),
      );
    } catch (e) {
      emit(AuthState.failure(
        AppException(
          message: 'An unexpected error occurred while resetting password',
          statusCode: 500, identifier: 'resetPasswordError',
        ),
      ));
    }
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final hasNetwork = await _hasNetworkConnection();
    
    if (hasNetwork) {
      // Call logout API
      final result = await _logoutUseCase.call();
      
      // Log API errors but don't prevent logout
      result.fold(
        (failure) {
          // Log the error for debugging but continue with logout
          print('Logout API failed: ${failure.message}');
        },
        (_) {
          // API logout successful
        },
      );
    }
    
    // Always clear stored data regardless of API response
    try {
      await _clearAuthData();
      emit(const AuthState.logoutSuccess());
    } catch (e) {
      // Even if clearing fails, emit success to prevent user from being stuck
      print('Failed to clear auth data: $e');
      emit(const AuthState.logoutSuccess());
    }
  }

  Future<void> _onRefreshToken(
    RefreshTokenEvent event,
    Emitter<AuthState> emit,
  ) async {
    // For a news app, we don't implement automatic refresh
    // When token expires, user will need to login again
    // This keeps the implementation simple and secure
    await _clearAuthData();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onClearState(
    ClearStateEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _clearAuthData();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onRequireAuth(
    RequireAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (!isAuthenticated) {
      emit(AuthState.authRequired(
        action: event.action,
        message: event.message ?? 'Please login to ${event.action}',
      ));
    }
  }

  // Helper methods
  Future<void> _storeAuthData(String accessToken, String refreshToken) async {
    await _prefsService.setString(_accessTokenKey, accessToken);
    await _prefsService.setString(_refreshTokenKey, refreshToken);
  }

  Future<void> _clearAuthData() async {
    await _prefsService.remove(_accessTokenKey);
    await _prefsService.remove(_refreshTokenKey);
  }

  Future<bool> _hasNetworkConnection() async {
    try {
      // You might want to use connectivity_plus package
      // For now, this is a placeholder
      return true;
    } catch (e) {
      return false;
    }
  }

  // Access Control Methods
  
  /// Check if user is authenticated
  bool get isAuthenticated => state.maybeWhen(
    authenticated: (_, __) => true,
    orElse: () => false,
  );

  /// Get access token
  String? get accessToken => state.maybeWhen(
    authenticated: (token, _) => token,
    orElse: () => null,
  );

  /// Get refresh token  
  String? get refreshToken => state.maybeWhen(
    authenticated: (_, refreshToken) => refreshToken,
    orElse: () => null,
  );

  /// Execute action if authenticated, otherwise emit auth required
  void executeIfAuthenticated(String action, VoidCallback callback, {String? message}) {
    if (isAuthenticated) {
      callback();
    } else {
      add(AuthEvent.requireAuth(
        action: action,
        message: message,
      ));
    }
  }

  /// Check if token is likely expired (simple check using JWT)
  bool get isTokenLikelyExpired {
    final token = accessToken;
    if (token == null) return true;
    
    try {
      // Simple JWT expiry check
      final parts = token.split('.');
      if (parts.length != 3) return true;
      
      final payload = parts[1];
      // Add padding if needed
      final paddedPayload = payload + '=' * (4 - payload.length % 4);
      final decoded = utf8.decode(base64.decode(paddedPayload));
      final Map<String, dynamic> payloadMap = jsonDecode(decoded);
      
      final exp = payloadMap['exp'] as int?;
      if (exp == null) return false;
      
      // Check if token expires in the next 5 minutes
      final expiryTime = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      final now = DateTime.now();
      return expiryTime.isBefore(now.add(const Duration(minutes: 5)));
      
    } catch (e) {
      // If we can't decode, assume it's expired
      return true;
    }
  }

  /// Auto-refresh token when needed - Simplified for news app
  void refreshTokenIfNeeded() {
    if (isAuthenticated && isTokenLikelyExpired) {
      // For news app: just logout when token expires
      // User can continue browsing as guest
      add(const AuthEvent.refreshToken());
    }
  }

  /// Validate session - Simplified for news app
  Future<bool> validateSession() async {
    if (!isAuthenticated) return false;
    
    if (isTokenLikelyExpired) {
      // For news app: just logout and let user continue as guest
      add(const AuthEvent.refreshToken());
      return false;
    }
    
    return true;
  }

  /// Execute action with automatic session validation - Simplified
  Future<void> executeWithSessionValidation(
    String action,
    Future<void> Function() callback, {
    String? message,
  }) async {
    final isValid = await validateSession();
    
    if (isValid) {
      await callback();
    } else {
      add(AuthEvent.requireAuth(
        action: action,
        message: message ?? 'Please login to $action',
      ));
    }
  }

  /// Force logout without API call (for emergency situations)
  void forceLogout() {
    add(const AuthEvent.clearState());
  }

  /// Get stored access token directly from storage (useful for interceptors)
  Future<String?> getStoredAccessToken() async {
    return await _prefsService.getString(_accessTokenKey);
  }

  /// Get stored refresh token directly from storage (useful for interceptors)
  Future<String?> getStoredRefreshToken() async {
    return await _prefsService.getString(_refreshTokenKey);
  }

  /// Update tokens in storage without changing state (useful for interceptors)
  Future<void> updateTokensInStorage(String newAccessToken, String newRefreshToken) async {
    await _storeAuthData(newAccessToken, newRefreshToken);
  }

  /// Check if tokens exist in storage
  Future<bool> hasStoredTokens() async {
    final accessToken = await _prefsService.getString(_accessTokenKey);
    final refreshToken = await _prefsService.getString(_refreshTokenKey);
    return accessToken != null && refreshToken != null;
  }
}