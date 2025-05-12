import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/config/theme/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.appbarTitle});

  final String appbarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appbarTitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.sp,
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColors.primary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
