// lib/src/features/profile/presentation/bloc/profile_event.dart
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.checkAuthAndLoad() = CheckAuthAndLoadEvent;
  const factory ProfileEvent.loadProfile() = LoadProfileEvent;
  const factory ProfileEvent.refreshProfile() = RefreshProfileEvent;
  const factory ProfileEvent.updateProfile({required Map<String, dynamic> data}) = UpdateProfileEvent;
  const factory ProfileEvent.logout() = LogoutEvent;
}