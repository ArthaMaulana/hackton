import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_day2/bloc/auth/auth_bloc.dart';
import 'package:flutter_day2/config/const.dart';
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
    super.initState();
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
                  title: Text("Gagal"),
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
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Ensures the Column takes the minimum space needed
            children: [
              Image.asset(
                'assets/images/logo.png', // Path to your image
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 4), // Space between image and text
              const Text(
                "AgriWave",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: appBarBackgroundColor, // Adjust color as needed
                ),
              ),
              const SizedBox(
                  height: 200), // Space between text and loading indicator
              const CircularProgressIndicator(), // Loading indicator
            ],
          ),
        ),
      ),
    );
  }
}
