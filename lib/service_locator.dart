import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/datasources/auth/auth_firebase_service.dart';
import 'package:movie_app/data/repositories/auth/auth.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';

import 'domain/auth/usecases/signin.dart';
import 'domain/auth/usecases/signup.dart';

final sl = GetIt.instance;

//DI => we register repositories and datasource

void setupServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());
  //service
  sl.registerSingleton<AuthService>(AuthFirebaseServiceImpl());

  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  //UseCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

}