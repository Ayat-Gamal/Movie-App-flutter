import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

class TrendingText extends StatelessWidget {
  const TrendingText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 16,left: 16
      ),
      child: Text(
          "Trending 🔥",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppColors.headlines
        ),
      ),
    );
  }
}
