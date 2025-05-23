import 'package:flutter/material.dart';

import '../../../core/config/theme/app_colors.dart';

class VideoOverview extends StatelessWidget {
  final String overview;

  const VideoOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    const Text(
          'Overview',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primary,
          ),
        ),
      const  SizedBox(height: 10,),
        Text(overview,
          style: Theme
              .of(context)
              .primaryTextTheme
              .bodyMedium,
        )

      ],
    );
  }
}
