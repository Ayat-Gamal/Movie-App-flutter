import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class TVService {
  Future<Either> getPopularTV();

  Future<Either> getRecommendationTVs(int tvId);

  Future<Either> getSimilarTVs(int tvId);

  Future<Either> getKeywords(int tvId);

}

class TVServiceImpl extends TVService {
  @override
  Future<Either> getPopularTV() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTV + ApiUrl.apiKey,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/recommendations?api_key=${ApiUrl.apiKey}',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/similar?api_key=${ApiUrl.apiKey}',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getKeywords(int tvId) async{
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/keywords?api_key=${ApiUrl.apiKey}',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
