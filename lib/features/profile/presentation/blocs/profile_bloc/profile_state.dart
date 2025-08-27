// lib/src/features/profile/presentation/bloc/profile_state.dart
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/profile_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = InitialState;
  const factory ProfileState.checkingAuth() = CheckingAuthState;
  const factory ProfileState.unauthenticated() = UnauthenticatedState;
  const factory ProfileState.loading() = LoadingState;
  const factory ProfileState.loaded({required ProfileModel profile}) = LoadedState;
  const factory ProfileState.updating({required ProfileModel currentProfile}) = UpdatingState;
  const factory ProfileState.updated({required ProfileModel profile}) = UpdatedState;
  const factory ProfileState.error({required AppException exception}) = ErrorState;
  const factory ProfileState.updateError({
    required AppException exception,
    required ProfileModel currentProfile,
  }) = UpdateErrorState;
}