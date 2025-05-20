import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();

  Future<Either> getNowPLayingMovies();
}

class MovieServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies + ApiUrl.apiKey,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getNowPLayingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.nowPlayingMovies + ApiUrl.apiKey,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
