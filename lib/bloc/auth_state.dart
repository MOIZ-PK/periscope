part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class UserLoggedInSuccess extends AuthState {}

class UserLoggedInProgress extends AuthState {}

class UserLoggedInFailure extends AuthState {
  final String errorMessage;

  UserLoggedInFailure({required this.errorMessage});
}
