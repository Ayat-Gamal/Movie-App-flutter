import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class TVService {
  Future<Either> getPopularTV();
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
}
