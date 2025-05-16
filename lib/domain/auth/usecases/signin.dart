import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';

import '../../../data/models/auth/SigninReqParam.dart';
import '../../../service_locator.dart';

class SigninUseCase extends UseCase<Either, SigninReqParam> {
  @override
  Future<Either> call({SigninReqParam? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
