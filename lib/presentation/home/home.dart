import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widget/appbar/app_bar.dart';
import 'package:movie_app/core/components/custom_text.dart';
import 'package:movie_app/presentation/auth/signin.dart';
import '../../core/config/theme/app_colors.dart';
import 'component/movie_list_view.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,

        title: Padding(
          padding: const EdgeInsets.only(left: 16),

          child: CustomText(text: "Home", size: 28, color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        height: 50,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 16),
        //   child: SvgPicture.asset(AppVectors.logo128, height: 56, width: 56),
        // ),
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

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [const MovieListView()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
