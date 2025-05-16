import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/models/auth/signup_req_param.dart';

import '../../../service_locator.dart';
import '../../models/auth/SigninReqParam.dart';

abstract class AuthService {
  Future<Either> signup(SignupReqParam params);

  Future<Either> signin(SigninReqParam params);
}

class AuthFirebaseServiceImpl extends AuthService {
  @override
  Future<Either> signup(SignupReqParam params) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: params.email,
            password: params.password,
          );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return Left(e.message);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return Left(e.message);
      }
    } catch (e) {
      print(e);
      return Left(e);
    }
    return Left("End of function");
  }

  @override
  Future<Either> signin(SigninReqParam params) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return Left(e.message);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return Left(e.message);
      }
    }
   return Right("Succ");
  }
}
