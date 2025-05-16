import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/presentation/auth/signin.dart';

import '../../core/components/custom_appbar.dart';

import 'component/movie_list_view.dart';

class Home extends StatelessWidget {
    Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const CustomAppbar(appbarTitle: "Home"),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const MovieListView(),
                  TextButton(onPressed: () async  {
                    await  FirebaseAuth.instance.signOut();
                    print("Sign out");
        AppNavigation.pushAndRemove(context, Signin());

                  }, child: const Text("Log out!"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
