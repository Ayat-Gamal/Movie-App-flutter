import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/datasources/auth/auth_firebase_service.dart';
import 'package:movie_app/data/datasources/movie/movie_service.dart';
import 'package:movie_app/data/repositories/auth/auth.dart';
 import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app/domain/moive/usecases/get_trending_movie.dart';

import 'data/repositories/movie/movie_repo_impl.dart';
import 'domain/auth/usecases/signin.dart';
import 'domain/auth/usecases/signup.dart';
import 'domain/moive/repositories/movie_repo.dart';

final sl = GetIt.instance;

//DI => we register repositories and datasource

void setupServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());
  //service
  sl.registerSingleton<AuthService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());

  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  //UseCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMovieUseCase>(GetTrendingMovieUseCase());

}