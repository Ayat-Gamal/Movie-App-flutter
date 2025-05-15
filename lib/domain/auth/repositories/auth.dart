import 'package:dartz/dartz.dart';

abstract class AuthRepository{


  Future<Either> signup();
  Future signin();

}

// either => have two sides, data and
/*
* functional programming package in dart.
* It supports a type Either<Left, Right>
that meets our exact use-case.
* */
//Either<int, String> response = Right("Hello, im right");
