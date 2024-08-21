part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class onSignIn extends AuthEvent {
  final String email;
  final String password;

  onSignIn({required this.email, required this.password});
}

final class OnSignInCheck extends AuthEvent {}

final class OnSignOut extends AuthEvent {}
