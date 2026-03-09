import 'package:dartz/dartz.dart';

import 'package:Linko/core/error/exeptions.dart';
import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/core/network/network_info.dart';
import 'package:Linko/features/auth/data/data_source/local_data_source/local_data_source.dart';
import 'package:Linko/features/auth/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:Linko/features/auth/data/models/user_model.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/auth/domain/repositories/auth_repository.dart';

class AuthRepoImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final RemoteDataSource authRemoteDataSource;
  final LocalDataSource localDataSource;
  AuthRepoImpl({
    required this.networkInfo,
    required this.authRemoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, UserEntity>> login({required bool isGoogle}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> loginWithEmailAndPassword(String email, String password) async {
    if (await networkInfo.isConnected) {
      print("Network is connected");
      try {
        String? token = await authRemoteDataSource.loginWithEmailAndPassword(email, password);
        localDataSource.saveToken(token: token!);
        return const Right(unit);
      } on EmailNotVerifiedException {
        return Left(EmailNotVerifiedFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on AuthException catch (error) {
        return Left(AuthFailure(errorResponse: error.errorCode));
      }
    } else {
      print("Network is not connected");
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteDataSource.logOut();
        localDataSource.removeToken();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on AuthException catch (error) {
        return Left(AuthFailure(errorResponse: error.errorCode));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await authRemoteDataSource.sendPasswordResetEmail(email: email));
      } on ServerException {
        return Left(ServerFailure());
      } on AuthException catch (error) {
        return Left(AuthFailure(errorResponse: error.errorCode));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> sendEmailVerification() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await authRemoteDataSource.sendEmailVerification());
      } on ServerException {
        return Left(ServerFailure());
      } on AuthException catch (error) {
        return Left(AuthFailure(errorResponse: error.errorCode));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp({required UserEntity userEntity, required String password}) async {
    if (await networkInfo.isConnected) {
      UserModel userModel = UserModel(name: userEntity.name, email: userEntity.email, photoUrl: userEntity.photoUrl, gender: userEntity.gender, birthDate: userEntity.birthDate, countryCode: userEntity.countryCode, uid: userEntity.uid, token: userEntity.token, liveID: userEntity.liveID, isLive: userEntity.isLive);
      try {
        await authRemoteDataSource.signUp(userModel: userModel, password: password);
        return Future.value(const Right(unit));
      } on AuthException catch (error) {
        return Left(AuthFailure(errorResponse: error.toString()));
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
