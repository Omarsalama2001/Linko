import 'package:Linko/core/error/exeptions.dart';
import 'package:dartz/dartz.dart';

import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/core/network/network_info.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/home/data/data_sources/home_remote_datasource.dart';
import 'package:Linko/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({
    required this.networkInfo,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<UserEntity>>> getLiveUsers() async {
    if (await networkInfo.isConnected) {
      print('Network is connected, fetching live users...');
      try {
        return Right(await homeRemoteDataSource.getLiveUsers());
      } on ServerException {
        return Left(ServerFailure());
      } on NoDataException {
        return Left(NoDataFaliure());
      }
    } else {
      print('00000000000000000000000000000000000000000000000000000000000000000000000000');
      print('Network is not connected, cannot fetch live users...');
      return Left(ConnectionFailure());
    }
  }
}
