import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../common/helper/navigation/app_navigation.dart';
import '../auth/signin.dart';
import '../home/home.dart';
import 'cubit/splash_cubit.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: ( context, state) {

          if (state is UnAuthenticated) {
              AppNavigation.pushReplacement(context, Signin());

          }
          if (state is Authenticated) {
            AppNavigation.pushReplacement(context, Home());

          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/film_slate.png",
                alignment: Alignment.center,
              ),
              SizedBox(height: 16),
              Text(
                "Shofha",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
