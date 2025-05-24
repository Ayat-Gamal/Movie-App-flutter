import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/auth/signup_req_param.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/presentation/auth/signin.dart';
import 'package:reactive_button/reactive_button.dart';
import '../../common/helper/message/dispaly_message.dart';
import '../../common/helper/navigation/app_navigation.dart';
import '../../core/config/theme/app_colors.dart';
import '../../domain/auth/usecases/signup.dart';
import '../../service_locator.dart';
import '../home/home.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

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
            _signupTextTitle(),
            SizedBox(height: 30),
            _emailField(),
            SizedBox(height: 30),
            _passwordField(),

            SizedBox(height: 30),
            _signupButton(context),
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
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }

  Widget _signupButton(context) {
    return ReactiveButton(
        title: "Sign Up",
        activeColor: AppColors.primary,
        onPressed: ()async => sl<SignupUseCase>().call(
          params: SignupReqParam(email: _emailController.text,
              password: _passwordController.text)
        ),
        onSuccess: (){
          AppNavigation.pushAndRemove(context, Home());
        }, onFailure: (error){
      DisplayMessage.errorMessage(error, context);


    }

    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Already have an account?"),
          TextSpan(
            text: " Sign In",
            style: TextStyle(color: Colors.blue),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    //  print("Sign up text pressed");
                    AppNavigation.push(context, Signin());
                  },
          ),
        ],
      ),
    );
  }
}
