import 'package:flutter/material.dart';

import '../../../core/config/theme/app_colors.dart';

class VideoVoteAverage extends StatelessWidget {
  final double voteAvg;

  const VideoVoteAverage({super.key, required this.voteAvg});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(Icons.star,
            color: Colors.amber,
            size: 20),

        Text(
          ' ${voteAvg.toStringAsFixed(1)}',
          style: TextStyle(color: AppColors.primary),
        ),
      ],
    );
  }
}
