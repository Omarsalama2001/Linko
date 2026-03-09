import 'package:Linko/core/error/exeptions.dart';
import 'package:dartz/dartz.dart';

import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/core/network/network_info.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/profile/data/data_sources/profile_remote_datasource.dart';
import 'package:Linko/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileRemoteDatasource profileRemoteDatasource;
  ProfileRepositoryImpl({
    required this.networkInfo,
    required this.profileRemoteDatasource,
  });
  @override
  Future<Either<Failure, UserEntity>> getUserProfileData() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await profileRemoteDatasource.getuserProfileData());
      } on NoDataException {
        return Left(NoDataFaliure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
