import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_day2/models/respone_login.dart';
import 'package:flutter_day2/source/auth_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<onSignIn>((event, emit) async {
      emit(SignInWaiting());
      ResponseSignIn? responseSignIn =
          await AuthSource.getSignIn(event.email, event.password);
      if (responseSignIn == null) {
        emit(SingInError(message: "Terjadi kesalahn"));
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", responseSignIn.accessToken ?? "");
        emit(SignInSucces(responSignIn: responseSignIn));
      }
    });

    on<OnSignInCheck>(
      (event, emit) async {
        emit(SignInWaiting());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString("token");
        emit(SignInCheckSucces(token: token ?? ""));
      },
    );

    on<OnSignOut>((event, emit) async {
      emit(SignOutWaiting());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      emit(SignOutSucces());
    });
  }
}
