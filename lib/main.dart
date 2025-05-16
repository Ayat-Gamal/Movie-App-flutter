import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/core/config/theme/app_theme.dart';
import 'package:movie_app/presentation/auth/signin.dart';
import 'package:movie_app/presentation/home/home.dart';
import 'package:movie_app/presentation/splash/cubit/splash_cubit.dart';
import 'package:movie_app/presentation/splash/splash.dart';
import 'package:movie_app/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Firebase.initializeApp();

  // Ideal time to initialize
  //await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);

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
