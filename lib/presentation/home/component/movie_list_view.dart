import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/movie_card.dart';



class MovieListView extends StatelessWidget {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,


      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        padding:  EdgeInsets.all(8),
        itemCount:16, itemBuilder: (BuildContext context, int index) {
          return MovieCard();

      },

      ),
    );
  }
}

