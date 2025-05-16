import 'package:dartz/dartz.dart';

import '../../../data/models/auth/SigninReqParam.dart';
import '../../../data/models/auth/signup_req_param.dart';

abstract class AuthRepository{


  Future<Either> signup(SignupReqParam params);
  Future<Either> signin(SigninReqParam params);
  Future<bool> isLoggedIn();


}

// either => have two sides, data and
/*
* functional programming package in dart.
* It supports a type Either<Left, Right>
that meets our exact use-case.
* */
//Either<int, String> response = Right("Hello, im right");
