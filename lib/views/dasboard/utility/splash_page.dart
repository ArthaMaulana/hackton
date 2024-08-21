import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_day2/bloc/auth/auth_bloc.dart';
import 'package:flutter_day2/views/auth/login_page.dart';
import 'package:flutter_day2/views/dasboard/dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      context.read<AuthBloc>().add(OnSignInCheck());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignInCheckWaiting) {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              });
        }
        if (state is SignCheckInError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("gagal"),
                );
              });
        }
        if (state is SignInCheckSucces) {
          if (state.token == "" || state.token == "null") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardPage(),
                ));
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Image.asset(
          'assets/images/logo.png', // Update with your image path
          width: 200,
          height: 200,
        )),
      ),
    );
  }
}
