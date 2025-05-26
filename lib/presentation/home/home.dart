import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widget/appbar/app_bar.dart';
import 'package:movie_app/core/components/custom_text.dart';
import 'package:movie_app/presentation/auth/signin.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_palying_movies.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv.dart';
import 'package:movie_app/presentation/home/widgets/trending_movies.dart';
import '../../core/config/theme/app_colors.dart';
import '../search/pages/search.dart';

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
        leading: IconButton(
            onPressed: (){
              AppNavigation.push(context, Search());
            }, icon: Icon(Icons.search,
          color: Colors.white,

        )),
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
          children: [
            CategoryText(title: "Trending 🔥"),
            TrendingMovies(),
            SizedBox(height: 16),
            CategoryText(title: "Now PLaying"),
            SizedBox(height: 16),
            NowPlayingMovies(),
            CategoryText(title: "Popular TV"),
            SizedBox(height: 16),
            PopularTv(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
