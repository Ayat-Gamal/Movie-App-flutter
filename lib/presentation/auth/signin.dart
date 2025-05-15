import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/auth/signup.dart';
import '../../common/helper/navigation/app_navigation.dart';
import '../../core/config/theme/app_colors.dart';


class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            _signinText(),
            SizedBox(height: 30),
            _emailField(),
            SizedBox(height: 30),
            _passwordField(),

            SizedBox(height: 30),
            _signinButton(),
            SizedBox(height: 30),

            _signupText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      "Sign In",
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
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }

  Widget _signinButton() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 78  ,vertical: 16),
        backgroundColor: AppColors.headlines,
          side: BorderSide(color: Colors.white, width: 2),

      ),
      child: Text(
        'Sign In',
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
            text: "Don't you have an account?"
        ),
        TextSpan(
            text: " Sign up",
          style: TextStyle(
            color: Colors.blue,
            
          ),
            recognizer: TapGestureRecognizer()..onTap =(){
          //  print("Sign up text pressed");
          AppNavigation.push(context, Signup());
          }
        ),

      ]
    )

    );
  }
}
