part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = Initial;
  const factory UserState.loading() = Loading;
  const factory UserState.authenticated(User user) = Authenticated;
  const factory UserState.unauthenticated() = Unauthenticated;
  const factory UserState.error(String message) = Error;
}
