part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInWaiting extends AuthState {}

final class SingInError extends AuthState {
  final String message;

  SingInError({required this.message});
}

final class SignInSucces extends AuthState {
  final ResponseSignIn responSignIn;

  SignInSucces({required this.responSignIn});
}

final class SignInCheckWaiting extends AuthState {}

final class SignCheckInError extends AuthState {
  final String message;

  SignCheckInError({required this.message});
}

final class SignInCheckSucces extends AuthState {
  final String token;

  SignInCheckSucces({required this.token});
}

final class SignOutWaiting extends AuthState {}

final class SignOutError extends AuthState {
  final String message;

  SignOutError({required this.message});
}

final class SignOutSucces extends AuthState {}
