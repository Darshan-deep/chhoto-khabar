part of 'onboard_bloc.dart';

@freezed
abstract class OnboardState with _$OnboardState {
  const factory OnboardState.initial() = Initial;
  const factory OnboardState.loading() = Loading;
  const factory OnboardState.loaded(bool isOnboard) = Loaded;
  const factory OnboardState.error(String message) = Error;
}
