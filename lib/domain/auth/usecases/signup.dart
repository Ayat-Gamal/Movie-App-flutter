import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/models/auth/signup_req_param.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase extends UseCase<Either,SignupReqParam>{


  @override
  Future<Either> call({ SignupReqParam? params}) async{
    return await sl<AuthRepository>().signup(params!);
  }

}