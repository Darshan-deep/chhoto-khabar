import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';


class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.isStaff,
    required super.isSuperuser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      isStaff: json['is_staff'] as bool,
      isSuperuser: json['is_superuser'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'is_staff': isStaff,
      'is_superuser': isSuperuser,
    };
  }

  User toEntity() {
    return User(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      isStaff: isStaff,
      isSuperuser: isSuperuser,
    );
  }
}