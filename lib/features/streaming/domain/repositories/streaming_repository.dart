import 'package:Linko/core/error/faliure.dart';
import 'package:dartz/dartz.dart';

abstract class StreamingRepository {
  Future<Either<Failure, Unit>> changeStreamStatus(String userID, bool status);
}
