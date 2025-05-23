import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

class ReleaseDate extends StatelessWidget {
  final DateTime releaseDate;

  const ReleaseDate({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(size: 12, color: AppColors.primary, Icons.calendar_month),

        Text(' ${releaseDate.toString().split(' ')[0]}'
        ,style: TextStyle(
            color: AppColors.primary
          ),
        ),
      ],
    );
  }
}
