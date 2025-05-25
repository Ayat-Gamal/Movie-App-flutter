import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/datasources/auth/auth_firebase_service.dart';
import 'package:movie_app/data/datasources/movie/movie_service.dart';
import 'package:movie_app/data/repositories/auth/auth.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app/domain/moive/usecases/get_now_playing_movies.dart';
import 'package:movie_app/domain/moive/usecases/get_recommendation_movies.dart';
import 'package:movie_app/domain/moive/usecases/get_similar_movies.dart';
import 'package:movie_app/domain/moive/usecases/get_trending_movie.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/domain/tv/usecase/get_popular_tv.dart';
import 'package:movie_app/domain/tv/usecase/get_recommendation_tvs.dart';
import 'package:movie_app/domain/tv/usecase/get_similar_tvs.dart';
import 'data/datasources/tv/tv_service.dart';
import 'data/repositories/movie/movie_repo_impl.dart';
import 'data/repositories/tv/tv_repo_impl.dart';
import 'domain/auth/usecases/signin.dart';
import 'domain/auth/usecases/signup.dart';
import 'domain/moive/repositories/movie_repo.dart';
import 'domain/moive/usecases/get_keywords.dart';
import 'domain/moive/usecases/get_movie_trailer.dart';

final sl = GetIt.instance;

//DI => we register repositories and datasource

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  //service
  sl.registerSingleton<AuthService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());
  sl.registerSingleton<TVService>(TVServiceImpl());

  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  //UseCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMovieUseCase>(GetTrendingMovieUseCase());
  sl.registerSingleton<GetNowPlayingMovieUseCase>(GetNowPlayingMovieUseCase());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMovieUseCase>(GetRecommendationMovieUseCase());
  sl.registerSingleton<GetSimilarMovieUseCase>(GetSimilarMovieUseCase());
  sl.registerSingleton<GetRecommendationTVsUseCase>(GetRecommendationTVsUseCase());
  sl.registerSingleton<GetSimilarTVsUseCase>(GetSimilarTVsUseCase());
  sl.registerSingleton<GetTVKeywordsUseCase>(GetTVKeywordsUseCase());
}
