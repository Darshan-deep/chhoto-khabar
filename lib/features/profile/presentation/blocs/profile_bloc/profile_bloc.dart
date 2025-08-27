import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  final UserRepository _userRepository;

  ProfileBloc({
    required ProfileRepository profileRepository,
    required UserRepository userRepository,
  })  : _profileRepository = profileRepository,
        _userRepository = userRepository,
        super(const ProfileState.initial()) {
    
    on<CheckAuthAndLoadEvent>(_onCheckAuthAndLoad);
    on<LoadProfileEvent>(_onLoadProfile);
    on<RefreshProfileEvent>(_onRefreshProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onCheckAuthAndLoad(
    CheckAuthAndLoadEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.checkingAuth());
    
    try {
      print('🔐 ProfileBloc: Checking authentication...');
      
      // Add small delay to ensure tokens are saved
      await Future.delayed(const Duration(milliseconds: 100));
      
      final isAuthenticated = await _userRepository.isAuthenticated();
      print('🔐 ProfileBloc: Authentication result = $isAuthenticated');
      
      if (!isAuthenticated) {
        emit(const ProfileState.unauthenticated());
        return;
      }
      
      // User is authenticated, load profile
      add(const ProfileEvent.loadProfile());
    } catch (e) {
      print('🔐 ProfileBloc: Auth check error = $e');
      emit(const ProfileState.unauthenticated());
    }
  }

  Future<void> _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    
    try {
      final result = await _profileRepository.getProfile();
      
      result.fold(
        (exception) => emit(ProfileState.error(exception: exception)),
        (profile) => emit(ProfileState.loaded(profile: profile)),
      );
    } catch (e) {
      emit(ProfileState.error(exception: e as AppException));
    }
  }

  Future<void> _onRefreshProfile(
    RefreshProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    // Check auth first
    try {
      final isAuthenticated = await _userRepository.isAuthenticated();
      if (!isAuthenticated) {
        emit(const ProfileState.unauthenticated());
        return;
      }
      
      final result = await _profileRepository.getProfile();
      
      result.fold(
        (exception) => emit(ProfileState.error(exception: exception)),
        (profile) => emit(ProfileState.loaded(profile: profile)),
      );
    } catch (e) {
      emit(ProfileState.error(exception: e as AppException));
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    if (currentState is! LoadedState) return;
    
    emit(ProfileState.updating(currentProfile: currentState.profile));
    
    try {
      final result = await _profileRepository.updateProfile(data: event.data);
      
      result.fold(
        (exception) => emit(ProfileState.updateError(
          exception: exception,
          currentProfile: currentState.profile,
        )),
        (updatedProfile) => emit(ProfileState.updated(profile: updatedProfile)),
      );
    } catch (e) {
      emit(ProfileState.updateError(
        exception: e as AppException,
        currentProfile: currentState.profile,
      ));
    }
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await _userRepository.clearAuthData();
      emit(const ProfileState.unauthenticated());
    } catch (e) {

      emit(const ProfileState.unauthenticated());
    }
  }
}