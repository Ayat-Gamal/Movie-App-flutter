import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/core/config/theme/app_theme.dart';
import 'package:movie_app/splash/cubit/splash_cubit.dart';
import 'package:movie_app/splash/splash.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.secondary),
    );

    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
        child: ScreenUtilInit(
          child: MaterialApp(
            title: 'Movie App',
            theme: AppTheme.appTheme,
            home: Splash(),
          ),
        ),
    );
  }
}
