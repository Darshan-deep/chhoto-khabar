// lib/src/features/profile/domain/models/profile_model.dart
class ProfileModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isStaff;
  final bool isSuperuser;
  final int bookmarksCount;

  const ProfileModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isSuperuser,
    required this.bookmarksCount,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      isStaff: json['is_staff'] ?? false,
      isSuperuser: json['is_superuser'] ?? false,
      bookmarksCount: json['bookmarks_count'] ?? 0,
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
      'bookmarks_count': bookmarksCount,
    };
  }

  ProfileModel copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    bool? isStaff,
    bool? isSuperuser,
    int? bookmarksCount,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isStaff: isStaff ?? this.isStaff,
      isSuperuser: isSuperuser ?? this.isSuperuser,
      bookmarksCount: bookmarksCount ?? this.bookmarksCount,
    );
  }

  String get fullName => '$firstName $lastName';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfileModel &&
        other.id == id &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.isStaff == isStaff &&
        other.isSuperuser == isSuperuser &&
        other.bookmarksCount == bookmarksCount;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      email,
      firstName,
      lastName,
      isStaff,
      isSuperuser,
      bookmarksCount,
    );
  }

  @override
  String toString() {
    return 'ProfileModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, isStaff: $isStaff, isSuperuser: $isSuperuser, bookmarksCount: $bookmarksCount)';
  }
}