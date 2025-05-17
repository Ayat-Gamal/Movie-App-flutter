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
      switch (e.code) {
        case 'email-already-in-use':
          return Left('The email is already in use by another account.');
        case 'invalid-email':
          return Left('The email address is not valid.');
        case 'operation-not-allowed':
          return Left('Email/password accounts are not enabled.');
        case 'weak-password':
          return Left('The password is too weak. Try something stronger.');
        default:
          return Left(e.message ?? "Authentication error");
      }
    } catch (e) {
      print(e);
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either> signin(SigninReqParam params) async {
    try {
      if (params.email.isEmpty || params.password.isEmpty) {
        return Left("Email and password cannot be empty.");
      }

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return Left('No user found for that email.');
        case 'wrong-password':
          return Left('Wrong password provided for that user.');
        case 'invalid-email':
          return Left('Email address is not valid.');
        case 'user-disabled':
          return Left('This user has been disabled.');
        default:
          return Left(e.message ?? "Authentication error");
      }
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }
}
