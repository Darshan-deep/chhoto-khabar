import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/repository/user_repository.dart';
import '../domain/usecase/get_remote_user_usecase.dart';
import '../domain/usecase/check_auth_status_usecase.dart';
import '../domain/usecase/clear_auth_data_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final GetRemoteUserUsecase _getRemoteUserUsecase;
  final CheckAuthStatusUsecase _checkAuthStatusUsecase;
  final ClearAuthDataUsecase _clearAuthDataUsecase;

  UserBloc(
    this._userRepository,
    this._getRemoteUserUsecase,
    this._checkAuthStatusUsecase,
    this._clearAuthDataUsecase,
  ) : super(const UserState.initial()) {
    on<CheckAuthenticationEvent>(_onCheckAuthentication);
    on<LoadUserEvent>(_onLoadUser);
    on<SaveUserEvent>(_onSaveUser);
    on<ClearUserDataEvent>(_onClearUserData);
    on<RefreshUserEvent>(_onRefreshUser);
  }

  Future<void> _onCheckAuthentication(
    CheckAuthenticationEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());
    
    try {
      final isAuthenticated = await _checkAuthStatusUsecase();
      
      if (isAuthenticated) {
        // Load user data if authenticated
        add(const LoadUserEvent());
      } else {
        emit(const UserState.unauthenticated());
      }
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }

  Future<void> _onLoadUser(
    LoadUserEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      final result = await _userRepository.getUser();
      
      result.fold(
        (exception) => emit(UserState.error(exception.message)),
        (user) => emit(UserState.authenticated(user)),
      );
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }

  Future<void> _onSaveUser(
    SaveUserEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      final result = await _userRepository.saveUser(user: event.user);
      
      result.fold(
        (exception) => emit(UserState.error(exception.message)),
        (message) => emit(UserState.authenticated(event.user)),
      );
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }

  Future<void> _onClearUserData(
    ClearUserDataEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      await _clearAuthDataUsecase();
      emit(const UserState.unauthenticated());
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }

  Future<void> _onRefreshUser(
    RefreshUserEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      final result = await _getRemoteUserUsecase();
      
      result.fold(
        (exception) => emit(UserState.error(exception.message)),
        (user) => emit(UserState.authenticated(user)),
      );
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }
}
