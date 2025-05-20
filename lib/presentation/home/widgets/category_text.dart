import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

class CategoryText extends StatelessWidget {
  final String title;

  const CategoryText({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppColors.headlines,
        ),
      ),
    );
  }
}
