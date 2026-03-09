import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/streaming/domain/repositories/streaming_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeStreamStatusUsecase {
  final StreamingRepository streamingRepository;
  ChangeStreamStatusUsecase({required this.streamingRepository});
  Future<Either<Failure, Unit>> call(String userID, bool status) {
    return streamingRepository.changeStreamStatus(userID, status);
  }
}
