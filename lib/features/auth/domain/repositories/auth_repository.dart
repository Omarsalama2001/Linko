import 'dart:core';
import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({required bool isGoogle});
  Future<Either<Failure, Unit>> loginWithEmailAndPassword(String email, String password);
  Future<Either<Failure, Unit>> sendEmailVerification();
  Future<Either<Failure, Unit>> resetPassword({required String email});
  Future<Either<Failure, Unit>> signUp({required UserEntity userEntity, required String password});
  Future<Either<Failure, Unit>> logout();
}
