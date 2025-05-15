import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/auth/signin.dart';

import '../../common/helper/navigation/app_navigation.dart';
import '../../core/config/theme/app_colors.dart';


class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            _signupTextTitle(),
            SizedBox(height: 30),
            _emailField(),
            SizedBox(height: 30),
            _passwordField(),

            SizedBox(height: 30),
            _signupButton(),
            SizedBox(height: 30),

            _signupText(context),
          ],
        ),
      ),
    );
  }

  Widget _signupTextTitle() {
    return Text(
      "Sign Up",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: AppColors.headlines,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }

  Widget _signupButton() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 78  ,vertical: 16),
        backgroundColor: AppColors.headlines,
        side: BorderSide(color: Colors.white, width: 2),

      ),
      child: Text(
        'Sign Up',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      onPressed: () {  print("Sign in pressed");},
    );
  }

  Widget _signupText(BuildContext context){
    return Text.rich(
        TextSpan(

            children: [
              TextSpan(
                  text: "Already have an account?"
              ),
              TextSpan(
                  text: " Sign In",
                  style: TextStyle(
                    color: Colors.blue,

                  ),
                  recognizer: TapGestureRecognizer()..onTap =(){
                    //  print("Sign up text pressed");
                    AppNavigation.push(context, Signin());
                  }
              ),

            ]
        )

    );
  }
}
