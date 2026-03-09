import 'package:Linko/core/error/exeptions.dart';
import 'package:dartz/dartz.dart';

import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/core/network/network_info.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/lounge/data/data_sources/lounge_remote_data_source.dart';
import 'package:Linko/features/lounge/domain/repositories/lounge_repository.dart';

class LoungeRepositoryImpl extends LoungeRepository {
  final NetworkInfo networkInfo;
  final LoungeRemoteDataSource loungeRemoteDataSource;
  LoungeRepositoryImpl({
    required this.networkInfo,
    required this.loungeRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<UserEntity>>> getLoungeUsers(String gender) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await loungeRemoteDataSource.getLoungeUsers(gender));
      } on ServerException {
        return Left(ServerFailure());
      } on NoDataException {
        return Left(NoDataFaliure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
