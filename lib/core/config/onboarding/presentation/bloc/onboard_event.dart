part of 'onboard_bloc.dart';

@freezed
abstract class OnboardEvent with _$OnboardEvent {
  const factory OnboardEvent.checkIsOnboard() = CheckIsOnboard;
  const factory OnboardEvent.setOnboardStatus() = SetOnboardStatus;
}
