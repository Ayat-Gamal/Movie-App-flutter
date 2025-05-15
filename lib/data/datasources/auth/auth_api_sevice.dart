import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';

import '../../../service_locator.dart';

abstract class AuthApiService{

  Future<Either> signup();
}


class AuthApiServiceImpl extends AuthApiService{
  @override
  Future<Either> signup() async {
 try{
    var response = await sl<DioClient>().post(
      ApiUrl.baseURL
    );
    return Right( " twsea");
 } on DioException catch(e){
   return Left(e.response!.data['message']);
 }
  }

}