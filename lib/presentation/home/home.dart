import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widget/appbar/app_bar.dart';
import 'package:movie_app/core/components/custom_text.dart';
import 'package:movie_app/presentation/auth/signin.dart';
import 'package:movie_app/presentation/home/widgets/trending_movies.dart';
import 'package:movie_app/presentation/home/widgets/trending_text.dart';
import '../../core/config/theme/app_colors.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: CustomText(text: "Home", size: 28, color: Colors.white),
        backgroundColor: AppColors.primary,
        height: 50,

        action: TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            print("Sign out");
            AppNavigation.pushAndRemove(context, Signin());
          },
          child: const Icon(
            Icons.logout_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [TrendingText(), TrendingMovies()],
        ),
      ),
    );
  }
}
