import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/data/datasources/auth/auth_firebase_service.dart';
import 'package:movie_app/data/models/auth/SigninReqParam.dart';

import '../../../domain/auth/repositories/auth.dart';
import '../../../service_locator.dart';
import '../../models/auth/signup_req_param.dart';

class AuthRepositoryImpl implements AuthRepository {

  @override
  Future<Either> signup(SignupReqParam params) async{
   return await sl<AuthService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParam params)async {
    return await sl<AuthService>().signin(params);

  }

  @override
  Future<bool> isLoggedIn() async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    print("USER ${auth.currentUser?.email}");
     return auth.currentUser != null;
  }
}
