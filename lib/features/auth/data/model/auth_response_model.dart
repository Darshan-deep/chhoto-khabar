import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:chhoto_khabar/features/auth/domain/entity/authResponse.dart';

class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final User? user;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['access'] ?? '',
      refreshToken: json['refresh'] ?? '',
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access': accessToken,
      'refresh': refreshToken,
      if (user != null) 'user': user!.toJson(),
    };
  }

  // Convert data model to domain entity
  AuthResponse toEntity() {
    return AuthResponse(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user,
    );
  }

  // Helper method to validate tokens
  bool get hasValidTokens => accessToken.isNotEmpty && refreshToken.isNotEmpty;

  // Create AuthResponseModel with just tokens
  factory AuthResponseModel.tokensOnly({
    required String accessToken,
    required String refreshToken,
  }) {
    return AuthResponseModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: null,
    );
  }
}