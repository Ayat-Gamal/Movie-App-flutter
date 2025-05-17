import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/theme/app_colors.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  final Widget? leading;

  const BasicAppbar({
    this.title,
    this.action,
    this.backgroundColor,
    this.leading,
    this.hideBack = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80,
      title: title ?? Text(' '),
      titleSpacing: 0,
     // centerTitle: true,
      leadingWidth: leading != null ? 56 : null,
      actions: [action ?? Container()],
      leading:
          leading ??
          (hideBack
              ? null
              : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.bagie,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 15,
                    color: AppColors.headlines,
                  ),
                ),
              )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
