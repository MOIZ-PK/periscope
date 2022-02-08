import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckUserLoggedIn>(_handleUserLoggedInCheck);
  }

  Future<void> _handleUserLoggedInCheck(
      CheckUserLoggedIn event, Emitter<AuthState> emit) async {
    emit(UserLoggedInProgress());

    emit(UserLoggedInSuccess());
  }
}
