import 'package:equatable/equatable.dart';
import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';

class AuthResponse extends Equatable {
  final String accessToken;
  final String refreshToken;
  final User? user;

  const AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    this.user,
  });

  // Helper method to check if tokens are valid
  bool get hasValidTokens => accessToken.isNotEmpty && refreshToken.isNotEmpty;

  // Copy with method for updates
  AuthResponse copyWith({
    String? accessToken,
    String? refreshToken,
    User? user,
  }) {
    return AuthResponse(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      user: user ?? this.user,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthResponse &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.user == user;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode ^ user.hashCode;

  @override
  String toString() {
    return 'AuthResponse(accessToken: ${accessToken.substring(0, 10)}..., refreshToken: ${refreshToken.substring(0, 10)}..., user: $user)';
  }

  @override
  List<Object?> get props => [accessToken, refreshToken, user];
}