import 'package:Linko/core/error/exeptions.dart';
import 'package:dartz/dartz.dart';

import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/core/network/network_info.dart';
import 'package:Linko/features/streaming/data/data_sources/remote_data_source.dart';
import 'package:Linko/features/streaming/domain/repositories/streaming_repository.dart';

class StreamingRepositoryImpl implements StreamingRepository {
  final StreamingRemoteDataSource streamingRemoteDataSource;
  final NetworkInfo networkInfo;
  StreamingRepositoryImpl({
    required this.streamingRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> changeStreamStatus(String userID, bool status) async {
    if (await networkInfo.isConnected) {
      try {
        return right(await streamingRemoteDataSource.startStreaming(userID, status));
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(ConnectionFailure());
    }
  }
}
