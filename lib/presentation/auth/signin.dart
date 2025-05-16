import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/auth/SigninReqParam.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/presentation/auth/signup.dart';
import 'package:reactive_button/reactive_button.dart';
import '../../common/helper/message/dispaly_message.dart';
import '../../common/helper/navigation/app_navigation.dart';
import '../../core/config/theme/app_colors.dart';
import '../../service_locator.dart';
import '../home/home.dart';

class Signin extends StatelessWidget {
  Signin({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            _signinButton(context),
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
      controller: _emailController,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }

  Widget _signinButton(BuildContext context) {
    return  ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => sl<SigninUseCase>().call(
          params: SigninReqParam(
              email: _emailController.text,
              password: _passwordController.text
          )
      ),
      onSuccess: () {
        AppNavigation.pushAndRemove(context,  Home());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );

  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Don't you have an account?"),
          TextSpan(
            text: " Sign up",
            style: TextStyle(color: Colors.blue),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    //  print("Sign up text pressed");
                    AppNavigation.push(context, Signup());
                  },
          ),
        ],
      ),
    );
  }
}
