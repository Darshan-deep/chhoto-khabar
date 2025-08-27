import 'package:chhoto_khabar/core/config/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboard_bloc.freezed.dart';
part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  final OnboardingRepository onboardingRepository;

  OnboardBloc(this.onboardingRepository) : super(const OnboardState.initial()) {
    on<CheckIsOnboard>(_checkIsOnboard);
    on<SetOnboardStatus>(_setOnboardStatus);
  }

  Future<void> _checkIsOnboard(
    CheckIsOnboard event,
    Emitter<OnboardState> emit,
  ) async {
    emit(const OnboardState.loading());
    final isOnboard = await onboardingRepository.isOnboard();
    isOnboard.fold(
      (l) => emit(OnboardState.error(l.message)),
      (isOnboard) => emit(OnboardState.loaded(isOnboard)),
    );
  }

  Future<void> _setOnboardStatus(
    SetOnboardStatus event,
    Emitter<OnboardState> emit,
  ) async {
    emit(const OnboardState.loading());
    final isOnboard = await onboardingRepository.setOnboardStatus();
    isOnboard.fold(
      (l) => emit(OnboardState.error(l.message)),
      (isOnboard) => emit(OnboardState.loaded(isOnboard)),
    );
  }
}
