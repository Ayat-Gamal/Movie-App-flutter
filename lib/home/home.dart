import 'package:flutter/material.dart';
import 'package:movie_app/components/custom_appbar.dart';

import 'component/movie_list_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      appBar: CustomAppbar(appbarTitle: "Home"),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MovieListView()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
