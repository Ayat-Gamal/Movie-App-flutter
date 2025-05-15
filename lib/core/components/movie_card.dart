import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';


class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 130.w,
      height: 180.h,
       decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
         color: Colors.grey,

      ),
      padding: EdgeInsets.all(12),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Image.asset(
              "assets/images/test_poster.jpeg",

              fit: BoxFit.contain,
            ),

            CustomText(text: "JOKER"),
            CustomText(text: "2025"),
          ],
        ),

    );
  }
}
