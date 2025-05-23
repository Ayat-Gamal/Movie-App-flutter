import 'package:flutter/material.dart';

import '../../../core/config/theme/app_colors.dart';

class VideoTitle extends StatelessWidget {
  final String title;

  const VideoTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
