part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.checkAuthentication() = CheckAuthenticationEvent;
  const factory UserEvent.loadUser() = LoadUserEvent;
  const factory UserEvent.saveUser(User user) = SaveUserEvent;
  const factory UserEvent.clearUserData() = ClearUserDataEvent;
  const factory UserEvent.refreshUser() = RefreshUserEvent;
}
